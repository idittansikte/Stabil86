local symbols = {"*", "^", "¿", "%", "&", "$"}
 
local timeBetweenQuestion = 35000 * 60--35 minutes
local timeToKick = 2 * 60 -- 2 minutes
local timeStorage = 65117
local codeStorage = 65118
local kickStorage = 65119
local timesStorage = 65121
 
 
function onThink(cid, interval)
	if not isPlayer(cid) or getPlayerGroupId(cid) >= 3 then
		return
	end
 
	if getCreatureStorage(cid, timeStorage) < 1 then doCreatureSetStorage(cid, timeStorage, os.time() + timeBetweenQuestion) end
 
	if getCreatureStorage(cid, kickStorage) > 0 and os.time() >= getCreatureStorage(cid, kickStorage) then
		local tmp = {timeStorage, kickStorage, timesStorage, codeStorage}
		for i = 1, #tmp do
			doCreatureSetStorage(cid, tmp[i], 0)
	end
		return doTeleportThing(cid, {x = 1005, y = 1001, z = 7})
	end
 
	if os.time() >= getCreatureStorage(cid, timeStorage) then
		local code, set = "", 0
		set = math.random(1, 100000)
		local s, e = 1, 1
		for i = 1, string.len(set) do
			code = (code == "" and string.sub(set, s, e) or code .. symbols[math.random(#symbols)] .. string.sub(set, s, e))
			s, e = s + 1, e + 1
		end
 
		doCreatureSetStorage(cid, codeStorage, set)
		doCreatureSetStorage(cid, kickStorage, os.time() + timeToKick)
		doCreatureSetStorage(cid, timeStorage, os.time() + timeBetweenQuestion)
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_RED, "[Anti-Bot]: Please say !antibot " .. code .. " without symbols.")
		doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "*****EXAMPLE CODE: 1*5^8¿6%9 -> !antibot 15869. Remember that you have " .. timeToKick / 60 .. " minutes to do that or you will be kicked.")
		doPlayerPopupFYI (cid, "[Anti-Bot]: Type in the numbers without symbols.")
	end
	return
end