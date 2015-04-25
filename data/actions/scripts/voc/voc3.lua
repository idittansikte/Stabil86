local level = 20

function onUse(cid, item, frompos, item2, topos)

local sorcerer = isSorcerer(cid)
local druid = isDruid(cid)
local paladin = isPaladin(cid)
local knight = isKnight(cid)

if getPlayerLevel(cid) < level then
doPlayerSendTextMessage(cid,22,'You need level 20 to pass.')
return false
end

if item.uid == 9019 then
if sorcerer then
pos = getPlayerPosition(cid)
if pos.x == topos.x then
if pos.y < topos.y then
pos.y = topos.y + 1
else
pos.y = topos.y - 1
end
elseif pos.y == topos.y then
if pos.x < topos.x then
pos.x = topos.x + 1
else
pos.x = topos.x - 1
end
else
doPlayerSendTextMessage(cid,22,'Stand in front of the door.')
return 1
end
doTeleportThing(cid,pos)
doSendMagicEffect(topos,12)
else
doPlayerSendTextMessage(cid,22,'You cant pass. You are not sorcerer.')
end
return 1
else
return 0
end
end