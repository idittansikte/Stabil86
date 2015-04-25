function onUse(cid, item, fromPosition, itemEx, toPosition)
local maxlvl = 9
if getItemInfo(itemEx.itemid).attack > 0 or getItemInfo(itemEx.itemid).defense > 0 or getItemInfo(itemEx.itemid).armor > 0 then

if getItemAttribute(itemEx.uid,"itemlevel") == nil then
doItemSetAttribute(itemEx.uid, "itemlevel",0)
end
if (getItemAttribute(itemEx.uid,"itemlevel") + 1) <= maxlvl then
if getItemInfo(itemEx.itemid).attack > 0 and getItemAttribute(itemEx.uid,"attack") == nil then
doItemSetAttribute(itemEx.uid, "attack",getItemInfo(itemEx.itemid).attack)
end
if getItemInfo(itemEx.itemid).defense > 0 and getItemAttribute(itemEx.uid,"defense") == nil then
doItemSetAttribute(itemEx.uid, "defense",getItemInfo(itemEx.itemid).defense)
end
if getItemInfo(itemEx.itemid).armor > 0 and getItemAttribute(itemEx.uid,"armor") == nil then
doItemSetAttribute(itemEx.uid, "armor",getItemInfo(itemEx.itemid).armor)
end
if getItemAttribute(itemEx.uid, "attack") ~= nil then
doItemSetAttribute(itemEx.uid, "attack",getItemAttribute(itemEx.uid, "attack") + (math.random(2,6+getItemAttribute(itemEx.uid,"itemlevel"))))
end 
if getItemAttribute(itemEx.uid, "armor") ~= nil then
doItemSetAttribute(itemEx.uid, "armor",getItemAttribute(itemEx.uid, "armor") + (math.random(1,3)))
end 
if getItemAttribute(itemEx.uid, "defense") ~= nil then
doItemSetAttribute(itemEx.uid, "defense",getItemAttribute(itemEx.uid, "defense") + (math.random(2,6+getItemAttribute(itemEx.uid,"itemlevel"))))
end 
doItemSetAttribute(itemEx.uid, "name", getItemInfo(itemEx.itemid).name .. " +" .. getItemAttribute(itemEx.uid,"itemlevel") + 1)
doItemSetAttribute(itemEx.uid, "itemlevel",getItemAttribute(itemEx.uid,"itemlevel") + 1)
doPlayerSendTextMessage(cid, MESSAGE_STATUS_DEFAULT, "You have successfully enchanted " .. getItemArticleById(itemEx.itemid) .. " " .. getItemInfo(itemEx.itemid).name .. " to +".. getItemAttribute(itemEx.uid,"itemlevel") ..".")
doSendMagicEffect(getPlayerPosition(cid),39)
doRemoveItem(item.uid,1)
else
doPlayerSendCancel(cid,"You may not upgrade this item higher.")
doSendMagicEffect(getPlayerPosition(cid),CONST_ME_POFF)
end

else
doPlayerSendCancel(cid,"You can only upgrade armors and weapons.")
end
return true
end