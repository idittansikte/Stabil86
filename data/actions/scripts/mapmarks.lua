marks = {
    [0] = {pos = {x = 1000, y = 1000, z = 7}, type = MAPMARK_TEMPLE,      description = "Temple"}, 
    [1] = {pos = {x = 1018, y = 999, z = 7}, type = MAPMARK_BAG,         description = "FAST SHOP"}, 
    [2] = {pos = {x = 1027, y = 983, z = 7}, type = MAPMARK_BAG,         description = "NPC"},
    [3] = {pos = {x = 982, y = 916, z = 7}, type = MAPMARK_BAG,         description = "NPC NO PZ!"},
    [4] = {pos = {x = 1026, y = 960, z = 7}, type = MAPMARK_GREENNORTH,  description = "BRAMA"},
    [5] = {pos = {x = 944, y = 902, z = 7}, type = MAPMARK_GREENNORTH,  description = "BRAMA"},
    [6] = {pos = {x = 1057, y = 947, z = 7}, type = MAPMARK_GREENNORTH,  description = "BRAMA"},
    [7] = {pos = {x = 1032, y = 1001, z = 7}, type = MAPMARK_TICK,  description = "Depo Poludniowe"},
    [8] = {pos = {x = 1026, y = 932, z = 7}, type = MAPMARK_TICK,  description = "Depo Polnocne"},
    [9] = {pos = {x = 949, y = 959, z = 7}, type = MAPMARK_TICK,  description = "Depo zachodnie"},
    [10] = {pos = {x = 940, y = 972, z = 7}, type = MAPMARK_EXCLAMATION,  description = "Depo NO PZ!"},
    [11] = {pos = {x = 1004, y = 892, z = 7}, type = MAPMARK_SWORD,  description = "Eventy"},
    [12] = {pos = {x = 1048, y = 991, z = 7}, type = MAPMARK_DOLLAR,  description = "Questy"}
}
function onUse(cid, item, fromPos, itemEx, toPos)
    for i = 0, #marks do 
        doPlayerAddMapMark(cid, marks[i].pos, marks[i].type, marks[i].description)
    end
    doCreatureSay(cid, 'Map has been updated.', TALKTYPE_MONSTER) 
    return true
end 