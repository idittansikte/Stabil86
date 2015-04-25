local codeStorage = 65118
local kickStorage = 65119
local timesStorage = 65121
local times = 3
function onSay(cid, words, param, channel)
 
	if getCreatureStorage(cid, codeStorage) == 0 then
		return doPlayerSendCancel(cid, "Not yet.")
	elseif tonumber(param) == tonumber(getCreatureStorage(cid, codeStorage)) then
		doCreatureSetStorage(cid, codeStorage, 0)
		doCreatureSetStorage(cid, kickStorage, 0)
		doCreatureSetStorage(cid, timesStorage, 0)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[Antibot]: Enjoy your time!")
		return true
	else
		if getCreatureStorage(cid, timesStorage) < 0 then doCreatureSetStorage(cid, timesStorage, 0) end
 
		doCreatureSetStorage(cid, timesStorage, getCreatureStorage(cid, timesStorage) + 1)
		if getCreatureStorage(cid, timesStorage) == times then
			doCreatureSetStorage(cid, codeStorage, 0)
			doCreatureSetStorage(cid, kickStorage, 0)
			doCreatureSetStorage(cid, timesStorage, 0)
			doTeleportThing(cid, {x = 1005, y = 1005, z = 7})
			return true
		else
		return doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "[Antibot]: You have 3 total opportunities to try to get the correct answer.")
		end
	end
	return true
end