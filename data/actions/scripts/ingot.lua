local ITEM_GOLD_NUGGET = 2157
local ITEM_GOLD_INGOT = 9971
local coins = {
	[ITEM_GOLD_NUGGET] = {
		to = ITEM_GOLD_INGOT, effect = COLOR_YELLOW
	},
	[ITEM_GOLD_INGOT] = {
		from = ITEM_GOLD_NUGGET, effect = COLOR_TEAL
	}
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	if(getPlayerFlagValue(cid, PLAYERFLAG_CANNOTPICKUPITEM)) then
		return false
	end

	local coin = coins[item.itemid]
	if(not coin) then
		return false
	end

	if(coin.to ~= nil and item.type == ITEMCOUNT_MAX) then
		doChangeTypeItem(item.uid, item.type - item.type)
		doPlayerAddItem(cid, coin.to, 1)
		doPlayerSendTextMessage(cid, MESSAGE_EXPERIENCE, "$$$", ITEMCOUNT_MAX, coins[coin.to].effect, getCreaturePosition(cid))
	elseif(coin.from ~= nil) then
		doChangeTypeItem(item.uid, item.type - 1)
		doPlayerAddItem(cid, coin.from, ITEMCOUNT_MAX)
		doPlayerSendTextMessage(cid, MESSAGE_EXPERIENCE, "$$$", ITEMCOUNT_MAX, coins[coin.from].effect, getCreaturePosition(cid))
	end

	return true
end