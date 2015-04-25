
function onStepIn(cid, item, frompos, item2, topos)

    local vip = getPlayerStorageValue(cid,11551) >= 1 --The storage that the vip system uses.
    local kickposition = {x=1303, y=957, z=7} --Place where the Player will be teleported if not vip, change it
        local newposition = {x=1026, y=932, z=7} --Place where the player will be teleported IF VIP, change it.


    if(vip) then
        doPlayerSendTextMessage(cid, 19, "You are VIP, you are allowed to pass.")
                doSendMagicEffect(getPlayerPosition(cid),2) 
                doTeleportThing(cid, newposition) 
                doSendMagicEffect(newposition,10)
    else
        doPlayerSendTextMessage(cid, 19, "You are not VIP, you can't pass.")
                doTeleportThing(cid, kickposition)
    end
end  