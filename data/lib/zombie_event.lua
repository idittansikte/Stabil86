-- CONFIG
ZE_DEFAULT_NUMBER_OF_PLAYERS = 10
ZE_MIN_NUMBER_OF_PLAYERS = 3
ZE_ACCESS_TO_IGNORE_ARENA = 3
ZE_KICKTIME = 180
-- POSITIONS
ZE_blockEnterItemPosition = {x= 881, y=857, z=6}
ZE_enterPosition = {x=881, y=863, z=7}
ZE_kickPosition = {x=883, y=855, z=6}
ZE_spawnFromPosition = {x = 874, y = 856, z = 7}
ZE_spawnToPosition = {x = 888, y = 870, z = 7}
-- ITEM IDS
ZE_blockEnterItemID = 8633
-- STORAGES
-- - player
ZE_isOnZombieArea = 34370
-- - global
ZE_STATUS = 34370 -- =< 0 - off, 1 - waiting for players, 2 - is running
ZE_PLAYERS_NUMBER = 34371
ZE_ZOMBIES_TO_SPAWN = 34372
ZE_ZOMBIES_SPAWNED = 34373
ZE_ZOMBIES_FIGHT_TIME = 34377

-- FUNCTION
 
function setZombiesEventPlayersLimit(value)
	doSetStorage(ZE_PLAYERS_NUMBER, value)
end
 
function getZombiesEventPlayersLimit()
	return getStorage(ZE_PLAYERS_NUMBER)
end
 
function addPlayerToZombiesArea(cid)
	doSendMagicEffect(getThingPosition(cid), CONST_ME_TELEPORT)
	doTeleportThing(cid, ZE_enterPosition, true)
	doSendMagicEffect(getThingPosition(cid), CONST_ME_TELEPORT)
	if(getPlayerAccess(cid) < ZE_ACCESS_TO_IGNORE_ARENA) then
		setPlayerZombiesEventStatus(cid, os.time())
	end
end
 
function kickPlayerFromZombiesArea(cid)
	doSendMagicEffect(getThingPosition(cid), CONST_ME_TELEPORT)
	doTeleportThing(cid, ZE_kickPosition, true)
	doSendMagicEffect(getThingPosition(cid), CONST_ME_TELEPORT)
	setPlayerZombiesEventStatus(cid, 0)
end
 
function getPlayerZombiesEventStatus(cid)
	return getCreatureStorage(cid, ZE_isOnZombieArea)
end
 
function setPlayerZombiesEventStatus(cid, value)
	doCreatureSetStorage(cid, ZE_isOnZombieArea, value)
end
 
function getZombiesEventPlayers()
	local players = {}
	for i, cid in pairs(getPlayersOnline()) do
		if(getPlayerZombiesEventStatus(cid) > 0) then
			table.insert(players, cid)
		end
	end
	return players
end
 
function getZombiesCount()
	return getStorage(ZE_ZOMBIES_SPAWNED)
end
 
function addZombiesCount()
	doSetStorage(ZE_ZOMBIES_SPAWNED, getStorage(ZE_ZOMBIES_SPAWNED)+1)
end
 
function resetZombiesCount()
	doSetStorage(ZE_ZOMBIES_SPAWNED, 0)
end
 
function getZombiesToSpawnCount()
	return getStorage(ZE_ZOMBIES_TO_SPAWN)
end
 
function setZombiesToSpawnCount(count)
	doSetStorage(ZE_ZOMBIES_TO_SPAWN, count)
end
 
function addZombiesEventBlockEnterPosition()
	if(getTileItemById(ZE_blockEnterItemPosition, ZE_blockEnterItemID).uid == 0) then
		doCreateItem(ZE_blockEnterItemID, 1, ZE_blockEnterItemPosition)
	end
end
 
function removeZombiesEventBlockEnterPosition()
	local item = getTileItemById(ZE_blockEnterItemPosition, ZE_blockEnterItemID)
	if(item.uid ~= 0) then
		doRemoveItem(item.uid)
	end
end
 
function spawnNewZombie()
	local posx = {}
	local posy = {}
	local posz = {}
	local pir = {}
	for i=1, 5 do
		local posx_tmp = math.random(ZE_spawnFromPosition.x ,ZE_spawnToPosition.x)
		local posy_tmp = math.random(ZE_spawnFromPosition.y ,ZE_spawnToPosition.y)
		local posz_tmp = math.random(ZE_spawnFromPosition.z ,ZE_spawnToPosition.z)
		local pir_tmp = 0
		local spec = getSpectators({x=posx_tmp, y=posy_tmp, z=posz_tmp}, 3, 3, false)
		if(spec and #spec > 0) then
			for z, pid in pairs(spec) do
				if(isPlayer(pid)) then
					pir_tmp = pir_tmp + 1
				end
			end
		end
		posx[i] = posx_tmp
		posy[i] = posy_tmp
		posz[i] = posz_tmp
		pir[i] = pir_tmp
	end
	local lowest_i = 1
	for i=2, 5 do
		if(pir[i] < pir[lowest_i]) then
			lowest_i = i
		end
	end
	local ret = (type(doCreateMonster("Zombie Event", {x=posx[lowest_i], y=posy[lowest_i], z=posz[lowest_i]}, false)) == 'number')
	if(ret) then
		addZombiesCount()
	end
	return ret
end




function kickPlayers()
	if(getStorage(ZE_STATUS) == 0) then
		local players = {}
		for i, cid in pairs(getPlayersOnline()) do
			if(getPlayerZombiesEventStatus(cid) > 0) then
				doTeleportThing(cid, ZE_kickPosition, false)
				doPlayerSendTextMessage(cid, 19, "You have been kicked from event. Not enough participants.")	
				setPlayerZombiesEventStatus(cid, 0)
			end
		end

	end
end

function kickTimer(cd)
	if(getStorage(ZE_STATUS) == 1) then
	if(cd == 180) then
			doBroadcastMessage("|| Zombie Event ||\nRecruting players. Fight begins in 3 minutes.")
	elseif(cd == 120) then
			doBroadcastMessage("|| Zombie Event ||\nRecruting players by entering event tp. Fight begins in 2 minutes.")
	elseif(cd == 60) then
			doBroadcastMessage("|| Zombie Event ||\nRecruting players by entering event tp. Fight begins in 1 minutes.")
	end
	local players_on_arena_count = #getZombiesEventPlayers()
	local pos = {x = 881, y = 863, z = 7}
		if(cd > 0) then
			doSendAnimatedText(ZE_blockEnterItemPosition, cd, TEXTCOLOR_RED)
			doSendMagicEffect(ZE_blockEnterItemPosition, 7)
			doSendAnimatedText(pos, cd, TEXTCOLOR_RED)
			doSendMagicEffect(pos, 7)
			addEvent(kickTimer, 1000, cd - 1)
		elseif(players_on_arena_count >= ZE_MIN_NUMBER_OF_PLAYERS) then
			addZombiesEventBlockEnterPosition()
			setZombiesEventPlayersLimit(players_on_arena_count)
			doSetStorage(ZE_PLAYERS_NUMBER, players_on_arena_count)
			doSetStorage(ZE_STATUS, 2)
			doSetStorage(ZE_ZOMBIES_FIGHT_TIME, os.time())
			doSendMagicEffect({x = 883, y = 865, z = 7}, CONST_ME_GROUNDSHAKER)
			doSendMagicEffect({x = 879, y = 861, z = 7}, CONST_ME_GROUNDSHAKER)
			doSendMagicEffect({x = 883, y = 861, z = 7}, CONST_ME_GROUNDSHAKER)
			doSendMagicEffect({x = 879, y = 865, z = 7}, CONST_ME_GROUNDSHAKER)
			doSendMagicEffect({x = 881, y = 863, z = 7}, CONST_ME_GROUNDSHAKER)
			doBroadcastMessage("|| Zombie Event ||\nStarted, good luck and have fun!")
		else
			addZombiesEventBlockEnterPosition()
			doSetStorage(ZE_STATUS, 0)
			kickPlayers()
			doSetStorage(ZE_PLAYERS_NUMBER, ZE_DEFAULT_NUMBER_OF_PLAYERS)
			doSetStorage(ZE_ZOMBIES_TO_SPAWN, 0)
			doSetStorage(ZE_ZOMBIES_SPAWNED, 0)	
			doBroadcastMessage('|| Zombie Event ||\nCancelled. Not enough participants.') 
		end

	end

end
