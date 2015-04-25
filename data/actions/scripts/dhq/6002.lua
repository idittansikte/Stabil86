
function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 6002 then
   		local queststatus = getPlayerStorageValue(cid,6002)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Steel Boots.")
   			doPlayerAddItem(cid,2645,1)
   			setPlayerStorageValue(cid,6002,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	else
		return 0
   	end
   	return 1
end