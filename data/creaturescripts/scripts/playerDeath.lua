function onDeath(cid)
	if getPlayerSlotItem(cid, 2).itemid == 2173 then
					doPlayerRemoveItem(cid, 2173, 1)
	end  
end 