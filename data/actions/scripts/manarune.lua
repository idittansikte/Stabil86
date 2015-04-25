 
function onUse(cid, item, fromPosition, itemEx, toPosition)
		
		if (getPlayerVocation(cid) == 1) or (getPlayerVocation(cid) == 5) or (getPlayerVocation(cid) == 2) or (getPlayerVocation(cid) == 6) then 
			local manamax = getPlayerMaxMana(cid)
			local min = 7 -- this means % minimum healing
			local max = 9 -- this means % maximum healing
			local mana_add = math.random((manamax * (min/100)), (manamax * (max/100)))

    		doPlayerAddMana(cid, mana_add)
    		doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
    		doSendAnimatedText(getPlayerPosition(cid),""..mana_add.."", TEXTCOLOR_LIGHTBLUE)
		end
		
		if (getPlayerVocation(cid) == 3) or (getPlayerVocation(cid) == 7) then 
			local manamax = getPlayerMaxMana(cid)
			local min = 16 -- this means % minimum healing
			local max = 18 -- this means % maximum healing
			local mana_add = math.random((manamax * (min/100)), (manamax * (max/100)))

    		doPlayerAddMana(cid, mana_add)
    		doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
    		doSendAnimatedText(getPlayerPosition(cid),""..mana_add.."", TEXTCOLOR_YELLOW)
		end
		
		if (getPlayerVocation(cid) == 4) or (getPlayerVocation(cid) == 8) then
			local hpmax = getCreatureMaxHealth(cid)
			local min = 20 -- this means % minimum healing
			local max = 22 -- this means % maximum healing
			local hp_add = math.random((hpmax * (min/100)), (hpmax * (max/100)))
			
			doCreatureAddHealth(cid, hp_add)
    		doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_BLUE)
    		doSendAnimatedText(getPlayerPosition(cid),""..hp_add.."", TEXTCOLOR_GREEN)
       end

return true
end