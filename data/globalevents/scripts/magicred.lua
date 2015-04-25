local config = {
{pos = {x=309, y=276, z=6}, text = "LOW EXP"},
{pos = {x = 431, y = 350, z = 5}, text = "LOW EXP"},
{pos = {x = 391, y = 345, z = 4}, text = "HIGH EXP"},
{pos = {x=997, y=995, z=7}, text = "QUESTS"},
{pos = {x = 431, y = 351, z = 5}, text = "QUESTS"},
{pos = {x=999, y=995, z=7}, text = "EXP"},
{pos = {x=1006, y=996, z=8}, text = "EXP"},
{pos = {x = 313, y = 276, z = 6}, text = "HIGH EXP"},
{pos = {x = 393, y = 345, z = 4}, text = "QUESTS"},
{pos = {x=1323, y=897, z=6}, text = "QUESTS"},
{pos = {x=1001, y=995, z=7}, text = "TRAINERS"},
{pos = {x=941, y=970, z=7}, text = "NO PZ!"},
{pos = {x=1232, y=1032, z=6}, text = "1 vs 1"},
{pos = {x=1236, y=1036, z=6}, text = "3 vs 3"},
{pos = {x=1254, y=1034, z=6}, text = "OPEN BATTLE"},
{pos = {x=1263, y=1032, z=6}, text = "TRAP BATTLE"},
{pos = {x=1025, y=996, z=7}, text = "BOSSES"},
{pos = {x=1035, y=988, z=6}, text = "WAR ZONE"},
{pos = {x=1029, y=928, z=7}, text = "SHOPS"},
{pos = {x=1029, y=929, z=7}, text = "TRAINERS"},
{pos = {x=997, y=999, z=6}, text = "WAR ZONE"},
{pos = {x=1030, y=998, z=3}, text = "ARENA PVP"},
{pos = {x=1032, y=998, z=4}, text = "OPEN BATTLE"},
{pos = {x=1033, y=1000, z=4}, text = "TRAP BATTLE"},
{pos = {x=997, y=1001, z=6}, text = "ZOMBIE"},
{pos = {x=1318, y=868, z=6}, text = "MONSTERS"},
{pos = {x = 1057, y = 957, z = 8}, text = "Rotworms"},
{pos = {x=1008, y=1003, z=7}, text = "START EXP"},
{pos = {x=999, y=996, z=6}, text = "C.T.F."}
}
local color = TEXTCOLOR_DARKYELLOW
function onThink(interval, lastExecution)
for i=1, #config do
	doSendMagicEffect(config[i].pos, 68)
	doSendAnimatedText(config[i].pos,config[i].text,color)
end
return TRUE
end