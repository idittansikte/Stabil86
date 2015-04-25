function onStepIn(cid, item, position, fromPosition)
	hitPos = {x=position.x+1, y=position.y-1, z=position.z}
	betPos = {x=position.x+1, y=position.y, z=position.z}
	stayPos = {x=position.x+1, y=position.y+1, z=position.z}

	if getStorage(bjStorage) ~= 1 then
		bjPlayers = {}
		doSetStorage(bjStorage, 1)
		doSetStorage(bjTurn, 1)
		sendNames()
		addEvent(roundStart, 20 * 1000)
	else 
		doPlayerSendTextMessage(cid, 19, "You must wait for the current round to end.")
	end
	return true
end