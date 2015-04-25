function onUse(cid, item, fromPosition, itemEx, toPosition)
	local gatePosition = {x=1654, y=1054, z=10, stackpos=1}
	local getGate = getThingFromPos(gatePosition)
	if(item.uid == 10000) then
		if(item.itemid == 1945 or getGate.itemid == 1355) then
			doRemoveItem(getGate.uid, 1)
			doTransformItem(item.uid, 1946)
		elseif(item.itemid == 1946 or getGate.itemid == 0) then
			doCreateItem(1355, 1, gatePosition)
			doTransformItem(item.uid, 1945)
		else
			doPlayerSendCancel(cid, "Sorry not possible.")
		end
	end
	return true
end