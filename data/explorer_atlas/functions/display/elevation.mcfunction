execute if data storage explorer_atlas:temp string run data modify storage explorer_atlas:temp string append value '{"text":" | ","color":"dark_gray"}'
data modify storage explorer_atlas:temp string append value '{"translate":"explorer_atlas.hud.elevation","fallback":"Elevation: ","color":"gold"}'

execute store result score $elevation explorer_atlas.temp run data get entity @s Pos[1]
scoreboard players operation $elevation explorer_atlas.temp += $cfg.elevation_offset explorer_atlas.temp
data modify storage explorer_atlas:temp string append value '[{"score":{"name":"$elevation","objective":"explorer_atlas.temp"}},"m"]'
