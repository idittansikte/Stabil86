local outfits = {
						['citizen']={128,136},
						['hunter']={129,137},
						['mage']={130,138},
						['knight']={131,139},
						['noblewoman']={132,140},
						['summoner']={133,141},
						['warrior']={134,142},
						['barbarian']={143,147},
						['druid']={144,148},
						['wizard']={145,149},
						['oriental']={146,150},
						['pirate']={151,155},
						['assassin']={152,156},
						['beggar']={153,157},
						['shaman']={154,158}, 
						['norsewoman']={251,252}, 
						['nightmare']={268,269}, 
						['jester']={273,270}, 
						['brotherhood']={278,279}, 
						['demonhunter']={289,288}, 
						['yalaharian']={325,324}, 
						['warmaster']={335,336}
						}
local itemIdOfAddonDoll = 9693
local msg = {'Command requires param!', 'You dont have Addon Doll!', 'Full Addon Set of ', ' sucesfully added!'} 

function onSay(cid, words, param)
if param == '' or not outfits[param:lower()] then
	return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, msg[1])
end
if not doPlayerRemoveItem(cid, itemIdOfAddonDoll, 1) then
	return doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, msg[2])
end
doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, msg[3]..param:lower()..msg[4])
doSendMagicEffect(getThingPos(cid), CONST_ME_GIFT_WRAPS)
return doPlayerAddOutfit(cid, outfits[param:lower()][(getPlayerSex(cid) == 0 and 2 or 1)], 3)
end