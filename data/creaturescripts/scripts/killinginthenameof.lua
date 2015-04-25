local questCreatures =
{
	["Rotworm Queen"] = {questStarted = 1510, questStorage = 65000, creatureStorage = 15000, killsRequired = 250, raceName = "Rotworm Queen"},
	["Dragon"] = {questStarted = 1511, questStorage = 65001, creatureStorage = 15001, killsRequired = 250, raceName = "Dragon"},
	["Dragon Lord"] = {questStarted = 1512, questStorage = 65002, creatureStorage = 15002, killsRequired = 400, raceName = "Dragon Lord"},
	["Hero"] = {questStarted = 1513, questStorage = 65003, creatureStorage = 15003, killsRequired = 500, raceName = "Hero"},
	["Black Knight"] = {questStarted = 1514, questStorage = 65004, creatureStorage = 15004, killsRequired = 500, raceName = "Black Knight"},
	["Behemoth"] = {questStarted = 1515, questStorage = 65005, creatureStorage = 15005, killsRequired = 300, raceName = "Behemoth"},
	["Enlightened of the Cult"] = {questStarted = 1516, questStorage = 65006, creatureStorage = 15006, killsRequired = 100, raceName = "Enlightened of the Cult"},
	["Bog Raider"] = {questStarted = 1517, questStorage = 65007, creatureStorage = 15007, killsRequired = 155, raceName = "Bog Raider"},
	["Cyclops Smith"] = {questStarted = 1518, questStorage = 65008, creatureStorage = 15008, killsRequired = 150, raceName = "Cyclops Smith"},
	["Destroyer"] = {questStarted = 1519, questStorage = 65009, creatureStorage = 15009, killsRequired = 105, raceName = "Destroyer"},
	["Diabolic Imp"] = {questStarted = 1520, questStorage = 65010, creatureStorage = 15010, killsRequired = 110, raceName = "Diabolic Imp"},
	["Fury"] = {questStarted = 1521, questStorage = 65011, creatureStorage = 15011, killsRequired = 360, raceName = "Fury"},
	["Ghastly Dragon"] = {questStarted = 1522, questStorage = 65012, creatureStorage = 15012, killsRequired = 250, raceName = "Ghastly Dragon"},
	["Grim Reaper"] = {questStarted = 1523, questStorage = 65013, creatureStorage = 15013, killsRequired = 555, raceName = "Grim Reaper"},
	["Giant Spider"] = {questStarted = 1524, questStorage = 65014, creatureStorage = 15014, killsRequired = 1500, raceName = "Giant Spider"},
	["Hand of Cursed Fate"] = {questStarted = 1525, questStorage = 65015, creatureStorage = 15015, killsRequired = 230, raceName = "hand of cursed fate"},
	["Hellfire Fighter"] = {questStarted = 1526, questStorage = 65016, creatureStorage = 15016, killsRequired = 500, raceName = "hellfire fighter"},
	["Hellspawn"] = {questStarted = 1527, questStorage = 65017, creatureStorage = 15017, killsRequired = 300, raceName = "hellspawn"},
	["Hydra"] = {questStarted = 1528, questStorage = 65018, creatureStorage = 15018, killsRequired = 900, raceName = "hydra"},
	["Ice Golem"] = {questStarted = 1529, questStorage = 65019, creatureStorage = 15019, killsRequired = 100, raceName = "ice golem"},
	["Infernalist"] = {questStarted = 1530, questStorage = 65020, creatureStorage = 15020, killsRequired = 255, raceName = "infernalist"},
	["Medusa"] = {questStarted = 1531, questStorage = 65021, creatureStorage = 15021, killsRequired = 700, raceName = "medusa"},
	["Hellhound"] = {questStarted = 1532, questStorage = 65022, creatureStorage = 15022, killsRequired = 550, raceName = "hellhound"},
	["Plaguesmith"] = {questStarted = 1533, questStorage = 65023, creatureStorage = 15023, killsRequired = 250, raceName = "plaguesmith"},
	["Serpent spawn"] = {questStarted = 1534, questStorage = 65024, creatureStorage = 15024, killsRequired = 200, raceName = "serpent spawn"},
	["undead dragon"] = {questStarted = 1535, questStorage = 65025, creatureStorage = 15025, killsRequired = 300, raceName = "undead dragon"},
	["warlock"] = {questStarted = 1536, questStorage = 65026, creatureStorage = 15026, killsRequired = 300, raceName = "warlock"},
	["demon"] = {questStarted = 1537, questStorage = 65027, creatureStorage = 15027, killsRequired = 500, raceName = "demon"},
	["yeti"] = {questStarted = 1538, questStorage = 65028, creatureStorage = 15028, killsRequired = 250, raceName = "yeti"},
	["wyrm"] = {questStarted = 1539, questStorage = 65029, creatureStorage = 15029, killsRequired = 300, raceName = "wyrm"},
	["defiler"] = {questStarted = 1540, questStorage = 65030, creatureStorage = 15030, killsRequired = 550, raceName = "defiler"},
	["nightmare"] = {questStarted = 1541, questStorage = 65031, creatureStorage = 15031, killsRequired = 800, raceName = "nightmare"},
	
}
local msgType = MESSAGE_STATUS_CONSOLE_ORANGE
 
function onKill(cid, target, lastHit)

 
local creature = questCreatures[getCreatureName(target)]
 
	if creature then
	
		if isPlayer(target) or isSummon(target) then return true end
		
 
		if getCreatureStorage(cid, creature.questStarted) > 0 then
			
			if getCreatureStorage(cid, creature.questStorage) < creature.killsRequired then
				if getCreatureStorage(cid, creature.questStorage) < 0 then
				
					doCreatureSetStorage(cid, creature.questStorage, 0)
				end
					
				if getCreatureStorage(cid, creature.creatureStorage) < 0 then
					doCreatureSetStorage(cid, creature.creatureStorage, 0)
					
				end
				doCreatureSetStorage(cid, creature.questStorage, getCreatureStorage(cid, creature.questStorage) + 1)
				doCreatureSetStorage(cid, creature.creatureStorage, getCreatureStorage(cid, creature.creatureStorage) + 1)
				
				doPlayerSendTextMessage(cid, msgType, getCreatureStorage(cid, creature.creatureStorage) .. " " .. getCreatureName(target) .. " defeated. Total [" .. getCreatureStorage(cid, creature.questStorage) .. "/" .. creature.killsRequired .. "] " .. creature.raceName .. ".")
			end
		end
	end
	return true
end