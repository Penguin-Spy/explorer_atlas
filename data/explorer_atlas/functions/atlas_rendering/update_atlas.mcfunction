# calc map coords
function explorer_atlas:atlas_rendering/calculate_map_coords
# move to args for calling find_map
execute store result storage explorer_atlas:temp arguments.map_x int 1 run scoreboard players get $x explorer_atlas.temp
execute store result storage explorer_atlas:temp arguments.map_z int 1 run scoreboard players get $z explorer_atlas.temp
data modify storage explorer_atlas:temp arguments.map_dimension set from entity @s Dimension

# call find_map
data remove storage explorer_atlas:temp found_map
execute store result score $result explorer_atlas.temp run function explorer_atlas:find_map with storage explorer_atlas:temp arguments
execute if score $result explorer_atlas.temp matches 0 run title @s actionbar {"translate":"explorer_atlas.error","fallback": "An unknown error occured","color":"red"}
execute if score $result explorer_atlas.temp matches 0 run scoreboard players set @s explorer_atlas.hud_delay 20
execute if score $result explorer_atlas.temp matches 0 run return 0

# render map into held item, or replace with book if no map was found
execute if data storage explorer_atlas:temp found_map run function explorer_atlas:atlas_rendering/render_map
execute unless data storage explorer_atlas:temp found_map run function explorer_atlas:atlas_rendering/render_no_map

# prepare to load item into players hand
execute in minecraft:overworld run data remove block -30000000 0 2435 Items
execute in minecraft:overworld run data modify block -30000000 0 2435 Items append from storage explorer_atlas:temp atlas