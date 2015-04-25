function onSay(cid, words, param)

if doPlayerRemoveMoney(cid, 20000) == TRUE then
doPlayerAddItem(cid, 2173, 1)
doPlayerSay(cid,"You Bought Amulet of Loss",19)
doSendMagicEffect(getPlayerPosition(cid), 49)
else
doPlayerSay(cid,"Need money, yea?",19)
doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
end

end