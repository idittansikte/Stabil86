

local goldCoins = {
	[2148] = {worth = 1},
	[2152] = {worth = 100},
	[2160] = {worth = 10000},
	[2157] = {worth = 1000000}
}
local maximumAllowedBet = 1000000

function onAddItem(moveItem, tileItem, position, cid)
local goldCountStore = getPlayerStorageValue(cid, bjBet)
local v = goldCoins[moveItem.itemid]
local goldWeight = getItemWeight(moveItem.uid) * 10
------------------------------------------------
	if (v and getStorage(bjStorage) == 1 and getStorage(bjStart) ~= 1 and getPlayerStorageValue(cid, bjBet) < 1) then
		local a = {cid = cid, name = getCreatureName(cid), score = 0, cards = {}, done = 0, bust = 0}
		table.insert(bjPlayers, a)
		doRemoveItem(moveItem.uid)
		doSendMagicEffect(position, 3)
		for i=1, #bjPlayers do
			if bjPlayers[i].name == getCreatureName(cid) then
				setPlayerStorageValue(cid, bjStor, i)
			end
		end
		if (cid == bjPlayers[1].cid and getPlayerStorageValue(bjPlayers[1].cid, bjBet) < 1) then
			maxbet = maximumAllowedBet
		else
			maxbet = getPlayerStorageValue(bjPlayers[1].cid, bjBet)
		end
		if maxbet == goldWeight * v.worth then
			if goldCountStore > 0 then
				setPlayerStorageValue(cid, bjBet, goldCountStore + (goldWeight * v.worth))
			else
				setPlayerStorageValue(cid, bjBet, goldWeight * v.worth)
			end
			addEvent(doSendAnimatedText, 500, getCreaturePos(cid), "-" .. getPlayerStorageValue(cid, bjBet), COLOR_RED)
			doPlayerSendTextMessage(cid, 19, "You've bet " .. getPlayerStorageValue(cid, bjBet) .. " gold.")
		elseif (maxbet > goldWeight * v.worth) then
			if getPlayerStorageValue(bjPlayers[1].cid, bjBet) > 1 then
				doPlayerSendTextMessage(cid, 19, "You must match the bet of " .. maxbet .. " gold.")
				bjPlayers = deleteValueFromArray(bjPlayers, a)
				doPlayerAddMoney(cid,(goldWeight*v.worth))
			else
				if goldCountStore > 0 then
					setPlayerStorageValue(cid, bjBet, goldCountStore + (goldWeight * v.worth))
				else
					setPlayerStorageValue(cid, bjBet, goldWeight * v.worth)
				end
				addEvent(doSendAnimatedText, 500, getCreaturePos(cid), "-" .. getPlayerStorageValue(cid, bjBet), COLOR_RED)
				doPlayerSendTextMessage(cid, 19, "You've bet " .. getPlayerStorageValue(cid, bjBet) .. " gold.")
			end
		else
			doPlayerAddMoney(cid,(goldWeight*v.worth)-maxbet)
			setPlayerStorageValue(cid, bjBet, maxbet)
			addEvent(doSendAnimatedText, 500, getCreaturePos(cid), "-" .. getPlayerStorageValue(cid, bjBet), COLOR_RED)
			doPlayerSendTextMessage(cid, 19, "You may only bet a max of " .. maxbet .. " gold this round.  Your current bet is " .. getPlayerStorageValue(cid, bjBet) .. " gold.")
		end
		buyIn = getPlayerStorageValue(bjPlayers[1].cid, bjBet)
	else
		doSendMagicEffect(position, CONST_ME_POFF)
	end
	return true
end