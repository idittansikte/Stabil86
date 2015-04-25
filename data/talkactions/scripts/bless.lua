local bless = {1, 2, 3, 4, 5}
local cost = 100000 -- Cost in gp.
function onSay(cid, words, param)
	for i = 1, table.maxn(bless) do
		if(getPlayerBlessing(cid, bless[i])) then
			doPlayerSendCancel(cid, "You already have all the blessings.")
			return TRUE
		end
	end
	if(doPlayerRemoveMoney(cid, cost) == TRUE) then
		for i = 1, table.maxn(bless) do
			doPlayerAddBlessing(cid, bless[i])
		end
		doPlayerSendTextMessage(cid,24, "You are now blessed. Thank god!")
		doSendMagicEffect(getPlayerPosition(cid), 28)
	else
		doPlayerSendCancel(cid, "You do not have enough money.")
	end
	return TRUE
end
