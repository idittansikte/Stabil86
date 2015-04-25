local wallPositions = {
						[1010] = {x = 2359, y = 759, z = 7},
						}

local function isWalkable(pos, creature, proj, pz)
if getTileThingByPos({x=pos.x,y=pos.y,z=pos.z,stackpos=0}).itemid == 0 then return false end
if getTopCreature(pos).uid > 0 and creature then return false end
if getTileInfo(pos).protection and pz then return false, true end
local n = not proj and 3 or 2
for i = 0, 255 do
	pos.stackpos = i
	local tile = getTileThingByPos(pos)
	if tile.itemid ~= 0 and not isCreature(tile.uid) then
		if hasProperty(tile.uid, n) or hasProperty(tile.uid, 7) then
			return false
		end
	end
end
return true
end

walls = {}

function onStepIn(cid, item, position, lastPosition, fromPosition, toPosition)
if isPlayer(cid) and wallPositions[item.actionid] then
	local pos = wallPositions[item.actionid]
	if isWalkable(pos, false, true, false) then
		return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Nothing to remove!')
	end
	for i = 1, 255 do
		pos.stackpos = i
		local tile = getThingFromPos(pos)
		if tile.itemid ~= 0 and not isCreature(tile.uid) then
			if hasProperty(tile.uid, 7) then
				walls[tile.itemid] = tile.type
				doRemoveItem(tile.uid)
			end
		end
	end
end
return true
end

function onStepOut(cid, item, fromPosition, toPosition)
if isPlayer(cid) and wallPositions[item.actionid] then
	local pos = wallPositions[item.actionid]
	if not isWalkable(pos, false, true, false) then
		return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, 'Nothing to create!')
	end
	for itemId, count in pairs(walls) do
		doCreateItem(itemId, count, pos)
	end
end
return true
end