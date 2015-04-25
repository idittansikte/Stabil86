local lever = {
	[1560] = {cost = 100, id = 1988}, --backpack
	[1561] = {cost = 100, id = 2120}, --linia
	[1562] = {cost = 100, id = 5710}, --lopata
	[1563] = {cost = 100, id = 2789}, --grzyb	
	[1564] = {cost = 200, id = 7618, count = 1}, --hp
	[1565] = {cost = 1000, id = 7588, count = 1}, --shp
	[1566] = {cost = 2000, id = 7591, count = 1}, --ghp	
	[1567] = {cost = 200, id = 7620, count = 1}, --mp
	[1568] = {cost = 1000, id = 7589, count = 1}, --smp
	[1569] = {cost = 5000, id = 7590, count = 1}, --gmp
	[1570] = {cost = 2000, id = 8472, count = 1}, --gsp
	[1571] = {cost = 5000, id = 8473, count = 1}, --uhp
	[1572] = {cost = 2000, id = 2268, count = 1}, --sd
	[1573] = {cost = 1000, id = 2293, count = 1}, --mw
	[1574] = {cost = 30000, id = 2278, count = 1}, --paral
	[1575] = {cost = 4000, id = 2269, count = 1}, --wgr
	[1576] = {cost = 1000, id = 2301, count = 1}, --fr
	[1577] = {cost = 1000, id = 2261, count = 1}, --mw
	[1581] = {cost = 1000, id = 2280, count = 1}, --manarune
	[1578] = {cost = 10000, id = 2173}, --aol
	[1579] = {cost = 10000, id = 2173}, --aol2
}

function onUse(cid, item, fromPosition, itemEx, toPosition)
	local msg, eff = '', 1
	doTransformItem(item.uid, item.itemid == 1945 and 1946 or 1945)
	if(lever[item.uid])then
		local t = lever[item.uid]
		if(doPlayerRemoveMoney(cid, t.cost))then
			doPlayerAddItem(cid, t.id, (t.count and t.count or 1))
			msg, eff = 'Bought!', 39
		else
			msg, eff = 'Sorry, you dont have money!', 1
		end
		return doPlayerSay(cid, msg, 19) and doSendMagicEffect(getPlayerPosition(cid), eff)
	elseif(item.uid == 1580)then --blesy
		for i = 1, table.maxn({1, 2, 3, 4, 5}) do
			if(getPlayerBlessing(cid, i))then
				doPlayerSay(cid,"You already blessed.",19)
				doSendMagicEffect(getPlayerPosition(cid), 1)
				return true
			end
		end
		if(doPlayerRemoveMoney(cid, 50000)) then
			for i = 1, table.maxn({1, 2, 3, 4, 5}) do
				doPlayerAddBlessing(cid, i)
			end
			msg, eff = 'Bless You!', 49
		else
			msg, eff = 'Sorry, you dont have money!', 1
		end
		return doPlayerSay(cid, msg, 19) and doSendMagicEffect(getPlayerPosition(cid), eff)
	end
	return true	
end
