


local storage = 25634
local storagee = 79996
local premPoints = {
	{100, 2},
    {200, 3},
    {300, 3}
}
 
function onAdvance(cid, skill, oldLevel, newLevel)
    if skill ~= SKILL__LEVEL then
        return true
    end
    for i = 1, #premPoints do
        local v = premPoints[i]
        if newLevel >= v[1] and getCreatureStorage(cid, storage) < i then
            db.executeQuery('UPDATE accounts SET premium_points=premium_points+'.. v[2] ..' WHERE id=' .. getPlayerAccountId(cid))
            doCreatureSetStorage(cid, storage, i)
            doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'Congratulations! You have advanced to level ' .. v[1] .. ' and you have recived '.. v[2] ..' Premium Points!')
			doBroadcastMessage('Congratulations! ' .. getCreatureName(cid) .. ' Advenced To LeveL ' .. v[1] .. ' And Get Rewarded With ' .. v[2] .. ' Premium Points.') 
		end
    end
	
	if newLevel >= 67 and getCreatureStorage(cid, storagee) ~= 1 then
		if getPlayerVocation(cid) == 1 or getPlayerVocation(cid) == 2 or getPlayerVocation(cid) == 5 or getPlayerVocation(cid) == 6 then
			doPlayerAddItem(cid, 2268, 1)
			doPlayerAddItem(cid, 2160, 2)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'Congratulations to level 45. You are rewarded with some money. Enjoy your hunting!')
            setPlayerStorageValue(cid, storagee, 1)
		elseif getPlayerVocation(cid) == 3 or getPlayerVocation(cid) == 7 then
			doPlayerAddItem(cid, 2160, 2)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'Congratulations to level 45. You are rewarded with some money. Enjoy your hunting!')
            setPlayerStorageValue(cid, storagee, 1)
		elseif getPlayerVocation(cid) == 4 or getPlayerVocation(cid) == 8 then
			doPlayerAddItem(cid, 2160, 2)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, 'Congratulations to level 45. You are rewarded with some money. Enjoy your hunting!')
            setPlayerStorageValue(cid, storagee, 1)
		end
	end
					
    return true
end



