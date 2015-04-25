function onUse(cid, item, frompos, item2, topos)
if item.uid == 5888 then
kasapos = {x=1023, y=1010, z=9, stackpos=255}
getkasa = getThingfromPos(kasapos)
winpos = {x=1023, y=1010, z=9}



if getkasa.itemid == 2157 and getkasa.type == 5 then
rand = math.random(4)
if rand == 1 or rand == 4 or rand == 3 then
doRemoveItem(getkasa.uid,5)
doSendMagicEffect(kasapos,2)
doPlayerSendTextMessage(cid,22,"Lost five golden nuggets :(.")
end
if rand == 2 then
doRemoveItem(getkasa.uid,5)
doCreateItem(2157,30,winpos)
doSendMagicEffect(winpos,13)
doSendMagicEffect(topos,21)
doPlayerSendTextMessage(cid,22,"Congratulations, you won 25 golden nuggets :).")
end
end



if getkasa.itemid > 2157 or getkasa.itemid < 2157 then
doPlayerSendTextMessage(cid,22,"Place 5 Golden Nuggets if you want to enter the machine.")
end
if getkasa.itemid == 2157 and getkasa.type == 1 or getkasa.itemid == 2157 and getkasa.type == 2 or getkasa.itemid == 2157 and getkasa.type == 3 or getkasa.itemid == 2157 and getkasa.type == 4 or getkasa.itemid == 2157 and getkasa.type > 6 

then doPlayerSendTextMessage(cid,22,"Place 5 Golden Nuggets if you want to enter the machine.")
end
end
end