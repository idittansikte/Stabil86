function onUse(cid, item, frompos, item2, topos)
	doTransformItem(item.uid, 2239)
	local points = db.getResult("SELECT `premium_points` FROM `accounts` WHERE id = "..getPlayerAccountId(cid).." LIMIT 1")
	db.executeQuery("UPDATE `accounts` SET  `premium_points` =  '"..tonumber(points:getDataInt("premium_points"))+100 .."' WHERE  `accounts`.`id` = "..getPlayerAccountId(cid).." LIMIT 1;")
	doPlayerSay(cid, 'Added 100 points premium!', 19)
   	return true
end