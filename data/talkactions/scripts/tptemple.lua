local temple = {x=1002, y=999, z=7} -- destination position
local level = 20 -- level to ues this command
local loadingTime = 10  -- in seconds -- How long you have to wait until teleported
local storage = 58478
local exhaust = 120 -- Time until you can cast this command again

function countDown(n, cid)
	if getPlayerStorageValue(cid, storage) == 1 then
	local pos = getPlayerPosition(cid)
	local playerPos = getThingPos(cid)
		if getPlayerStorageValue(cid, storage + 1) == playerPos.x and getPlayerStorageValue(cid, storage + 2) == playerPos.y then
			if getCreatureCondition(cid, CONDITION_INFIGHT) == false then
				if(n > 1) then
					doSendAnimatedText(pos, n, TEXTCOLOR_RED)
					doSendMagicEffect(pos, 7)
					addEvent(countDown, 1000, n - 1, cid)
				elseif (n == 1) then
					doSendMagicEffect(pos, 52)
					doSendAnimatedText(pos, n, TEXTCOLOR_RED)
					addEvent(countDown, 1000, n - 1, cid)
				else
						
					doSendAnimatedText(pos, "I'M OUT!", TEXTCOLOR_RED)
					doSendMagicEffect(pos, CONST_ME_POFF)
					doTeleportThing(cid, temple)
					doSendMagicEffect(temple, CONST_ME_TELEPORT)
					setPlayerStorageValue(cid, storage, 0)
					doRemoveConditions(cid, false)
						
				end
			else
				doPlayerSendCancel(cid, 'Command canceled. Get out of fight!')
				setPlayerStorageValue(cid, storage, 0)
				exhaustion.set(cid, 101, 0)
			end
		else
			doPlayerSendCancel(cid, 'Command canceled. You are moving!')
			setPlayerStorageValue(cid, storage, 0)
			exhaustion.set(cid, 101, 0)
		end
	end

end

function onSay(cid, words, param, channel, position) 
	if (getTileInfo(getCreaturePosition(cid)).noLogout) then
	doPlayerSendCancel(cid, "You cannot use this command here.")
	return true
	end
	if isPlayerPzLocked(cid) then
		doPlayerSendCancel(cid, "You cannot use this command while you are pz locked.")
		return true
	end 
	if getCreatureCondition(cid, CONDITION_INFIGHT) then
         return doPlayerSendCancel(cid, 'You can\'t use this command in fight.')
    end
	if getPlayerLevel(cid) < level then
		return doPlayerSendCancel(cid, 'You need to be from level '..level..' to use this command.')
	end
	if exhaustion.get(cid, 101) then
		doPlayerSendCancel(cid, 'You can use this command only once per 2 min')
		return true
	end
	exhaustion.set(cid, 101, exhaust)
	
	local pos = getThingPos(cid)
	setPlayerStorageValue(cid, storage + 1, pos.x)
	setPlayerStorageValue(cid, storage + 2, pos.y)
	setPlayerStorageValue(cid, storage, 1)
	
	countDown(loadingTime, cid)
	
	
	return true
end