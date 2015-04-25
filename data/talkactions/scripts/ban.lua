 -- /ban playername, offece down below, amount of time here, and comment
--[[BY HERMES @ OTLAND
	REASONS (POPULAR):
		4-offensive-statement,
		5-spamming,
		6-advertising,
		10-bug-abuse,
		12-unofficial-soft
		13-hacking,
		14-multi-clienting,
		15-account-trading-or-sharing,
		16-threatening-gamemaster,
		18-false-report-to-gm,
		19-destructive-behavior,
		20-excessive-unjustified-player-killing
	USAGE:
		/ban playerName, banType, banLength, comment
	DEFAULT:
		/ban testeja, 12, 1, BOT
		length: time in days  1 = 1dia
		comment: default comment (if param is nil)
		reason: number, read text above
 
]]
 
local default = {
	length = 24 * 60 * 60,
	comment = "Dont do illegal stuff.",
	reason = 12 --[Reason working Now]
}
 
function getPlayerTesti(cid)
    local Tiedot = db.getResult("SELECT `id` FROM `accounts` WHERE `id` = " .. getPlayerAccountId(cid) .. " LIMIT 1")
    if Tiedot:getID() ~= LUA_ERROR then
        local account = Tiedot:getDataInt("id")
        return account
    end
     return LUA_ERROR
end
 
function onSay(cid, words, param)
	local t = string.explode(param, ",")
	if(not t[1]) then
		doPlayerSendCancel(cid, "You must enter name.")
		return true
	end
 
	local player = getPlayerByName(t[1])
	if(not isPlayer(player)) then
		doPlayerSendCancel(cid, "Player with name `" .. t[1] .. "` not found.")
		return true
	end
 
 
	local reason = (t[2] and type(t[2]) == "string") and t[2] or default.reason
	local length = (t[3] * 86400 and tonumber(t[3] * 86400) > 0) and t[3] * 86400 or default.length
	local comment = (t[4] and type(t[4]) == "string") and t[4] or default.comment
 
 
	if(isInArray({"account", "acc", "a"}, action)) then
		doAddAccountBanishment(getAccountIdByName(t[1]), getPlayerGUID(t[1]), os.time() + length, default.reason, comment, ACTION_BANISHMENT, comment, getPlayerGUID(cid))
		result = true
	--[[
	elseif(isInArray({"player", "p"}, action)) then
		--type missing
		doAddPlayerBanishment(getPlayerGUID(t[1]), type, os.time() + length, default.reason, ACTION_BANISHMENT, comment, getPlayerGUID(cid))
		result = true
	elseif(isInArray({}, action)) then
		--ip and mask missing
		doAddIpBanishment(ip, mask, os.time() + length, default.reason, comment, getPlayerGUID(cid))
		result = true
	elseif(isInArray({}, action)) then
		doAddNotation(getAccountIdByName(t[1]), getPlayerGUID(t[1]), default.reason, comment, getPlayerGUID(cid))
		result = true
	elseif(isInArray({}, action)) then
		--channelId missing
		doAddStatement(getPlayerGUID(t[1]), channelId, default.reason, comment, getPlayerGUID(cid))
		result = true
	]]
	end
 
	if(result) then
		db.executeQuery("INSERT INTO `bans` (`id` ,`type` ,`value` ,`param`, `active`, `expires`, `added`, `comment`, `reason`, `action`) VALUES ('id', '3', '".. getPlayerTesti(player) .."', '45', '1', '".. os.time() + length .."', '".. os.time() .."', '".. comment .."', '".. reason .."', '2' );")
		doSendAnimatedText(getCreaturePosition(player), "BANISHED", TEXTCOLOR_RED)
		doRemoveCreature(player)
	end
	return true
end