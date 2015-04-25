function onUse(cid, item, frompos, item2, topos)
			if getPlayerStorageValue(cid, bjStor) == getStorage(bjTurn) then
				for i=1, 11 do
					if getPlayerStorageValue(cid, 12361+i) < 1 then
						setPlayerStorageValue(cid, 12361+i, math.random(1,13))
						return true
					end
				end
			else
				doPlayerSendTextMessage(cid, 19, "It's not your turn!")
			end
			return true
		end 