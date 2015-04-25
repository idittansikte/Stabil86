function onUse(cid, item, frompos, item2, topos)
			if getPlayerStorageValue(cid, bjStor) == getStorage(bjTurn) then
				setPlayerStorageValue(cid, bjDone, 1)
			else
				doPlayerSendTextMessage(cid, 19, "It's not your turn!")
			end
			return true
		end