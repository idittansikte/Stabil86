-- ver. 1.5 2012-01-06
-- author tfs, otland.net/members/andypsylon
local c = {
	daily		= "no", -- if 'yes' than like in global Tibia allow only one enter per day
	withEffects	= "yes", -- if 'no' than like in global Tibia without Effects  
	repeatt		= "no", -- if 'yes' than like in global Tibia allow only once for player
	anniStor	= 9001, -- if repeatt "yes" your free Storage Nr., may be the same as lever uniqueid!
	level		= 100, -- player level
	tempAid		= 44333, -- your free nr - temp storage for magic doors and tile, IMPORTANT !anniStor ~= tempAid! - must be different
	mob			= "Orshabaal", -- your alternate monster
	normalMap	= "no", -- must "no" if you have custom map, example vertically anni
	test		= "no", -- (yes/no) will you test it with 1 player? 
	fightTime	= 15, -- min., coutdown - how long you can do anni
	exhaustion	= 3, -- sek.
	exhaustionStor = 33444, -- your Storage Nr. for Exhaustion 
	entry = {
		{x = 1674, y = 1091, z = 11},
		{x = 1672, y = 1091, z = 11},
		{x = 1670, y = 1091, z = 11},
		{x = 1668, y = 1091, z = 11}
	},
	des = {
		{x=1696, y=1081, z=9},
		{x=1722, y=1081, z=9},
		{x=1696, y=1101, z=9},
		{x=1722, y=1101, z=9}
	},
	mobPos = { -- you cann ignore this if you have 'normalMap = "yes"'
		{x=1696, y=1079, z=9},
		{x=1698, y=1079, z=9},
		{x=1697, y=1083, z=9},
		{x=1699, y=1083, z=9},
		{x=1700, y=1081, z=9},
		{x=1701, y=1081, z=9},

		{x=1722, y=1079, z=9},
		{x=1724, y=1079, z=9},
		{x=1723, y=1083, z=9},
		{x=1725, y=1083, z=9},
		{x=1726, y=1081, z=9},
		{x=1727, y=1081, z=9},

		{x=1696, y=1099, z=9},
		{x=1698, y=1099, z=9},
		{x=1697, y=1103, z=9},
		{x=1699, y=1103, z=9},
		{x=1700, y=1101, z=9},
		{x=1701, y=1101, z=9},

		{x=1722, y=1099, z=9},
		{x=1724, y=1099, z=9},
		{x=1723, y=1103, z=9},
		{x=1725, y=1103, z=9},
		{x=1726, y=1101, z=9},
		{x=1727, y=1101, z=9}
	}
}
 
c.daily = getBooleanFromString(c.daily)
c.withEffects = getBooleanFromString(c.withEffects)
c.repeatt = getBooleanFromString(c.repeatt)
c.normalMap = getBooleanFromString(c.normalMap)
c.test = getBooleanFromString(c.test)
local anniEvent = 0
 
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(item.itemid == 1946) then
		if(not c.daily) or c.test then
			doTransformItem(item.uid, 1945)
		else
			doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
		end
		return true
	end
 	if(item.itemid ~= 1945) then return true end
	if(exhaustion.check(cid, c.exhaustionStor)) then return true end
	exhaustion.set(cid, c.exhaustionStor, c.exhaustion)
 
	local fighter = {}
	fighter = getSpectators(c.des[1], 34, 26)
	if fighter ~= nil then
		for i, pid in ipairs(fighter) do
			if isPlayer(pid) then
				if(c.withEffects) then
					doSendAnimatedText({x = 1676, y = 1091, z = 11},"STAHP!",TEXTCOLOR_RED)
				end
				return doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
			end
		end
		for i, pid in ipairs(fighter) do
			if isCreature(pid) then
				doRemoveCreature(pid)
			end
		end
	end
 
	if(anniEvent ~= 0) then stopEvent(anniEvent) end
 
	local players = {}
	for _, position in ipairs(c.entry) do
		local pid = getTopCreature(position).uid
 
		if(pid == 0 or not isPlayer(pid) or getPlayerLevel(pid) < c.level) then
			if(c.withEffects) then
				doCreatureSay(cid, "Need a player\nwith lvl."..c.level, TALKTYPE_MONSTER, nil)
				doSendMagicEffect(position, CONST_ME_TUTORIALARROW)
			end
			return doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
		elseif(c.repeatt and getCreatureStorage(pid, c.storage) > 0) then
			if(c.withEffects) then
				doCreatureSay(cid, "That fighter\ncan't do anni again.", TALKTYPE_MONSTER, nil)
				doSendMagicEffect(position, CONST_ME_TUTORIALARROW)
			end
			return doPlayerSendDefaultCancel(cid, RETURNVALUE_NOTPOSSIBLE)
		end
		table.insert(players, pid)
		if c.test then break end
	end
 
	if normalMap then
		local zmienne = {{'-3','-2'}, {'-1','-2'}, {'-2','2'}, {'0','2'}, {'1','0'}, {'2','0'}} -- horizontally
		for _, pos in ipairs(zmienne) do
			c.mobPos = c.des[1]
			c.mobPos.x = c.mobPos.x + tonumber(pos[1])
			c.mobPos.y = c.mobPos.y + tonumber(pos[2])
			doCreateMonster(c.mob, mobPos)
		end
	else
		for _, pos in ipairs(c.mobPos) do
			doCreateMonster(c.mob, pos)
		end
	end
 
	for i, pid in ipairs(players) do
		doSendMagicEffect(c.entry[i], CONST_ME_POFF)
		doTeleportThing(pid, c.des[i], false)
		doSendMagicEffect(c.des[i], CONST_ME_ENERGYAREA)
		doCreatureSetStorage(pid, c.tempAid, 1)
		if c.test then break end
	end
	doTransformItem(item.uid, 1946)
 
	anniEvent = addEvent(function()
		for i, pid in ipairs(players) do
			if getCreatureStorage(pid, c.tempAid) == 1 then
				doCreatureSetStorage(pid, c.tempAid, -1)
				doRemoveCondition(pid, CONDITION_INFIGHT)
				local pos = getClosestFreeTile(cid, c.entry[i], false, false)
				pos.y = pos.y +1
				doTeleportThing(pid, pos, false)
				doSendMagicEffect(getThingPosition(pid), CONST_ME_TELEPORT)
				doCreatureSay(pid, "Time is up!", TALKTYPE_MONSTER)
			end
		end
		doTransformItem(item.uid, 1945)
	end, c.fightTime*60*1000)
 
	return true
end