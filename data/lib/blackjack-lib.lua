-- Blackjack Casino Game by da Bintz man --


		bjStorage = 12358
		bjStart = 12359
		bjBet = 12360
		bjTurn = 12361
		cardOne = 12362
		cardTwo = 12363
		cardThree = 12364
		cardFour = 12365
		cardFive = 12366
		cardSix = 12367
		cardSeven = 12368
		cardEight = 12369
		cardNine = 12370
		cardTen = 12371
		cardEleven = 12372
		cardScore = 12373
		bjStor = 12374
		bjDone = 12375
		-- 12376 taken
		bjPlayers = {}


		deck = {
		{name="Ace", value=11, stor=1}, {name="Two", value=2, stor=2}, 
		{name="Three", value=3, stor=3}, {name="Four", value=4, stor=4}, 
		{name="Five", value=5, stor=5}, {name="Six", value=6, stor=6}, 
		{name="Seven", value=7, stor=7}, {name="Eight", value=8, stor=8}, 
		{name="Nine", value=9, stor=9}, {name="Ten", value=10, stor=10}, 
		{name="Jack", value=10, stor=11}, {name="Queen", value=10, stor=12}, 
		{name="King", value=10, stor=13}
		}
		--------------------------------
		--------------------------------

		function round(num, idp)
		  return tonumber(string.format("%." .. (idp or 0) .. "f", num))
		end
		--------------------------------
		--------------------------------
		function clearS()
			for _, cid in ipairs(getPlayersOnline()) do
				for i = 0, 16 do
					setPlayerStorageValue(cid, 12360+i, 0)
				end
			end
			doSetStorage(bjStorage, 0)
			doSetStorage(bjStart, 0)
			doSetStorage(bjTurn, 1)
			bjPlayers = {}
			buyIn = nil
		end
		--------------------------------
		--------------------------------
		function inArray(array, value)
			for _, v in ipairs(array) do
				if v == value then
					return true
				end
			end
			return false
		end
		--------------------------------
		--------------------------------
		function addCards()
			if getStorage(bjStorage) == 1 then
				for _, cid in ipairs(getPlayersOnline()) do
					for i=3, 11 do
						local storageValue = 12361+i
						if (getPlayerStorageValue(cid, storageValue) > 0 and bjPlayers[getPlayerStorageValue(cid, bjStor)].name == getCreatureName(cid)) then
							local char = bjPlayers[getPlayerStorageValue(cid, bjStor)]
							local card = char.cards[i]
							if (not card and getPlayerStorageValue(cid, storageValue) > 0) then
								local pos = getCreaturePosition(cid)
								table.insert(char.cards, deck[getPlayerStorageValue(cid, storageValue)])
								doPlayerSendTextMessage(char.cid, 19, "You drew a " .. deck[getPlayerStorageValue(cid, storageValue)].name .. ".")
								char.score = char.score + deck[getPlayerStorageValue(cid, storageValue)].value
								addEvent(dealEffect, 2000, pos, deck[getPlayerStorageValue(cid, storageValue)], betPos)
								addEvent(setPlayerStorageValue, 2000, cid, 12376, 0)
								if char.score < 22 then
									doSendAnimatedText(pos, "Hit!", COLOR_RED)
								elseif (inArray(char.cards, deck[1]) == true and char.score > 21) then
									for _, c in ipairs(char.cards) do
										if (c.value == 11 and c.p ~= 1) then
											char.score = char.score - 10
											c.p = 1
										end
									end
									if char.score < 22 then
										doSendAnimatedText(pos, "Hit!", COLOR_RED)
									else
										char.bust = 1
										char.done = 1
										doSendAnimatedText(pos, "Bust!", COLOR_RED)
									end
									
								else
									char.bust = 1
									char.done = 1
									doSendAnimatedText(pos, "Bust!", COLOR_RED)
								end
							end
						end
					end
					if (getPlayerStorageValue(cid, bjDone) == 1) then
						bjPlayers[getPlayerStorageValue(cid, bjStor)].done = 1
						doSendAnimatedText(getCreaturePosition(cid), "Stay!", COLOR_RED)
						setPlayerStorageValue(cid, bjDone, 2)
						setPlayerStorageValue(cid, 12376, 0)
						nextTurn()
					end
				end
				addEvent(addCards, 2000)
			else
				return false
			end
			return true
		end

		--------------------------------
		--------------------------------
		function sendCards()
			if getStorage(bjStart) == 1 then
				for _, p in ipairs(bjPlayers) do
					if p.bust ~= 1 then
						local str = "Cards: "
						for i, v in ipairs(p.cards) do
							if i ~= #p.cards then
								str = str .. v.name .. ", "
							else
								str = str .. v.name .. ".   |    Total: " .. p.score
							end
						end
						doPlayerSendCancel(p.cid, str)
					end
				end
				addEvent(sendCards, 2000)
			else
				return false
			end
			return true
		end
		--------------------------------
		--------------------------------

		function sendNames()
			if (getStorage(bjStorage) == 1) then
				if (getStorage(bjStart) == 1) then
					doSendAnimatedText(hitPos, "Hit", COLOR_YELLOW)
					doSendAnimatedText(stayPos, "Stay", COLOR_YELLOW)
				else
					doSendAnimatedText(betPos, "Bet!", COLOR_YELLOW)
					if (buyIn) then
						addEvent(doSendAnimatedText, 1500, betPos, buyIn .. " gp", COLOR_YELLOW)
					end
				end
				addEvent(sendNames, 3000)
			else
				return false
			end
			return true
		end
		-------------------------------------------
		-------------------------------------------
		local function shoot(p, card)
			local str = ""
			local c = 0
			if (card == p.cards[1] and c == 0) then
				str = "(Hidden)"
				c = c + 1
			else
				str = card.name
			end
			doSendMagicEffect(getThingPos(p.cid), CONST_ME_CRAPS)
			doSendDistanceShoot(betPos, getThingPos(p.cid), CONST_ANI_ENERGYBALL)
			doSendAnimatedText(getThingPos(p.cid), str, COLOR_RED)
			return true
		end
		----------------------------------------
		----------------------------------------
		function roundStart()
			local delay = 100
			doSetStorage(bjStart, 1)
			if #bjPlayers > 1 then
				doSetStorage(bjTurn, 1)
				for _, p in ipairs(bjPlayers) do
					local card1 = deck[math.random(#deck)]
					local card2 = deck[math.random(#deck)]
					table.insert(p.cards, card1)
					table.insert(p.cards, card2)
					setPlayerStorageValue(p.cid, cardOne, card1.stor)
					setPlayerStorageValue(p.cid, cardTwo, card2.stor)
					p.score = card1.value + card2.value
					addEvent(shoot, delay, p, card1)
					addEvent(shoot, (1000*#bjPlayers)+delay, p, card2)
					delay = delay + 1000
					for _, c in ipairs(deck) do
						c.p = 0
					end
				end
				sendCards()
				addCards()
				addEvent(exploEffect, (1000*#bjPlayers)+delay, bjPlayers[1].cid)
			else
				if (bjPlayers[1]) then
					doPlayerSendTextMessage(bjPlayers[1].cid, 19, "You must find someone else to play with!")
					doPlayerAddMoney(bjPlayers[1].cid, getPlayerStorageValue(bjPlayers[1].cid, bjBet))
					setPlayerStorageValue(bjPlayers[1].cid, bjBet, 0)
				end
				clearS()
			end
			return true
		end
			
		----------------------------------------
		----------------------------------------
		function exploEffect(cid)
			local k = getThingPos(cid)
			local r = {
				{pos = {x = k.x + 2, y = k.y - 2, z = k.z}, delay = 300},
				{pos = {x = k.x + 2, y = k.y + 2, z = k.z}, delay = 300},
				{pos = {x = k.x - 2, y = k.y + 2, z = k.z}, delay = 300},
				{pos = {x = k.x - 2, y = k.y, z = k.z}, delay = 300},
				{pos = {x = k.x - 2, y = k.y - 2, z = k.z}, delay = 300},
				{pos = {x = k.x, y = k.y - 2, z = k.z}, delay = 300}
			}
			local effects = {27, 28, 29, 30}
			for i = 1, 6 do
				addEvent(doSendDistanceShoot, r[i].delay, r[i].pos, k, CONST_ME_FIREWORK_YELLOW)
			end
			for i = 1, 4 do
				addEvent(doSendMagicEffect, 1000, getThingPos(cid), effects[i])
			end
			return true
		end
		--------------------------------
		--------------------------------
		function endGame()
			local highScore = 0
			local winners = {}
			local allBets = 0
			for _, player in ipairs(bjPlayers) do
				if player.score > highScore and player.score < 22 then
					highScore = player.score
				end
				allBets = allBets + getPlayerStorageValue(player.cid, bjBet)
			end
			for _, player in ipairs(bjPlayers) do
				if player.score == highScore then
					table.insert(winners, player)
				else
					doSendAnimatedText(getCreaturePosition(player.cid), "Total: " .. player.score, COLOR_RED)
					doPlayerSendTextMessage(player.cid, 19, "Sorry, you've lost.")
				end
			end
			local payout = round(allBets/#winners)
			for _, winner in ipairs(winners) do
				doPlayerAddMoney(winner.cid, payout)
				doSendAnimatedText(getCreaturePosition(winner.cid), "Total: " .. winner.score, COLOR_GREEN)
				doPlayerSendTextMessage(winner.cid, 19, "Congratulations you've won " .. payout .. " gold!")
				exploEffect(winner.cid)
			end
			for _, player in ipairs(bjPlayers) do
				setPlayerStorageValue(player.cid, bjBet, 0)
			end
			clearS()
			return true
		end
		--------------------------------
		--------------------------------
		function nextTurn()
			if getStorage(bjStorage) == 1 then
				local activePlayers = {}
				local busted = {}
				local largestI = 0
				local lastTurn = getStorage(bjTurn)
				local newTurn = 0
				
				for i, p in ipairs(bjPlayers) do
					if (p.done ~= 1) then
						table.insert(activePlayers, p)
						if (newTurn == 0 and i > lastTurn) then
							newTurn = i
						end
						if (i > largestI) then
							largestI = i
						end
					end
					if (p.bust == 1) then
						table.insert(busted, p)
					end
				end
				
				
				local notBusted = #bjPlayers - #busted
				
				if (#activePlayers == 0) then
					endGame()
				elseif (#activePlayers == 1) then
					if (notBusted and notBusted == 1) then
						endGame()
					else
						doSetStorage(bjTurn, getPlayerStorageValue(activePlayers[1].cid, bjStor))
					end
				elseif lastTurn >= largestI then
					doSetStorage(bjTurn, getPlayerStorageValue(activePlayers[1].cid, bjStor))
				else
					doSetStorage(bjTurn, newTurn)
				end
				
				largestI = 0
				doPlayerSendTextMessage(getCreatureByName("GOD Herold"), 19, "turn: " .. getStorage(bjTurn))
				local turnChar = bjPlayers[getStorage(bjTurn)]
				for _, a in ipairs(activePlayers) do
					if a == turnChar then
						doPlayerSendTextMessage(a.cid, 19, "It's your turn.")
						exploEffect(a.cid)
					else
						doPlayerSendTextMessage(a.cid, 19, "It's " .. turnChar.name .. "'s turn.")
					end
				end
			end
			return true
		end
		--------------------------------
		--------------------------------
		function dealEffect(pos, card, frompos)
			doSendMagicEffect(pos, CONST_ME_CRAPS)
			doSendDistanceShoot(frompos, pos, CONST_ANI_ENERGYBALL)
			doSendAnimatedText(pos, card.name, COLOR_RED)
			nextTurn()
			return true
		end
		--------------------------------
		--------------------------------