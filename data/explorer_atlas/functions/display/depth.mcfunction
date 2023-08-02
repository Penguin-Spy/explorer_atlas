execute if data storage explorer_atlas:temp string run data modify storage explorer_atlas:temp string append value '{"text":" | ","color":"dark_gray"}'
data modify storage explorer_atlas:temp string append value '{"text":"Depth: ","color":"gold"}'

execute store result score $depth explorer_atlas.temp run data get entity @s Pos[1]
scoreboard players operation $depth explorer_atlas.temp += $cfg.depth_offset explorer_atlas.temp
data modify storage explorer_atlas:temp string append value '[{"score":{"name":"$depth","objective":"explorer_atlas.temp"},"color":"white"},"m"]'
