function onStepIn(cid, item, pos)



    if (item.actionid == 8410) then
if (getPlayerStorageValue(cid, 23331) == -1) then
	setPlayerStorageValue(cid, 23331, 1)
	doCreatureSay(cid, "Training Started. Every 60 seconds you will loose 1 Soul Point.", TALKTYPE_ORANGE_1)		

end
end


    return TRUE
end  

function onStepOut(cid, item, pos)



    if (item.actionid == 8410) then
if (getPlayerStorageValue(cid, 23331) == 1) then
	setPlayerStorageValue(cid, 23331, -1)
	doCreatureSay(cid, "See you later!", TALKTYPE_ORANGE_1)
end
end



    return TRUE
end