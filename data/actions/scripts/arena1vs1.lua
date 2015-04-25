local config = {
	[8734] = {
		position_start = {
			{x=1212, y=1030, z=6},
			{x=1213, y=1030, z=6}
		},
		position_teleport = {
			{x=1214, y=1019, z=7},
			{x=1214, y=1026, z=7} 
		}
	},
	[8735] = {
		position_start = {
			{x=1212, y=1035, z=6},
			{x=1213, y=1035, z=6}
		},
		position_teleport = {
			{x=1214, y=1038, z=7},
			{x=1214, y=1045, z=7},
		}
	},
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	doTransformItem(item.uid, (item.itemid == 1945 and 1946 or 1945))
	local t = config[item.uid]
	for i = 1, #t.position_start do
		t.position_start[i].stackpos = 253
		local player = getThingfromPos(t.position_start[i])
		if(not isPlayer(player.uid) and not isMonster(player.uid)) then
			doPlayerSendCancel(cid, "You do not have all the players!")
			return false
		end
	end
	for i=1, #t.position_start do
		doTeleportThing((getThingfromPos(t.position_start[i])).uid, t.position_teleport[i])
		doSendAnimatedText(t.position_teleport[i], 'FIGHT', 49)
	end
	return true
end