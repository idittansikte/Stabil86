local config = {
				[1005] = {toPos = {x = 1691, y = 879, z = 5}, priceType = {{5930, 5}, {2157, 3}}},
				[1006] = {toPos = {x = 850, y = 1292, z = 8}, priceType = {{5880, 10}, {2157, 3}}},
				[1007] = {toPos = {x = 1702, y = 1051, z = 8}, priceType = {{5954, 15}, {2157, 3}}},
				[1008] = {toPos = {x = 1658, y = 1091, z = 9}, priceType = {{5954, 25}, {2157, 3}}},
				[1009] = {toPos = {x = 1659, y = 1060, z = 9}, priceType = {{5954, 15}, {2157, 3}}},
				[1010] = {toPos = {x = 2132, y = 573, z = 4}, priceType = {{5922, 15}, {2157, 3}}},
				[1011] = {toPos = {x = 1928, y = 787, z = 4}, priceType = {{6500, 30}, {2157, 6}}},
				[1012] = {toPos = {x = 2032, y = 812, z = 6}, priceType = {{5905, 30}, {2157, 6}}},
				[1013] = {toPos = {x = 2212, y = 779, z = 7}, priceType = {{5911, 50}, {2157, 6}}},

			--[[[actionid] = {toPos = {x = 1006, y = 1004, z = 7}, priceType = {{'' dla wylaczenia, wymaganaGotowka(zero dla wylaczenia tej opcji)}, {itemIdVipItema, wymaganaIlosc}}},--]]
				}

local positionOfCash = {
						['vipPosition'] = {x = 0, y = -2, z = 0},--ilosc kratek po 'x', po 'y' oraz po 'z' od pozycji dzwigni
						['cashPosition'] = {x = 0, y = -2, z = 0}
						}

local function doChangeCash(position, cash, n)
n = n or 0
if n >= 50 then
	return false
end
if cash >= 10000 then
	if getTileItemById(position, 2160).uid > 0 then
		typeItem = {2160, math.min(math.floor(cash/10000),getTileItemById(position, 2160).type)}
	elseif getTileItemById(position, 2152).uid > 0 then
		typeItem = {2152, math.min(math.floor(cash/100),getTileItemById(position, 2152).type)}
	end
	if typeItem then
		doChangeTypeItem(getTileItemById(position, typeItem[1]).uid, getTileItemById(position, typeItem[1]).type-typeItem[2])
		cash = cash - (typeItem[2] * (typeItem[1] == 2160 and 10000 or 100))
	end
end
if cash >= 100 then
	if getTileItemById(position, 2152).uid > 0 then
		typeItem = {2152, math.min(math.floor(cash/100),getTileItemById(position, 2152).type)}
	elseif getTileItemById(position, 2148).uid > 0 then
		typeItem = {2148, math.min(cash,getTileItemById(position, 2148).type)}
	end
	if typeItem then
		doChangeTypeItem(getTileItemById(position, typeItem[1]).uid, getTileItemById(position, typeItem[1]).type-typeItem[2])
		cash = cash - (typeItem[2] * (typeItem[1] == 2152 and 100 or 1))
	end
end
if cash >= 1 and getTileItemById(position, 2148).uid > 0 then
	doChangeTypeItem(getTileItemById(position, 2148).uid, getTileItemById(position, 2148).type-math.min(cash,getTileItemById(position, 2148).type))
	cash = cash - math.min(cash,getTileItemById(position, 2148).type)
end
return cash > 0 and doChangeCash(position, cash, n+1) or true
end

local function getCountOfCash(position, requiedCash)
local cashTypes, cash = {}, 0
for _, v in ipairs({2160, 2152, 2148}) do
	local itemId = getTileItemById(position, v)
	if itemId.uid > 0 then
		cashTypes[v] = cashTypes[v] or 0 + itemId.type
		cash = cash + ((v == 2160 and itemId.type * 10000) or (v == 2152 and itemId.type * 100) or (v == 2148 and itemId.type))
	end
end
if cash >= requiedCash then
	return doChangeCash(position, requiedCash)
end
return false
end

local function doTeleportThingEffect(cid, newPos, beforeEffect, afterEffect)
	return doSendMagicEffect(getThingPos(cid), beforeEffect or CONST_ME_TELEPORT) and doTeleportThing(cid, newPos, true, true) and doSendMagicEffect(newPos, (afterEffect or CONST_ME_TELEPORT))
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
if not config[item.actionid] then
	return false
end
for i = 1, #config[item.actionid].priceType do
	local leverPosition, v = getThingPos(item.uid), config[item.actionid].priceType[i]
	local typePos = type(v[1]) == 'string' and 'cashPosition' or type(v[1]) == 'number' and 'vipPosition'
	local newPos = {x=leverPosition.x+positionOfCash[typePos].x,y=leverPosition.y+positionOfCash[typePos].y,z=leverPosition.z+positionOfCash[typePos].z}
	if type(v[1]) == 'string' and v[1] ~= '' and v[2] > 0 and getCountOfCash(newPos, v[2]) then
		return doTeleportThingEffect(cid, config[item.actionid].toPos)
	elseif type(v[1]) == 'number' and v[2] > 0 then
		local itemId = getTileItemById(newPos, v[1])
		if itemId.uid > 0 and itemId.type >= v[2] then
			doChangeTypeItem(itemId.uid, itemId.type-v[2])
			return doTeleportThingEffect(cid, config[item.actionid].toPos) and false
		end
	end
end
return false
end