-- Monster Counter by Simone Java from OTsoft.pl --

function onKill(cid, target, lastHit)
 if isMonster(target) then
  local storage = 20000
  for i = 1, getCreatureName(target):len() do
   storage = storage + getCreatureName(target):byte(i,i)
  end
  if getPlayerStorageValue(cid,storage) < 0 then
   setPlayerStorageValue(cid,storage,0)
  end
  --doSendMagicEffect(getCreaturePosition(cid), CONST_ME_HOLYDAMAGE)
  --doSendAnimatedText(getCreaturePosition(cid), "##EXP##", math.random(1, 255))
  setPlayerStorageValue(cid,storage,getPlayerStorageValue(cid,storage) + 1)
  doPlayerSendTextMessage(cid, 23, "You\'ve killed " .. getCreatureName(target):lower() .. " " .. getPlayerStorageValue(cid,storage) .. " times.")
 end
return true
end