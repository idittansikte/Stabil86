
function onStepIn(cid, item, frompos, item2, topos)
	
	local kickposition = {x = 1002, y = 999, z = 7}
  
	if getPlayerLevel(cid) > getConfigInfo("levelToBuyHouse") then
		if getHouseByPlayerGUID(getPlayerGUID(cid)) then
					doSendMagicEffect(getCreaturePosition(cid),2) 
					doTeleportThing(cid, getHouseEntry(getHouseByPlayerGUID(getPlayerGUID(cid))))
					doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "Home sweet home...")
					doSendMagicEffect(getCreaturePosition(cid),10)
		else
        doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You dont own any house.")
		doSendMagicEffect(getCreaturePosition(cid),2) 
        doTeleportThing(cid, kickposition)
		doSendMagicEffect(getCreaturePosition(cid),10)
		end
		
    else
			doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You cannot even buy a house. Go hunt!")
			doSendMagicEffect(getCreaturePosition(cid),2) 
			doTeleportThing(cid, kickposition)
			doSendMagicEffect(getCreaturePosition(cid),10)
	end
end  
 