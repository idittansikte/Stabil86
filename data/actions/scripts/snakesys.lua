function onUse(cid, item, frompos, item2, topos)
	if not isPlayer(getGlobalStorageValue(SNAKE.freeglobalstorage)) then
		doTeleportThing(cid,SNAKE.controlpos)
		SNAKE.timer(cid,1,nil,item.actionid == 0 and 500 or item.actionid)
		doPlayerSendTextMessage(cid,25,'Hold key CTRL and use the arrows to control snake.')
		SNAKE.generateFood()
	else
		doPlayerSendTextMessage(cid,25,'Please wait.')
	end
end