--Script made by Pitufo/Haifurer!
local config = {
[0] = { "Fist skill UP", 49}, -- 30 = variable[2] -- Animation effect
[1] = { "Club skill UP", 49}, -- 30 = variable[2] -- Animation effect
[2] = { "Sword skill UP", 49}, -- 30 = variable[2] -- Animation effect
[3] = { "Axe skill UP", 49}, -- 30 = variable[2] -- Animation effect
[4] = { "Distance skill UP", 49}, -- 30 = variable[2] -- Animation effect
[5] = { "Shield skill UP", 49}, -- 30 = variable[2] -- Animation effect
[6] = { "Fishing skill UP", 49}, -- 30 = variable[2] -- Animation effect
[7] = { "Magic level UP", 49}, -- 30 = variable[2] -- Animation effect
[8] = { "Level UP", 49} -- 30 = variable[2] -- Animation effect
}
function onAdvance(cid, skill, oldlevel, newlevel)
local pos = getPlayerPosition(cid)
local positions = {
{x=pos.x+1,y=pos.y-1,z=pos.z},
{x=pos.x-1,y=pos.y-1,z=pos.z},
{x=pos.x+1,y=pos.y+1,z=pos.z},
{x=pos.x-1,y=pos.y+1,z=pos.z},
{x=pos.x+2,y=pos.y,z=pos.z},
{x=pos.x-2,y=pos.y,z=pos.z},
{x=pos.x,y=pos.y+2,z=pos.z},
{x=pos.x,y=pos.y-2,z=pos.z}}
for type, variable in pairs(config) do
if skill == type then
doCreatureSay(cid, ""..variable[1].." ["..newlevel.."]", TALKTYPE_ORANGE_1)
for i = 1, table.maxn(positions) do
doSendMagicEffect(positions[i],variable[2])
end
end
end
return TRUE
end