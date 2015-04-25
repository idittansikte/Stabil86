local config = {
	loginMessage = getConfigValue('loginMessage'),
	useFragHandler = getBooleanFromString(getConfigValue('useFragHandler'))
}

function onLogin(cid)
	local loss = getConfigValue('deathLostPercent')
	if(loss ~= nil) then
		doPlayerSetLossPercent(cid, PLAYERLOSS_EXPERIENCE, loss * 10)
	end
	
	local accountManager = getPlayerAccountManager(cid)
	if(accountManager == MANAGER_NONE) then
		local welcomeText = "Welcome " .. getCreatureName(cid) .. ".\n\nOur community would like to welcome you to " .. getConfigValue('serverName') .. ". If you need help with anything, please refer to the help channel.\n\nEnjoy your time!"
		local text = "Here's a small list of commands:\n!aol        -> Buy an amulet of loss\n!spells   -> List of spells available\n!frags   -> Check your amount of kills\n!bless   -> Buy blessings\n!bug      -> Report bugs to staff\n- Visit our webpage for a complete list of commands.\n"
		local lastLogin, str = getPlayerLastLoginSaved(cid), config.loginMessage

		if(lastLogin > 0) then
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, "Welcome back " .. getCreatureName(cid) .. "!")
			str = "Your last visit was on " .. os.date("%a %b %d %X %Y", lastLogin) .. "."
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, str)
			doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, text)
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, welcomeText)
			str = str .. " Please choose your outfit."
			doPlayerSendOutfitWindow(cid)
		end
		
	elseif(accountManager == MANAGER_NAMELOCK) then
		addEvent(valid(doCreatureSay), 500, cid, "Hello, it appears that your character has been locked for name violating rules, what new name would you like to have?", TALKTYPE_PRIVATE_NP, true, cid)
	elseif(accountManager == MANAGER_ACCOUNT) then
		addEvent(valid(doCreatureSay), 500, cid, "Hello, type {account} to manage your account. If you would like to start over, type {cancel} anywhere.", TALKTYPE_PRIVATE_NP, true, cid)
	else
		addEvent(valid(doCreatureSay), 500, cid, "Hello, type {account} to create an account or {recover} to recover an account.", TALKTYPE_PRIVATE_NP, true, cid)
	end

	if(not isPlayerGhost(cid)) then
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_TELEPORT)
	end

	registerCreatureEvent(cid, "Idle")
	registerCreatureEvent(cid, "Mail")
	if(getPlayerOperatingSystem(cid) >= CLIENTOS_OTCLIENT_LINUX) then
		registerCreatureEvent(cid, "ExtendedOpcode")
	end

	registerCreatureEvent(cid, "ReportBug")
	if(config.useFragHandler) then
		registerCreatureEvent(cid, "SkullCheck")
	end

	registerCreatureEvent(cid, "GuildEvents")
	registerCreatureEvent(cid, "AdvanceSave")
	
	-- CUSTOM --
	registerCreatureEvent(cid, 'Kills')
	registerCreatureEvent(cid, "Licznik")
	registerCreatureEvent(cid, "Bounty")
	registerCreatureEvent(cid, "duszek")
	registerCreatureEvent(cid, "KillingInTheNameOf")
	registerCreatureEvent(cid, "ZombieAttack")
	registerCreatureEvent(cid, "reward")
	
	
	registerCreatureEvent(cid,'SpellUp')
	
	return true
end
