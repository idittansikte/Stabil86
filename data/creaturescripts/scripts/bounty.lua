function onKill(cid, target) 
if isPlayer(target) == TRUE then 
pid = cid 
pid2 = getPlayerGUID(target)
    local result_plr = db.getResult("SELECT * FROM `bounty_hunters` WHERE `sp_id` = "..pid2.." AND `killed` = 0;")
    if(result_plr:getID() ~= -1) then
    prize = tonumber(result_plr:getDataInt("prize"))
    bid = tonumber(result_plr:getDataInt("id"))
	result_plr:free()
    else
    prize = 0
	bid = 0
    end 
if (bid ~= 0 and prize ~= 0 and not(getTileInfo(getCreaturePosition(cid)).pvp)) then
    db.executeQuery("UPDATE `bounty_hunters` SET `killed` = 1, `k_id`="..getPlayerGUID(cid)..", `kill_time` = " .. os.time() .. " WHERE `id` = "..bid..";")
	doPlayerAddMoney(cid,prize)
	doPlayerSendTextMessage(cid,MESSAGE_STATUS_CONSOLE_ORANGE,"[Bounty System]: You killed "..getPlayerName(target).."! You gained the bounty that was put on his/her head!")
	doSendMagicEffect(getCreaturePosition(cid), 27) 
	doBroadcastMessage("[Bounty System]: "..getPlayerName(cid).." killed "..getPlayerName(target).." and gained the bounty! ("..prize.." gold)", MESSAGE_EVENT_ADVANCE)
end
end return TRUE
end