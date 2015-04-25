function onCastSpell(cid, item, frompos, item2, topos)
doCreatureAddHealth(cid, (getPlayerLevel(cid) * 49) - math.random(-50, 50))
doCreatureAddMana(cid, (getPlayerLevel(cid) * 50) - math.random(-50, 50))
doSendMagicEffect(getCreaturePosition(cid), 49)
doTransformItem(item.itemid - 1)
doAddCondition(cid, exhaust)
local Randomize = math.random(1,3)
if (Randomize == 1) then
text = "This is Potion of God!"
elseif (Randomize == 2) then
text = "God Power!"
elseif (Randomize == 3) then
text = "Bless You!"
elseif (Randomize == 4) then
text = "Power of God"
end
doPlayerSay(cid,text,TALKTYPE_ORANGE_1)
return TRUE
end