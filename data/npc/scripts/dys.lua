local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
 
local Topic, Description = {}, {}
 
local t = {
	price = 100000, -- How much it will cost, using GP's.
	maxlen = 20, -- Maximum length of description
	altPayment = {9020, 150}, -- Pay with a different item (e.g. Chistmas Tokens)
	yellFrequency = 1000 -- The higher, the less frequent.
}
 
local thinkMsg = {
	"I will mark your weapon for a decent price!",

}
 
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 		npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 							npcHandler:onThink() end
 
function greetCallback(cid)
	Topic[cid], Description[cid] = 1, nil
	return true
end
 
function thinkCallback(cid)
	local rand = math.random(t.yellFrequency)
	if thinkMsg[rand] then
		doCreatureSay(getNpcCid(), thinkMsg[rand], TALKTYPE_YELL)
	end
	return true
end
 
function creatureSayCallback(cid, type, msg)
	if not npcHandler:isFocused(cid) then
		return false
	elseif Topic[cid] == 1 and msgcontains(msg, 'yes') then
		npcHandler:say('I can create a unique description for your weapons or equipment! Put the chosen item at the arrows! (arrow slot), and write {on} to contunue.', cid)
		Topic[cid] = 2
	elseif isInArray({1,2,4}, Topic[cid]) and msgcontains(msg, 'no') then
		npcHandler:say('I see that you do not care about your items ..', cid)
		Topic[cid] = nil
		npcHandler:releaseFocus(cid)
	elseif Topic[cid] == 2 and (msgcontains(msg, 'on') or msgcontains(msg, 'yes')) then
		local v = getPlayerSlotItem(cid, CONST_SLOT_AMMO)
		if v.uid < 1 then
			npcHandler:say('Have you put the item you want in place of arrows or not?', cid)
		elseif v.actionid > 0 and v.actionid - 100 ~= getPlayerGUID(cid) then
			npcHandler:say('Thief!', cid)
			Topic[cid] = nil
			npcHandler:releaseFocus(cid)
		elseif getItemInfo(v.itemid).stackable then
			npcHandler:say('This item is not permitted!. Put another item and write {on}.', cid)
		else
			npcHandler:say('Now, tell me what you want to be your description! --> ex: "The Greatest" will be YOURNAME\'s ' .. getItemInfo(v.itemid).name .. ' (The Greatest)', cid)
			Topic[cid] = 3
		end
	elseif Topic[cid] == 3 then
		if msg:len() > t.maxlen then
			npcHandler:say('This is longer than the' .. t.maxlen .. ' permitted characters.', cid)
		else
			npcHandler:say('Do you want me to mark it with '.. msg ..' for ' .. t.price .. ' gold?', cid)
			Description[cid] = msg
			Topic[cid] = 4
		end
	elseif Topic[cid] == 4 and msgcontains(msg, 'yes') then
		local v = getPlayerSlotItem(cid, CONST_SLOT_AMMO)
		if v.uid < 1 or getItemInfo(v.itemid).stackable or (v.actionid > 0 and v.actionid - 100 ~= getPlayerGUID(cid)) then
			npcHandler:say('What are you doing? Do not have money?', cid)
			npcHandler:releaseFocus(cid)
		elseif doPlayerRemoveMoney(cid, t.price) or doPlayerRemoveItem(cid, t.altPayment[1], t.altPayment[2]) then
			local n = getCreatureName(cid)
			doItemSetAttribute(v.uid, "name", n .. "'" .. (n:sub(-1)=="s" and "" or "s") .. " " .. getItemInfo(v.itemid).name .. " (" .. Description[cid] .. ")")
			if v.actionid == 0 then
				doItemSetAttribute(v.uid, "aid", getPlayerGUID(cid) + 100)
			end
			doSendMagicEffect(getThingPos(cid), CONST_ME_MAGIC_RED)
			npcHandler:say('Hooray! Your item got a description of yours' .. getItemInfo(v.itemid).name .. '.', cid)
		else
			npcHandler:say('I guess you ran out of money.', cid)
			npcHandler:releaseFocus(cid)
		end
		Topic[cid] = nil
		Description[cid] = nil
	end
	return true
end
 
npcHandler:setMessage(MESSAGE_FAREWELL, 'I hope you choose well.')
npcHandler:setMessage(MESSAGE_WALKAWAY, 'Baah...')
npcHandler:setMessage(MESSAGE_GREET, 'Hello, |PLAYERNAME|! I can give a description on your weapons or equipment, you want to continue?')
npcHandler:setCallback(CALLBACK_ONTHINK, thinkCallback)
npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())