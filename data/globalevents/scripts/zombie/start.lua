function onTime()
local players_on_arena_count = #getZombiesEventPlayers()
	if(getStorage(ZE_STATUS) ~= 0) then
	return true
	end
		removeZombiesEventBlockEnterPosition()
		doSetStorage(ZE_STATUS, 1)
		doBroadcastMessage("|| Zombie Event ||\nTeleport is opened. You got 3 min to enter before event starts. Zombie Event need ".. ZE_MIN_NUMBER_OF_PLAYERS .."-" .. getZombiesEventPlayersLimit() .. " players.")
		
		kickTimer(ZE_KICKTIME)
	return true
end





