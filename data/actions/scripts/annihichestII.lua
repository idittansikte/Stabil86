-- annihilator chests

function onUse(cid, item, frompos, item2, topos)

   	if item.uid == 5013 then
   		queststatus = getPlayerStorageValue(cid,5012)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Warlord Sword.")
   			doPlayerAddItem(cid,2408,1)
   			setPlayerStorageValue(cid,5012,1)
			setPlayerStorageValue(cid,5255,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5014 then
   		queststatus = getPlayerStorageValue(cid,5012)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Solar Axe.")
   			doPlayerAddItem(cid,8925,1)
   			setPlayerStorageValue(cid,5012,1)
			setPlayerStorageValue(cid,5255,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5015 then
   		queststatus = getPlayerStorageValue(cid,5012)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Dark Trinity Mace.")
   			doPlayerAddItem(cid,8927,1)
   			setPlayerStorageValue(cid,5012,1)
			setPlayerStorageValue(cid,5255,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
   	elseif item.uid == 5016 then
   		queststatus = getPlayerStorageValue(cid,5012)
   		if queststatus == -1 then
   			doPlayerSendTextMessage(cid,22,"You have found a Demon Legs.")
   			doPlayerAddItem(cid,2495,1)
   			setPlayerStorageValue(cid,5012,1)
			setPlayerStorageValue(cid,5255,1)
   		else
   			doPlayerSendTextMessage(cid,22,"It is empty.")
   		end
	else
		return 0
   	end

   	return 1
end