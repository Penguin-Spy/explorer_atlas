# calc map coords (stored in explorer_atlas:temp map_data)
function explorer_atlas:calculate_map_data

# call find_map
data remove storage explorer_atlas:temp found_map
execute store result score $result explorer_atlas.temp run function explorer_atlas:find_map with storage explorer_atlas:temp map_data
execute if score $result explorer_atlas.temp matches 0 run title @s actionbar {"translate":"explorer_atlas.error","fallback": "An unknown error occured","color":"red"}
execute if score $result explorer_atlas.temp matches 0 run scoreboard players set @s explorer_atlas.hud_delay 20
execute if score $result explorer_atlas.temp matches 0 run return 0

# store count of atlas item for the copy_atlas_data item modifier
execute store result score $count explorer_atlas.temp run data get storage explorer_atlas:temp atlas.Count

# render map into held item, or replace with book if no map was found
execute if data storage explorer_atlas:temp found_map run function explorer_atlas:atlas_rendering/render_map
execute if data storage explorer_atlas:temp found_map run return 1
execute unless data storage explorer_atlas:temp found_map run function explorer_atlas:atlas_rendering/render_no_map
execute unless data storage explorer_atlas:temp found_map run return 2
