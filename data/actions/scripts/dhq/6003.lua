
function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 6003 then
   		local queststatus = getPlayerStorageValue(cid,6003)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Demon Shield.")
   			doPlayerAddItem(cid,2520,1)
   			setPlayerStorageValue(cid,6003,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	else
		return 0
   	end
   	return 1
end