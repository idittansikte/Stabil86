local config = {
				['fear'] = {toPos = {x=2295, y=1048, z=5}, guards = {'demon', 10}, teleportStats = {tpRemove = 180, guardsCreate = 10, bossCreate = 270}},
				}

local function isWalkable(pos)
if getTileThingByPos({x=pos.x,y=pos.y,z=pos.z,stackpos=0}).itemid == 0 then return false end
if getTileInfo(pos).protection and pz then return false, true end
for i = 0, 255 do
	pos.stackpos = i
	local tile = getTileThingByPos(pos)
	if tile.itemid ~= 0 and not isCreature(tile.uid) then
		if hasProperty(tile.uid, 2) or hasProperty(tile.uid, 7) then
			return false
		end
	end
end
return true
end

local function getFreeTile(pos, rangeX, rangeY)
for x = 0, rangeX * 2 do
	for y = 0, rangeY * 2 do
		pos.x = pos.x + (x > rangeX and -x + rangeX or x)
		pos.y = pos.y + (y > rangeY and -y + rangeX or y)
		if isWalkable(pos) then
			return pos
		end
	end
end
return false
end
				
function onKill(cid, target, lastHit)
local v, pos, name = config[getCreatureName(target):lower()], getThingPos(target), getCreatureName(target)
if v and isMonster(target) then
	doCreateTeleport(1387, v.toPos, pos)
	doRemoveThing(target)
	return addEvent(function()
							if getTileItemById(pos, 1387).uid > 0 then
								doSendMagicEffect(pos, CONST_ME_TELEPORT)
								doRemoveThing(getTileItemById(pos, 1387).uid)
								return addEvent(function()
														for i = 1, v.guards[2] do
															local newPos = getFreeTile(pos, 5, 5)
															doCreateMonster(v.guards[1], newPos, false)
															doSendMagicEffect(newPos, CONST_ME_MORTAREA)
														end
														return addEvent(function()
																		return doCreateMonster(name, getFreeTile(pos, 5, 5), false)
																		end,
																		(v.teleportStats.bossCreate - v.teleportStats.guardsCreate) * 1000,
																		pos, name, v)
														end,
														(v.teleportStats.guardsCreate - v.teleportStats.tpRemove) * 1000,
														pos, name, v)
							end return true end,
							v.teleportStats.tpRemove * 1000,
							pos, name, v)
end
return true
end