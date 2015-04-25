function onUse(cid, item, fromPosition, itemEx, toPosition)
local outfitMale = 269
local outfitFemale = 268
local addons = 3
local storage = 10037
if getPlayerStorageValue(cid, storage) == -1 then
doPlayerAddOutfit(cid, outfitMale, addons)
doPlayerAddOutfit(cid, outfitFemale, addons)
doPlayerSendTextMessage(cid, 21, "You get addons!")
doSendMagicEffect(getCreaturePosition(cid), 28)
setPlayerStorageValue(cid, storage, 1)
else
doPlayerSendCancel(cid, "Its empty")
end
return TRUE
end
