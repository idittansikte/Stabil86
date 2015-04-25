local t = {
	chance = 30,
	rewards = {2472, 2470, 2514}
}
function onUse(cid, item, fromPosition, itemEx, toPosition)
	if math.random(100) <= t.chance then
		doSendMagicEffect(fromPosition, CONST_ME_SOUND_YELLOW)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'Congratulations, you have won in lottery!')
		doTransformItem(item.uid, t.rewards[math.random(#t.rewards)])
	else
		doSendMagicEffect(fromPosition, CONST_ME_POFF)
		doPlayerSendTextMessage(cid, MESSAGE_EVENT_ADVANCE, 'Seems like you got a blank, try again!')
		doTransformItem(item.uid, 7696)
	end
	return true
end