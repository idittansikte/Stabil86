function onStepIn(cid, item, pos)



    if (item.actionid == 8412) then
if (getPlayerStorageValue(cid, 23388) == -1) then
	setPlayerStorageValue(cid, 23388, 1)
	doCreatureSay(cid, "Training Started. Every 2 min you will loose 1 Soul Point.", TALKTYPE_ORANGE_1)		

end
end


    return TRUE
end  

function onStepOut(cid, item, pos)



    if (item.actionid == 8412) then
if (getPlayerStorageValue(cid, 23388) == 1) then
	setPlayerStorageValue(cid, 23388, -1)
	doCreatureSay(cid, "See you later!", TALKTYPE_ORANGE_1)	
end
end



    return TRUE
end