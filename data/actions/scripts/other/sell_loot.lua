local items = { -- you need to set up all items here where :
					[2490] = {cost = 1000},
					[2460] = {cost = 120},
					[2458] = {cost = 52},
					[5461] = {cost = 5000},
					[2459] = {cost = 390},
					[2461] = {cost = 12},
					[6578] = {cost = 600},
					[2481] = {cost = 110},
					[2457] = {cost = 580},
					[2482] = {cost = 60},
					[2473] = {cost = 265},
					[8870] = {cost = 1000},
					[2660] = {cost = 450},
					[2463] = {cost = 1200},
					[8819] = {cost = 450},
					[8892] = {cost = 750},
					[2465] = {cost = 450},
					[8872] = {cost = 1300},
					[2486] = {cost = 8000},
					[2489] = {cost = 1500},
					[2532] = {cost = 5000},
					[2525] = {cost = 500},
					[2475] = {cost = 5000},
					[7903] = {cost = 2500},
					[2479] = {cost = 500},
					[5741] = {cost = 40000},
					[7462] = {cost = 400},
					[6096] = {cost = 1000},
					[7459] = {cost = 1500},
					[7900] = {cost = 2500},
					[7901] = {cost = 2500},
					[2498] = {cost = 30000},
					[2475] = {cost = 5000},
					[2497] = {cost = 6000},
					[2491] = {cost = 2500},
					[2462] = {cost = 1000},
					[2663] = {cost = 150},
					[2479] = {cost = 500},
					[10016] = {cost = 8000},
					[3972] = {cost = 3000},
					[3970] = {cost = 850},
					[7902] = {cost = 2500},
					[5461] = {cost = 5000},
					[3971] = {cost = 900},
					[2645] = {cost = 30000},
					[2195] = {cost = 30000},
					[3982] = {cost = 1000},
					[7457] = {cost = 2000},
					[7892] = {cost = 2500},
					[7893] = {cost = 2500},
					[7891] = {cost = 2500},
					[2641] = {cost = 2000},
					[5462] = {cost = 3000},
					[7886] = {cost = 2500},
					[2492] = {cost = 40000},
					[2466] = {cost = 20000},
					[2487] = {cost = 12000},
					[2476] = {cost = 5000},
					[2656] = {cost = 10000},
					[2487] = {cost = 12000},
					[2486] = {cost = 900},
					[2489] = {cost = 400},
					[8872] = {cost = 500},
					[8878] = {cost = 16000},
					[2503] = {cost = 30000},
					[8871] = {cost = 6000},
					[7897] = {cost = 11000},
					[8873] = {cost = 3000},
					[3968] = {cost = 1000},
					[7898] = {cost = 11000},
					[7899] = {cost = 11000},
					[7463] = {cost = 6000},
					[8891] = {cost = 15000},
					[6095] = {cost = 500},
					[2655] = {cost = 300},
					[8889] = {cost = 18000},
					[8880] = {cost = 16000},
					[7884] = {cost = 11000},
					[2488] = {cost = 12000},
					[2477] = {cost = 5000},
					[3983] = {cost = 750},
					[7896] = {cost = 11000},
					[7895] = {cost = 11000},
					[7894] = {cost = 11000},
					[7464] = {cost = 850},
					[7885] = {cost = 11000},
					[2518] = {cost = 1000},
					[2519] = {cost = 8000},
					[2520] = {cost = 30000},
					[2516] = {cost = 4000},
					[2525] = {cost = 100},
					[2515] = {cost = 2000},
					[2536] = {cost = 9000},
					[2539] = {cost = 16000},
					[2528] = {cost = 8000},
					[2534] = {cost = 15000},
					[2532] = {cost = 900},
					[2529] = {cost = 800},
					[2535] = {cost = 5000},
					[7460] = {cost = 1500},
					[2540] = {cost = 2000},
					[3974] = {cost = 120},
					[3973] = {cost = 850},
					[8900] = {cost = 4000},
					[8901] = {cost = 8000},
					[8902] = {cost = 13000},
					[8903] = {cost = 19000},
					[2522] = {cost = 100000},
					[2493] = {cost = 300000},
					[2470] = {cost = 70000},
					[2472] = {cost = 40000},
					[2409] = {cost = 6000},
					[2383] = {cost = 8000},
					[2396] = {cost = 5000},
					[2395] = {cost = 473},
					[7385] = {cost = 610},
					[8602] = {cost = 500},
					[2377] = {cost = 950},
					[2429] = {cost = 590},
					[2378] = {cost = 235},
					[2425] = {cost = 3000},
					[2439] = {cost = 500},
					[2391] = {cost = 10000},
					[2413] = {cost = 500},
					[7854] = {cost = 1000},
					[7869] = {cost = 1000},
					[7744] = {cost = 1000},
					[2392] = {cost = 4000},
					[2393] = {cost = 17000},
					[2396] = {cost = 1000},
					[7763] = {cost = 1000},
					[2409] = {cost = 900},
					[2383] = {cost = 1000},
					[7391] = {cost = 16000},
					[7404] = {cost = 20000},
					[7403] = {cost = 40000},
					[7406] = {cost = 1000},
					[7449] = {cost = 600},
					[7382] = {cost = 36000},
					[7402] = {cost = 15000},
					[7857] = {cost = 1000},
					[7858] = {cost = 15000},
					[7856] = {cost = 30000},
					[7855] = {cost = 25000},
					[7872] = {cost = 1000},
					[7873] = {cost = 15000},
					[7871] = {cost = 30000},
					[7870] = {cost = 25000},
					[2438] = {cost = 8000},
					[7747] = {cost = 1000},
					[7748] = {cost = 15000},
					[7746] = {cost = 30000},
					[7745] = {cost = 25000},
					[7407] = {cost = 8000},
					[7766] = {cost = 1000},
					[7767] = {cost = 15000},
					[7765] = {cost = 30000},
					[7764] = {cost = 25000},
					[7390] = {cost = 60000},
					[7386] = {cost = 12000},
					[7384] = {cost = 30000},
					[7418] = {cost = 35000},
					[7383] = {cost = 25000},
					[2402] = {cost = 500},
					[2377] = {cost = 450},
					[7408] = {cost = 1500},
					[7436] = {cost = 5000},
					[7412] = {cost = 18000},
					[2414] = {cost = 9000},
					[2432] = {cost = 8000},
					[7454] = {cost = 3000},
					[2427] = {cost = 11000},
					[2381] = {cost = 400},
					[2430] = {cost = 2000},
					[2425] = {cost = 500},
					[7862] = {cost = 1000},
					[7434] = {cost = 60000},
					[3962] = {cost = 1500},
					[2440] = {cost = 1000},
					[7419] = {cost = 15000},
					[7861] = {cost = 30000},
					[7860] = {cost = 2000},
					[7863] = {cost = 12000},
					[7877] = {cost = 1000},
					[7876] = {cost = 30000},
					[7875] = {cost = 2000},
					[7878] = {cost = 12000},
					[7752] = {cost = 1000},
					[7751] = {cost = 30000},
					[7750] = {cost = 2000},
					[7753] = {cost = 12000},
					[7380] = {cost = 1000},
					[7389] = {cost = 30000},
					[7771] = {cost = 1000},
					[7770] = {cost = 30000},
					[7769] = {cost = 2000},
					[7772] = {cost = 12000},
					[2426] = {cost = 2000},
					[7456] = {cost = 10000},
					[7411] = {cost = 20000},
					[3964] = {cost = 500},
					[6553] = {cost = 45000},
					[7413] = {cost = 4000},
					[7388] = {cost = 30000},
					[2454] = {cost = 12000},
					[7429] = {cost = 60000},
					[7415] = {cost = 30000},
					[2434] = {cost = 2000},
					[7392] = {cost = 1000},
					[7410] = {cost = 20000},
					[7451] = {cost = 10000},
					[2436] = {cost = 6000},
					[2391] = {cost = 1200},
					[7414] = {cost = 20000},
					[7426] = {cost = 8000},
					[3966] = {cost = 1000},
					[7428] = {cost = 10000},
					[7379] = {cost = 1500},
					[7427] = {cost = 9000},
					[2445] = {cost = 20000},
					[7387] = {cost = 3000},
					[7430] = {cost = 3000},
					[7866] = {cost = 30000},
					[7865] = {cost = 20000},
					[7867] = {cost = 1000},
					[7868] = {cost = 1200},
					[7881] = {cost = 30000},
					[7880] = {cost = 20000},
					[7882] = {cost = 1000},
					[7883] = {cost = 1200},
					[7756] = {cost = 30000},
					[7755] = {cost = 20000},
					[7757] = {cost = 1000},
					[7758] = {cost = 1200},
					[7432] = {cost = 1000},
					[2444] = {cost = 30000},
					[2452] = {cost = 50000},
					[7775] = {cost = 30000},
					[7774] = {cost = 20000},
					[7776] = {cost = 1000},
					[7777] = {cost = 1200},
					[7422] = {cost = 25000},
					[3961] = {cost = 10000},
					[7424] = {cost = 5000},
					[7421] = {cost = 22000},
					[7452] = {cost = 5000},
					[7425] = {cost = 500}
					}

local basin = {x=1020,y=979,z=6,stackpos = 1} -- basin pos
 

-- // SCRIPT START \\ --
 
function getContentDescription(uid, li) -- credits to Cyko for main form of this function
	local ret, i, containers,removes, left = {}, 0, {}, {}, {}
 
	while i <= getContainerSize(uid) do
		local v = getContainerItem(uid, i)
		local k = v.uid
		local k2 = v.itemid
 
		local check = items[k2]
		if check then
			table.insert(ret, k2)
			table.insert(removes,k)
		end
		if isContainer(k) then
				table.insert(containers, k)
		end
		i = i + 1
	end
	for i = 1, #containers do
		local bah = getContentDescription(containers[i], li)
		for i = 1,#bah do
			if li == 1 then
				table.insert(removes,bah[i])
			elseif li == 2 then	
				table.insert(ret,bah[i])
			end
		end
	end
	return li== 1 and removes or ret 
end
 
function getKey(t)
	local s = {}
	for k,v in pairs(t) do
		table.insert(s,k)
	end
	return s
end
function onUse(cid, item, fromPosition, itemEx, toPosition)
local exist = getThingFromPos(basin).uid
local itm = getThingFromPos(basin).itemid
 
	if isContainer(exist) then
		local t = getContentDescription(exist,2)
		local t2 = getContentDescription(exist,1)
		if #t > 0 then
			local f = {}
			for i = 1,#t do
				if not isInArray(getKey(f),t[i]) then
					f[t[i]] = 1
				else
					f[t[i]] = f[t[i]] + 1
				end
			end
			local str = "Sold items : "
			local money = 0
			for k,v in pairs(f) do
				str = str.."\n".."•••• "..v.."x "..getItemNameById(k).." : ".. ( tonumber(items[k].cost) * tonumber(v) ) .. " gold coins."
				money = money + tonumber(items[k].cost) * tonumber(v)
 
			end
			for i = 1,#t2 do
				doRemoveItem(t2[i])
			end
			doPlayerSendTextMessage(cid,27,str)
			doPlayerAddMoney(cid,money)
			if #t > 1 then
				doPlayerSendTextMessage(cid,19," Total money : ".. money.." gold coins.")
			end
		else
			doPlayerSendTextMessage(cid,18,"Warning : Sold nothing --> either bag is empty or items included arn't sellable here.")
			doSendMagicEffect(fromPosition,2)
 
		end
	else
		local merge = items[itm]
		if not merge then
			doPlayerSendTextMessage(cid,18,"Warning : This item isn't sellable here.")
			doSendMagicEffect(fromPosition,2)
 
		else
			doRemoveItem(exist)
			doPlayerSendTextMessage(cid,27,"Sold item : \n •••• 1x "..getItemNameById(itm).." : "..merge.cost.."." )
			doPlayerAddMoney(cid,merge.cost)
		end
 
	end
	return doTransformItem(item.uid,item.uid == 1945 and 1946 or 1945)
end