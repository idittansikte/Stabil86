function onAdvance(cid, skill, oldLevel, newLevel)
	if getPlayerStorageValue(cid, 1601) == 2 then
		if skill == 8 then
			if newLevel >= 21 and newLevel <= 50 and oldLevel < 20 then
				expstage = 2250
				doPlayerSetExperienceRate(cid, expstage) 
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Your exp stage has changed to ".. expstage .."!")
			elseif newLevel >= 51 and newLevel <= 100 and oldLevel <= 50 then
				expstage = 1500
				doPlayerSetExperienceRate(cid, expstage) 
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Your exp stage has changed to ".. expstage .."!")
			elseif newLevel >= 101 and newLevel <= 150 and oldLevel <= 100 then
				expstage = 1150
				doPlayerSetExperienceRate(cid, expstage) 
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Your exp stage has changed to ".. expstage .."!")
			elseif newLevel >= 151 and newLevel <= 200 and oldLevel <= 150 then
				expstage = 750
				doPlayerSetExperienceRate(cid, expstage) 
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Your exp stage has changed to ".. expstage .."!")
			elseif newLevel >= 201 and newLevel <= 250 and oldLevel <= 200 then
				expstage = 600
				doPlayerSetExperienceRate(cid, expstage) 
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Your exp stage has changed to ".. expstage .."!")
			elseif newLevel >= 251 and newLevel <= 300 and oldLevel <= 250 then
				expstage = 450
				doPlayerSetExperienceRate(cid, expstage) 
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Your exp stage has changed to ".. expstage .."!")
			elseif newLevel >= 301 and newLevel <= 400 and oldLevel <= 300 then
				expstage = 300
				doPlayerSetExperienceRate(cid, expstage) 
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Your exp stage has changed to ".. expstage .."!")
			elseif newLevel >= 401 and newLevel <= 500 and oldLevel <= 400 then
				expstage = 225
				doPlayerSetExperienceRate(cid, expstage) 
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Your exp stage has changed to ".. expstage .."!")
			elseif newLevel >= 501 and newLevel <= 550 and oldLevel <= 500 then
				expstage = 150
				doPlayerSetExperienceRate(cid, expstage) 
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Your exp stage has changed to ".. expstage .."!")
			elseif newLevel >= 551 and newLevel <= 600 and oldLevel <= 550 then
				expstage = 75
				doPlayerSetExperienceRate(cid, expstage) 
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Your exp stage has changed to ".. expstage .."!")
			elseif newLevel >= 601 and newLevel <= 650 and oldLevel <= 600 then
				expstage = 75
				doPlayerSetExperienceRate(cid, expstage) 
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Your exp stage has changed to ".. expstage .."!")
			elseif newLevel >= 651 and newLevel <= 750 and oldLevel <= 650 then
				expstage = 30
				doPlayerSetExperienceRate(cid, expstage) 
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Your exp stage has changed to ".. expstage .."!")
			elseif newLevel >= 751 and oldLevel <= 750 then
				expstage = 21
				doPlayerSetExperienceRate(cid, expstage) 
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_ORANGE, "Your exp stage has changed to ".. expstage .."!")
			end
		end
	end
return true
end