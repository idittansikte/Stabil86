function onUse(cid, item, fromPosition, itemEx, toPosition)
	local gates = {
		[10224] = {p = {x=907, y=1256, z=10}, bridge = 1284, lava = 598},
		[10254] = {p = {x=917, y=1252, z=10}, bridge = 1284, lava = 598}
	}
	if(gates[item.uid]) then
		if(item.itemid == 1945) then
			doTransformItem(getThingFromPos(gates[item.uid].p).uid, gates[item.uid].bridge)
			doTransformItem(item.uid, item.itemid+1)
		elseif(item.itemid == 1946) then
			doTransformItem(getThingFromPos(gates[item.uid].p).uid, gates[item.uid].lava)
			doTransformItem(item.uid, item.itemid-1)
		else
			doPlayerSendCancel(cid, "Sorry not possible.")
		end
	end
	return true
end