local config = {
	position_start1 = {
		{x=1195, y=1030, z=6},
		{x=1196, y=1030, z=6},
		{x=1197, y=1030, z=6},	
	},
	position_start2 = {
		{x=1199, y=1030, z=6},
		{x=1200, y=1030, z=6},
		{x=1201, y=1030, z=6},	
	},
	position_teleport1 = {
		{x=1196, y=1026, z=7},
		{x=1197, y=1026, z=7},
		{x=1198, y=1026, z=7},
	},
	position_teleport2 = {
		{x=1196, y=1014, z=7},
		{x=1197, y=1014, z=7},
		{x=1198, y=1014, z=7},
	}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	doTransformItem(item.uid, (item.itemid == 1945 and 1946 or 1945))
	for i = 1, #config.position_start1 do
		config.position_start1[i].stackpos = 253
		local player = getThingfromPos(config.position_start1[i])
		if(not isPlayer(player.uid) and not isMonster(player.uid))then
			doPlayerSendCancel(cid, 'You do not have all the players!')
			return false
		end
	end
	for i = 1, #config.position_start2 do
		config.position_start2[i].stackpos = 253
		local player = getThingfromPos(config.position_start2[i])
		if(not isPlayer(player.uid) and not isMonster(player.uid))then
			doPlayerSendCancel(cid, 'You do not have all the players!')
			return false
		end
	end
	for i=1, #config.position_start1 do
		doTeleportThing((getThingfromPos(config.position_start1[i])).uid, config.position_teleport1[i])
	end
	for i=1, #config.position_start2 do
		doTeleportThing((getThingfromPos(config.position_start2[i])).uid, config.position_teleport2[i])
	end
	return true
end