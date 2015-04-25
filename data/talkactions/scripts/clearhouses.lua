--Adam 2008
 
--Goosio OT
 
local safelist = {1,2}
 
function onSay(cid, words, param)
if getPlayerGroupId(cid) > 2 then
    pdelete = "Inactive Players With Houses:\n\n"
    days = 14*3600*24
    t=os.date('*t')
    local house = db.getResult("SELECT `owner`,`id` FROM `houses`")
    if(house:getID() ~= -1) then
        while (true) do
        local owner = house:getDataInt("owner")
        local hid = house:getDataInt("id")
            local player = db.getResult("SELECT `id`,`name`,`lastlogin` FROM `players` WHERE `id` = '"..owner.."'  ")
            if(player:getID() ~= -1) then
                local lastlogin = player:getDataInt("lastlogin")
                local pid = player:getDataInt("id")
                local name = player:getDataString("name")
                time=os.time(t) - lastlogin
                offline = time - days
                if offline >= 0 then
                    pdelete = pdelete.."House #"..hid.." owned by "..name.."\n"
                    if isInArray(safelist,hid) == FALSE then                    
                        setHouseOwner(hid, 0)
                    end
                end
            player:free()
            end
            if not(house:next()) then
                break
            end
        end
 
        house:free()    
        doShowTextDialog(cid, 5958, pdelete)
    else
        doPlayerSendCancel(cid, "Error.")
    end
end
return TRUE
end