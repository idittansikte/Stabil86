local itemWhichGiveExp = 6527
local howManyGiveExp = 100
local thatOtherBp = false

local function doScanContainer(item, backpack, tables, count, aid, desc)
local aid, desc = aid or {}, desc or {}
if isContainer(item.uid) then
	for i = 0, getContainerSize(item.uid) - 1 do
		local item = getContainerItem(item.uid, i)
		if isContainer(item.uid) then
			table.insert(backpack, item.itemid)
			doScanContainer(item, backpack, tables, count, aid, desc)
		else
			table.insert(aid, item.actionid)
			table.insert(desc, getItemAttribute(item.uid, 'description') or '')
			table.insert(tables, item.itemid)
			table.insert(count, item.type)
		end
	end
end
return true
end

function onUse(cid, item, fromPosition, itemEx, toPosition)
storage = (item.actionid == 5001 and item.uid or item.actionid)
if getPlayerStorageValue(cid, storage) == -1 then
	local expe, cap = 0, 0
	local backpack, tabelka, counts, aid, desc = {}, {}, {}, {}, {}
	doScanContainer(item, backpack, tabelka, counts, aid, desc)
	x = 'You have found '
	if #backpack ~= 0 then
		bp = backpack[1]
		cap = cap + getItemWeightById(bp, 1, true)
		table.remove(backpack, 1)
		bag = doPlayerAddItem(cid, bp, 1)
		x = x .. getItemNameById(bp)..', with '
	end
		for v = #tabelka, 1, -1 do
			if isInArray({itemWhichGiveExp, 0}, tabelka[v]) then
				if tabelka[v] == itemWhichGiveExp then
					expe = expe + (counts[v] * howManyGiveExp)
				end
				table.remove(tabelka, v)
				table.remove(counts, v)
			else
				cap = cap + (getItemWeightById(tabelka[v], (counts[v] == 0 and 1 or counts[v]), true))
			end
		end
	if getPlayerFreeCap(cid) < cap then
		x = 'You need at least '..cap..' ounce of free capacity.'
	end
	for c = #tabelka, 1, -1 do
		if isContainer(bag) then
			doAddContainerItem(bag, tabelka[c], counts[c])
			if #backpack > 0 and thatOtherBp then
				for _, v in pairs(backpack) do
					doAddContainerItem(bag, v, 1)
				end
			end
		else
			doPlayerAddItem(cid, tabelka[c], counts[c], true)
		end
	end
	for s = 1, #tabelka do
		x = x..(isItemStackable(tabelka[s]) and counts[s] > 1 and counts[s] .. ' ' or '') ..getItemNameById(tabelka[s])..(s < #tabelka - 1 and ', ' or s == #tabelka - 1 and ' and ' or '.')
		if expe ~= 0 then
			doAddExp(cid, expe)
		end
		if x ~= 'You have found ' then
			if bp then
				if x ~= 'You have found '..getItemInfo(bp).name..', with ' then
					doPlayerSetStorageValue(cid, storage, 1)
				else
					return doRemoveItem(bag) and false
				end
			else
				doPlayerSetStorageValue(cid, storage, 1)
			end
		else
			return false
		end
	end
else
	x = 'It is empty.'
end
return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, x)
end