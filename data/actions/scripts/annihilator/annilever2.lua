local pos = {x = 1777, y = 1086, z = 12}
local wall = 1355
local level = 70
local seconds = 120
local event = 0
 
local function reset(leverPos)
        local lever = getTileItemById(leverPos, 1946).uid
	doTransformItem(lever, 1945)
	doCreateItem(wall, 1, pos)
        doPlayerSendTextMessage(cid,21,"The pass has been closed!")
end
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
 
 
          if item.itemid == 1945 and getPlayerLevel(cid) >= level then
                doRemoveItem(getTileItemById(pos,wall).uid)
                doPlayerSendTextMessage(cid,21,"You have opened the pass, Beware!")
                event = addEvent(reset, seconds * 1000, getThingPos(item.uid))
		doTransformItem(item.uid,item.itemid+1)
	elseif item.itemid == 1946 and getPlayerLevel(cid) >= level then
		stopEvent(event)
		doPlayerSendTextMessage(cid,21,"You have closed the pass!")
		doTransformItem(item.uid,item.itemid-1)
		doCreateItem(wall, 1, pos)
end
return true
end