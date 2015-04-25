local tasks = {
	{questStarted = 1510, questStorage = 65000, killsRequired = 250, raceName = 'Rotworm Queen', rewards = {{type = 'exp', values = 10000}, {type = 'money', values = 350000}, {type='item', values = {12320, 1}}}},
	{questStarted = 1511, questStorage = 65001, killsRequired = 250, raceName = 'Dragon', rewards = {{type = 'exp', values = 1070100}, {type = 'money', values = 1000000}, {type='item', values = {2522, 1}}}},
	{questStarted = 1512, questStorage = 65002, killsRequired = 400, raceName = 'Dragon Lord', rewards = {{type = 'exp', values = 3605100}, {type = 'money', values = 3000000}, {type='item', values = {9933, 1}}, {type='item', values = {6132, 1}}}},
	{questStarted = 1513, questStorage = 65003, killsRequired = 500, raceName = 'Hero', rewards = {{type = 'exp', values = 1070100}, {type = 'money', values = 1000000}, {type='item', values = {2487, 1}}, {type='item', values = {2488, 1}}, {type='item', values = {2491, 1}}, {type='item', values = {2519, 1}}}},
	{questStarted = 1514, questStorage = 65004, killsRequired = 500, raceName = 'Black Knight', rewards = {{type = 'exp', values = 1605100}, {type = 'money', values = 1000000}, {type='item', values = {12320, 1}}, {type='item', values = {9693, 1}}}},
	{questStarted = 1515, questStorage = 65005, killsRequired = 300, raceName = 'Behemoth', rewards = {{type = 'exp', values = 3605100}, {type = 'money', values = 1000000}, {type='item', values = {12320, 1}}, {type='item', values = {9693, 1}}, {type='item', values = {6132, 1}}}},
	{questStarted = 1516, questStorage = 65006, killsRequired = 100, raceName = 'Enlightened of the Cult', rewards = {{type = 'exp', values = 3905900}, {type = 'money', values = 1000000}, {type='item', values = {12320, 1}}, {type='item', values = {9693, 1}}}},
	{questStarted = 1517, questStorage = 65007, killsRequired = 155, raceName = 'Bog Raider', rewards = {{type = 'exp', values = 2605100}, {type = 'money', values = 1000000}, {type='item', values = {12320, 1}}, {type='item', values = {9693, 1}}, {type='item', values = {2506, 1}}}},
	{questStarted = 1518, questStorage = 65008, killsRequired = 150, raceName = 'Cyclops Smith', rewards = {{type = 'exp', values = 30000}, {type = 'money', values = 1000000}, {type='item', values = {9693, 1}}}},
	{questStarted = 1519, questStorage = 65009, killsRequired = 105, raceName = 'Destroyer', rewards = {{type = 'exp', values = 2000000}, {type = 'money', values = 1000000}, {type='item', values = {12320, 1}}}},
	{questStarted = 1520, questStorage = 65010, killsRequired = 1100, raceName = 'Diabolic Imp', rewards = {{type = 'exp', values = 9168750}, {type = 'money', values = 2000000}, {type='item', values = {12320, 1}}, {type='item', values = {9933, 1}}, {type='item', values = {7735, 1}}}},
	{questStarted = 1521, questStorage = 65011, killsRequired = 360, raceName = 'Fury', rewards = {{type = 'exp', values = 4456000}, {type = 'money', values = 1000000}, {type='item', values = {12320, 1}}, {type='item', values = {9693, 1}}, {type='item', values = {2329, 1}}}},
	{questStarted = 1522, questStorage = 65012, killsRequired = 250, raceName = 'Ghastly Dragon', rewards = {{type = 'exp', values = 600000}, {type = 'money', values = 1000000}, {type='item', values = {12320, 1}}, {type='item', values = {9693, 1}}, {type='item', values = {2469, 1}}}},	
	{questStarted = 1523, questStorage = 65013, killsRequired = 555, raceName = 'Grim Reaper', rewards = {{type = 'exp', values = 8685450}, {type = 'money', values = 1000000}, {type='item', values = {9693, 1}}, {type='item', values = {9693, 1}}, {type='item', values = {9693, 1}}}},	
	{questStarted = 1524, questStorage = 65014, killsRequired = 1500, raceName = 'Giant Spider', rewards = {{type = 'exp', values = 3605100}, {type = 'money', values = 1000000}, {type='item', values = {12320, 1}}, {type='item', values = {12320, 1}}}},	
	{questStarted = 1525, questStorage = 65015, killsRequired = 230, raceName = 'Hand of Cursed Fate', rewards = {{type = 'exp', values = 9500000}, {type = 'money', values = 1000000}, {type='item', values = {8266, 1}}, {type='item', values = {2492, 1}}}},	
	{questStarted = 1526, questStorage = 65016, killsRequired = 500, raceName = 'Hellfire Fighter', rewards = {{type = 'exp', values = 7500000}, {type = 'money', values = 1000000}, {type='item', values = {5785, 1}}}},	
	{questStarted = 1527, questStorage = 65017, killsRequired = 300, raceName = 'Hellspawn', rewards = {{type = 'exp', values = 2000100}, {type = 'money', values = 1000000}, {type='item', values = {12320, 1}}, {type='item', values = {9693, 1}}}},	
	{questStarted = 1528, questStorage = 65018, killsRequired = 900, raceName = 'Hydra', rewards = {{type = 'exp', values = 5550000}, {type = 'money', values = 1000000}, {type='item', values = {12320, 1}}, {type='item', values = {9693, 1}}}},	
	{questStarted = 1529, questStorage = 65019, killsRequired = 100, raceName = 'Ice Golem', rewards = {{type = 'exp', values = 3605100}, {type = 'money', values = 1000000}, {type='item', values = {12320, 1}}}},	
	{questStarted = 1530, questStorage = 65020, killsRequired = 255, raceName = 'Infernalist', rewards = {{type = 'exp', values = 6000000}, {type = 'money', values = 1000000}, {type='item', values = {2390, 1}}}},	
	{questStarted = 1531, questStorage = 65021, killsRequired = 700, raceName = 'Medusa', rewards = {{type = 'exp', values = 5550000}, {type = 'money', values = 1000000}, {type='item', values = {8850, 1}}}},	
	{questStarted = 1532, questStorage = 65022, killsRequired = 550, raceName = 'Hellhound', rewards = {{type = 'exp', values = 8000000}, {type = 'money', values = 1000000}, {type='item', values = {7450, 1}}}},	
	{questStarted = 1533, questStorage = 65023, killsRequired = 250, raceName = 'Plaguesmith', rewards = {{type = 'exp', values = 6355000}, {type = 'money', values = 1000000}, {type='item', values = {8925, 1}}}},	
	{questStarted = 1534, questStorage = 65024, killsRequired = 200, raceName = 'Serpent Spawn', rewards = {{type = 'exp', values = 7605100}, {type = 'money', values = 1000000}, {type='item', values = {12320, 1}}, {type='item', values = {9693, 1}}}},	
	{questStarted = 1535, questStorage = 65025, killsRequired = 400, raceName = 'Undead Dragonon', rewards = {{type = 'exp', values = 8500000}, {type = 'money', values = 1000000}, {type='item', values = {8903, 1}}}},	
	{questStarted = 1536, questStorage = 65026, killsRequired = 300, raceName = 'Warlock', rewards = {{type = 'exp', values = 6000000}, {type = 'money', values = 1000000}, {type='item', values = {7422, 1}}}},	
	{questStarted = 1537, questStorage = 65027, killsRequired = 500, raceName = 'Demon', rewards = {{type = 'exp', values = 9505100}, {type = 'money', values = 1000000}, {type='item', values = {12320, 1}}, {type='item', values = {9693, 1}}, {type='item', values = {10518, 1}}, {type='item', values = {10518, 1}}}},	
	{questStarted = 1538, questStorage = 65028, killsRequired = 250, raceName = 'Yeti', rewards = {{type = 'exp', values = 9505100}, {type = 'money', values = 11000000}, {type='item', values = {6132, 1}}, {type='item', values = {9933, 1}}}},	
	{questStarted = 1539, questStorage = 65029, killsRequired = 300, raceName = 'Wyrm', rewards = {{type = 'exp', values = 3000000}, {type = 'money', values = 11000000}, {type='item', values = {12320, 1}}, {type='item', values = {9693, 1}}}},
	{questStarted = 1540, questStorage = 65030, killsRequired = 550, raceName = 'Defiler', rewards = {{type = 'exp', values = 8000000}, {type = 'money', values = 11000000}, {type='item', values = {8905, 1}}}},
	{questStarted = 1541, questStorage = 65031, killsRequired = 800, raceName = 'Nightmare', rewards = {{type = 'exp', values = 8000000}, {type = 'money', values = 11000000}, {type='item', values = {6391, 1}}, {type='item', values = {12320, 1}}}},
	
	}
 
 
 
local rankStorage = 32150
local choose = {}
 
local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local voc = {}
 
function onCreatureAppear(cid)                          npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid)                       npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg)                  npcHandler:onCreatureSay(cid, type, msg) end
function onThink()                                      npcHandler:onThink() end
 
function creatureSayCallback(cid, type, msg)
 
	if(not npcHandler:isFocused(cid)) then
		return false
	end
	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_PRIVATE and 0 or cid
	if msgcontains(msg, "task") then
		selfSay("There you can see the following tasks, please tell me the number of the task that you want to do.", cid)
		local text = "Number  -  Name"
		for i = 1, table.maxn(tasks) do
			text = text .. "\n" .. i .. "  -  " .. tasks[i].raceName .. (getCreatureStorage(cid, tasks[i].questStarted) == 2 and " [Done]" or "")
		end
		doShowTextDialog(cid, 5956, text)
 
	elseif tasks[tonumber(msg)] then
		msg = tonumber(msg)
		if getCreatureStorage(cid, tasks[msg].questStarted) == 1 then
			selfSay("You are already making this task.", cid)
			talkState[talkUser] = 0
			return true
		end
		if getCreatureStorage(cid, tasks[msg].questStarted) == 2 then
			selfSay("You already finished this task.", cid)
			talkState[talkUser] = 0
			return true
		end
		if tasks[msg].level and getPlayerLevel(cid) < tasks[msg].level then
			selfSay("You need level " .. tasks[msg].level .. " or higher to make this task.", cid)
			talkState[talkUser] = 0
			return true
		end
		for k, v in pairs(tasks) do
			if getCreatureStorage(cid, v.questStarted) == 1 and tasks[msg] ~= k then
				selfSay("You are already making a task.", cid)
				talkState[talkUser] = 0
				return true
			end
		end
		selfSay("Are you sure that do you want to start the task number " .. msg .. "?. In this task you will need to defeat " .. tasks[msg].killsRequired .. " " .. tasks[msg].raceName .. ".", cid)
		choose[cid] = msg
		talkState[talkUser] = 1
	elseif msgcontains(msg, "yes") and talkState[talkUser] == 1 then
		doCreatureSetStorage(cid, tasks[choose[cid]].questStarted, 1)
		selfSay("You have started the task number " .. choose[cid] .. ", remember... in this task you will need to defeat " .. tasks[choose[cid]].killsRequired .. " " .. tasks[choose[cid]].raceName .. ". Good luck!", cid)
		talkState[talkUser] = 0
 
	elseif msgcontains(msg, "report") then
		for k, v in pairs(tasks) do
			if getCreatureStorage(cid, v.questStarted) == 1 then
				if getCreatureStorage(cid, v.questStorage) >= v.killsRequired then
					for i = 1, table.maxn(v.rewards) do
						if(v.rewards[i].enable) then
							if isInArray({"boss", "teleport", 1}, v.rewards[i].type) then
								doTeleportThing(cid, v.rewards[i].values)
							elseif isInArray({"exp", "experience", 2}, v.rewards[i].type) then
								doPlayerAddExperience(cid, v.rewards[i].values)
							elseif isInArray({"item", 3}, v.rewards[i].type) then
								doPlayerAddItem(cid, v.rewards[i].values[1], v.rewards[i].values[2])
							elseif isInArray({"money", 4}, v.rewards[i].type) then
								doPlayerAddMoney(cid, v.rewards[i].values)
							elseif isInArray({"storage", "stor", 5}, v.rewards[i].type) then
								doCreatureSetStorage(cid, v.rewards[i].values[1], v.rewards[i].values[2])
							elseif isInArray({"points", "rank", 2}, v.rewards[i].type) then
								doCreatureSetStorage(cid, rankStorage, getCreatureStorage(cid, rankStorage) + v.rewards[i].values)
							else
								print("[Warning - Error::Killing in the name of::Tasks config] Bad reward type: " .. v.rewards[i].type .. ", reward could not be loaded.")
							end
						end
					end
					local rank = getCreatureStorage(cid, rankStorage)
					selfSay("Great!... you have finished the task number " .. k .. "" .. (rank > 4 and ", you are a " or "") .. "" .. (((rank > 4 and rank < 10) and ("Huntsman") or (rank > 9 and rank < 20) and ("Ranger") or (rank > 19 and rank < 30) and ("Big Game Hunter") or (rank > 29 and rank < 50) and ("Trophy Hunter") or (rank > 49) and ("Elite Hunter")) or "") .. ". Good job.", cid)
					doCreatureSetStorage(cid, v.questStarted, 2)
					break
				else
					if getCreatureStorage(cid, v.questStorage) < 0 then
						doCreatureSetStorage(cid, v.questStorage, 0)
					end
					selfSay("Current " .. getCreatureStorage(cid, v.questStorage) .. " " .. v.raceName .. " killed, you need to kill " .. v.killsRequired .. ".", cid)
					break
				end
			end
		end
	end
	return true
end
 
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())