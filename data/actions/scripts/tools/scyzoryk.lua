function onUse(cid, item, fromPosition, itemEx, toPosition)
	--Lopata
	if(isInArray(HOLES, itemEx.itemid))then
		if(itemEx.itemid ~= 8579) then
			itemEx.itemid = itemEx.itemid + 1
		else
			itemEx.itemid = 8585
		end

		doTransformItem(itemEx.uid, itemEx.itemid)
		return  doDecayItem(itemEx.uid)
	--Lina
	elseif(isInArray(SPOTS, getThingFromPos({x = toPosition.x, y = toPosition.y, z = toPosition.z, stackpos = toPosition.STACKPOS_GROUND}).itemid))then
		return doTeleportThing(cid, {x = toPosition.x, y = toPosition.y + 1, z = toPosition.z - 1}, false)
	elseif(isInArray(ROPABLE, itemEx.itemid)) then
		local hole = getThingFromPos({x = toPosition.x, y = toPosition.y, z = toPosition.z + 1, stackpos = STACKPOS_TOP_MOVEABLE_ITEM_OR_CREATURE})
		if(hole.itemid > 0) then
			doTeleportThing(hole.uid, {x = toPosition.x, y = toPosition.y + 1, z = toPosition.z}, false)
		else
			doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
		end
		return true
	--Kilof
	elseif(isInArray(SPOTS, getThingFromPos({x = toPosition.x, y = toPosition.y, z = toPosition.z + 1, stackpos = STACKPOS_GROUND}).itemid) and isInArray({354, 355}, itemEx.itemid))then
		doTransformItem(itemEx.uid, 392)
		doDecayItem(itemEx.uid)
		return doSendMagicEffect(toPosition, CONST_ME_POFF)
	elseif(itemEx.itemid == 7200)then
		doTransformItem(itemEx.uid, 7236)
		return doSendMagicEffect(toPosition, CONST_ME_BLOCKHIT)
	--Maczeta
	elseif(isInArray(JUNGLE_GRASS, itemEx.itemid)) then
		doTransformItem(itemEx.uid, itemEx.itemid - 1)
		return doDecayItem(itemEx.uid)
	elseif(isInArray(SPIDER_WEB, itemEx.itemid)) then
		doTransformItem(itemEx.uid, (itemEx.itemid + 6))
		return doDecayItem(itemEx.uid)
	elseif(isInArray(WILD_GROWTH, itemEx.itemid)) then
		doSendMagicEffect(toPosition, CONST_ME_POFF)
		return doRemoveItem(itemEx.uid)
	end	
	return destroyItem(cid, itemEx, toPosition)
end