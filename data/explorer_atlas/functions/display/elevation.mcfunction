execute if data storage explorer_atlas:temp string run data modify storage explorer_atlas:temp string append value '{"text":" | ","color":"dark_gray"}'
data modify storage explorer_atlas:temp string append value '{"translate":"explorer_atlas.hud.elevation","fallback":"Elevation: ","color":"gold"}'

execute if biome ~ ~ ~ #is_end run data modify storage explorer_atlas:temp string append value '["???"]'
execute if biome ~ ~ ~ #is_end run return 0

execute if predicate explorer_atlas:display_random run data modify storage explorer_atlas:temp string append value '[{"score":{"name":"$random.elevation","objective":"explorer_atlas.temp"}},"m"]'
execute if predicate explorer_atlas:display_random run return 0

execute store result score $elevation explorer_atlas.temp run data get entity @s Pos[1]
scoreboard players operation $elevation explorer_atlas.temp += $cfg.elevation_offset explorer_atlas.temp
#execute if predicate explorer_atlas:display_random run scoreboard players remove $elevation explorer_atlas.temp 999
data modify storage explorer_atlas:temp string append value '[{"score":{"name":"$elevation","objective":"explorer_atlas.temp"}},"m"]'
