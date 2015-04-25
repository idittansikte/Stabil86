  function onThink(pid, interval)
local t = {x = 1059, y = 899, z = 8}
        for _, pid in ipairs(getPlayersOnline()) do
                if getPlayerStorageValue(pid,23388) == 1 then
				
                        if getPlayerSoul(pid) > 5 then
                                doPlayerAddSoul(pid, -1)
                        else
                             setPlayerStorageValue(pid, 23388, -1)
					doTeleportThing(pid, t)
				doCreatureSay(pid, "You have no enought Soul Points to Train. Come back with more than 6 Soul Points.", TALKTYPE_ORANGE_1)							 
                        end
                end

        end
return true
end