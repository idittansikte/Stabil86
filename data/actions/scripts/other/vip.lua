-- Credits StreamSide and Empty
function onUse(cid, item, fromPosition, itemEx, toPosition)

	if getPlayerStorageValue(cid,11551) < 1 then
		if getPlayerLevel(cid) > 1 then
			getPlayerStorageValue(cid, 11551)
			doSendAnimatedText(getPlayerPosition(cid), "Welcome!", TEXTCOLOR_RED) 
			doCreatureSay(cid, "CONGRATULATIONS! You are now a VIP for 99999 days! You can now enter the VIP-area and use unique features!. ", TALKTYPE_ORANGE_1)
			setPlayerStorageValue(cid, 11551, (getPlayerStorageValue(cid,11551) + 999))
			doRemoveItem(item.uid, 1)
		else
			doPlayerSendCancel(cid,"You need to be at least level 2 to use this.")
			doRemoveItem(item.uid, 1)
		end
	else
		doPlayerSendCancel(cid,"You are already a VIP.")
	end	
return TRUE
end