function onSay(cid, words, param, channel)
	local players_on_arena_count = #getZombiesEventPlayers()

	if(getStorage(ZE_STATUS) == 0) then
	
		removeZombiesEventBlockEnterPosition()
		doSetStorage(ZE_STATUS, 1)
		doBroadcastMessage("|| Zombie Event ||\nTeleport is opened. You have 3 min to enter before start. We are waiting for ".. ZE_MIN_NUMBER_OF_PLAYERS .."-" .. getZombiesEventPlayersLimit() .. " players.")
		
		kickTimer(ZE_KICKTIME)
	else
	doPlayerSendTextMessage(cid, 20, 'Zombie Event is already running!')
	end
	return true
end