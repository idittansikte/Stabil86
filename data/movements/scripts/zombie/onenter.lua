function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if(not isPlayer(cid)) then
		return true
	end
	if(getPlayerAccess(cid) >= ZE_ACCESS_TO_IGNORE_ARENA) then
		addPlayerToZombiesArea(cid)
	elseif(#getZombiesEventPlayers() < getZombiesEventPlayersLimit() and getStorage(ZE_STATUS) == 1) then
		addPlayerToZombiesArea(cid)
		local players_on_arena_count = #getZombiesEventPlayers()
		if(players_on_arena_count == getZombiesEventPlayersLimit()) then
			addZombiesEventBlockEnterPosition()
			doSetStorage(ZE_STATUS, 2)
			doBroadcastMessage("Zombie Arena Event started.")
		elseif(players_on_arena_count >= ZE_MIN_NUMBER_OF_PLAYERS) then
			doBroadcastMessage("|| Zombie Event ||\n" .. getCreatureName(cid) .. " has entered.(" .. players_on_arena_count .. "/" .. getZombiesEventPlayersLimit() .. ").")
		else
			doBroadcastMessage("|| Zombie Event ||\n" .. getCreatureName(cid) .. " has entered.(" .. players_on_arena_count .. "/" .. getZombiesEventPlayersLimit() .. "). We still need atleast " .. ZE_MIN_NUMBER_OF_PLAYERS - players_on_arena_count .. " player(s) more.")
		end
	else
		doTeleportThing(cid, fromPosition, true)
		addZombiesEventBlockEnterPosition()
	end
	return true
end