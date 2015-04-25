function onUse(cid, item, frompos, item2, topos)

end1pos = {x=1690, y=1042, z=5, stackpos=255} 

ppl1pos = {x=1677, y=1038, z=5, stackpos=253} 
ppl1 = getThingfromPos(ppl1pos)

item1pos = {x=1677, y=1037, z=5, stackpos=255} 
item1 = getThingfromPos(item1pos)


if item.uid == 3030 and item.itemid == 1945 and item1.itemid == 2157 and ppl1.itemid == 1 then

   doRemoveItem(item1.uid,1)
   doSendMagicEffect(item1pos,13)

   doTeleportThing(ppl1.uid,end1pos)
   doSendMagicEffect(ppl1pos,10)
   doSendMagicEffect(end1pos,10)
   doTransformItem(item.uid,item.itemid+1)

elseif item.uid == 3030 and item.itemid == 1946 then
   doTransformItem(item.uid,item.itemid-1)
else
   return 0
end

return 1

end