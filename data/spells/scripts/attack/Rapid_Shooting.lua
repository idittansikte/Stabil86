local config =
{
	--Spell made by me special for OTLand.net
	--If you have some question or you are interested in buying v2 where enchanted arrows, burst's AoE, spears and trowning stars are supported feel free to PM
	--You can use and edit this spell for your OTS, but you can't publish it somewhere without my permission
	--You can't remove author line from script.
		author = "andu",
	--All rights to andu: "otland.net/members/andu/"; "facebook.com/olrios", olrios is my 2nd nickname
 
 
	----------------- CONFIGURATION ----------------
	removeAmmo = false, -- set true to remove one ammo per each shot. true is better for more RPG (remember to add , after "true" or "false")
	alwaysHits = false, -- set true to make this spell always hits, otherwise hits will be afected by your distance
	damageMultipiler = 0.3, -- 0.75 mean 75% of you normal damage will be apiled per each shot (1.0 = 100%, 2.0 = 200% ...)
	shots =
	{
		perLevel = false, -- set false to make spell shooting everytime the same amount of arrows, otherwise it will shoot more if your level is higher
		multipiler = 30, -- (if perLevel is false - leave this alone) shoots "level/multipiler" arrows at once. ex. level 300 will shot 10 arrows at once (300/30=10) Multipiler CANT BE LESS THEN 1!
		amount = 10, -- here is the amount of arrows shooted if perLevel is set to false
		time = 120, -- time between shoots (120 is good number there)
	},
 
	criticals =
	{
		enable = true, -- set false to make spell unable to do critical strikes
		chance = 15, -- in percents
		multipiler = 1.1, -- 2.0 mean: criticals will be 2 times much stronger, (1.0 mean same as non crits)
		info =
		{
			enable = true, -- set true to make enable "critical info"
			color = 180, -- check your data/lib/constant.lua for more avaible colors (can be a number between 0 and 255)
			onTarget = true -- set false to do "critical strike info" on you, otherwise it will be shown on target. for me onTarget looks much better
		}
	},
	------------------------------------------------
	--- DO NOT TOUCHING ANYTHING BELOW THIS LINE ---
	------------------------------------------------
	arrowsIds = {2544, 2545, 2546, 7364, 7365, 7838, 7840, 7839, 7850},
	boltsIds = {2543, 2547, 7629, 7363},
 
	effects = { 
	[2543] = CONST_ANI_BOLT,
	[2544] = CONST_ANI_ARROW,
	[2545] = CONST_ANI_POISONARROW,
	[2546] = CONST_ANI_BURSTARROW,
	[2547] = CONST_ANI_POWERBOLT,
	[7629] = CONST_ANI_INFERNALBOLT,
	[7364] = CONST_ANI_SNIPERARROW,
	[7365] = CONST_ANI_ONYXARROW,
	[7363] = CONST_ANI_PIERCINGBOLT,
	[7838] = CONST_ANI_FLASHARROW,
	[7840] = CONST_ANI_FLAMMINGARROW,
	[7839] = CONST_ANI_SHIVERARROW,
	[7850] = CONST_ANI_EARTHARROW
	}
}
 
local combat = createCombatObject()
setCombatParam(combat, COMBAT_PARAM_TYPE, COMBAT_PHYSICALDAMAGE)
setCombatParam(combat, COMBAT_PARAM_BLOCKARMOR, TRUE)
 
local function crit(param)
	local crit = {}
	crit = math.random(1,100)
	return crit
end
 
function onGetFormulaValues(cid, level, maglevel)
local pos = getCreaturePosition(cid)
local tos = getCreaturePosition(getCreatureTarget(cid))
local distance = getPlayerSkillLevel(cid, 4)
	max = -(5*level^(1/1.5)+distance*1.5+25*2*distance/40-30)*config.damageMultipiler
	if config.alwaysHits == true then
		min = max
	else
		min = 0
	end
	if((config.criticals.enable == true) and(crit(param) <= config.criticals.chance)) then
		min = min * config.criticals.multipiler
		max = max * config.criticals.multipiler
		if(config.criticals.info.onTarget == true) then
			pos = tos
		end
		doSendAnimatedText(pos, "CRITICAL", config.criticals.info.color)	
	end
	return min, max
end
 
setCombatCallback(combat, CALLBACK_PARAM_LEVELMAGICVALUE, "onGetFormulaValues")
 
local function shot(param)
if config.criticals.enable == false then
	config.criticals.info.enable = false
end
if(isCreature(getCreatureTarget(param.cid)) and (getCreatureHealth(getCreatureTarget(param.cid)) > 0)) then
	local tos = getCreaturePosition(getCreatureTarget(param.cid))
	local pos = getCreaturePosition(param.cid)
	local ammo = getPlayerSlotItem(param.cid, CONST_SLOT_AMMO)
	local weapon = getPlayerWeapon(param.cid)
	if(config.removeAmmo == true) then
		if((isInArray(config.arrowsIds, ammo.itemid) and(weapon.ammoType == arrow)) or(isInArray(config.boltsIds, ammo.itemid) and(weapon.ammoType == bolt))) then
			if(doPlayerRemoveItem(param.cid, ammo.itemid, 1) == true) then
				doCombat(param.cid, combat, param.var)
				doSendDistanceShoot(pos, tos, config.effects[ammo.itemid])
			else
				doSendMagicEffect(pos, CONST_ME_POFF)
			end
		else
			doSendMagicEffect(pos, CONST_ME_POFF)
		end
	else
		doCombat(param.cid, combat, param.var)
		doSendDistanceShoot(pos, tos, config.effects[ammo.itemid])
	end
end
return true
end
 
function onCastSpell(cid, var)
local weapon = getPlayerWeapon(cid)
local param = {cid = cid, var = var}
local value = getPlayerLevel(cid)/config.shots.multipiler
if(config.shots.perLevel == false) then
	value = config.shots.amount
end
if(config.author ~= "andu") then
	return doCreatureSay(cid, "I am a thief!", 1)
else
	if((weapon.weaponType == distance) and ((weapon.ammoType == arrow) or (weapon.ammoType == bolt))) then
		for s = 1, value do
			addEvent(shot, s * config.shots.time, param)
		end
	else
		doSendMagicEffect(getCreaturePosition(cid), CONST_ME_POFF)
	end
end
return true
end