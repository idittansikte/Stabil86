local config = {
	id_old = 6530,
	id_new = 2640,
	cost = 100000
}
function onSay(cid, words, param)
	if(getPlayerItemCount(cid, config.id_old) > 0)then
		if(doPlayerRemoveMoney(cid, config.cost))then
			doPlayerRemoveItem(cid, config.id_old, 1)
			doPlayerAddItem(cid, config.id_new, 1, true)
			doPlayerSendTextMessage(cid, 20, 'Soft boots has been repaired!')
		else
			doPlayerSendCancel(cid, 'You do not have money!')
		end
	else
		doPlayerSendCancel(cid, 'You do not have any worn soft boots!')
	end
return true
end
