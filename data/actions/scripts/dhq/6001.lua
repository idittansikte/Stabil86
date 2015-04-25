
function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 6001 then
   		local queststatus = getPlayerStorageValue(cid,6001)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Demon Helmet.")
   			doPlayerAddItem(cid,2493,1)
   			setPlayerStorageValue(cid,6001,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	else
		return 0
   	end
   	return 1
end