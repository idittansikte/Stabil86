-- ver. 1.3
-- author tfs, otland.net/members/andypsylon
local c = {
	[33222] = "Congratulations!" -- Annihilator
}
 
function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition, actor)
	if(not isPlayer(cid)) then return true end
 
	local i = item.actionid
	if c[i] and (not isItemDoor(item.itemid)) then
		if(getCreatureStorage(cid, i)) == 1 then
			doCreatureSetStorage(cid, i, -1)
			doCreatureSay(cid, c[i], TALKTYPE_ORANGE_1)
		end
	end
	return true
end