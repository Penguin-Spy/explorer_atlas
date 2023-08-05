# delay the actionbar hud from showing
scoreboard players set @s explorer_atlas.hud_delay 20

# load atlas item from players hand
data modify storage explorer_atlas:temp atlas set from entity @s SelectedItem

# load map item from offhand, removing the Slot tag
data modify storage explorer_atlas:temp offhand_map set from entity @s Inventory[{Slot:-106b}]
data remove storage explorer_atlas:temp offhand_map.Slot
data remove storage explorer_atlas:temp offhand_map.Count


### Check that the map can be added

# check that the map data is correct
execute store result score $result explorer_atlas.temp run function explorer_atlas:atlas_editing/check_map_data
execute if score $result explorer_atlas.temp matches 1 run title @s actionbar {"translate":"explorer_atlas.map_scale_mismatch","fallback": "This map's scale doesn't match maps already in the atlas"}
execute if score $result explorer_atlas.temp matches 2 run tellraw @s {"translate":"explorer_atlas.map_data_missing","fallback": "This map is missing required data!"}
execute if score $result explorer_atlas.temp matches 2 run tellraw @s {"translate":"explorer_atlas.map_data_missing_hint","fallback": "Run <todo: this command> to fix this."}
execute if score $result explorer_atlas.temp matches 3 run title @s actionbar {"translate":"explorer_atlas.map_is_atlas","fallback": "Cannot add an atlas to an atlas"}
# return early if the data was incorrect
execute if score $result explorer_atlas.temp matches 1.. run return 0

# check that a map for this area isn't already in the atlas
# offhand_map.tag.explorer_atlas is the map's data (map_x, map_z, map_dimension, map_scale)
data remove storage explorer_atlas:temp found_map
execute store result score $result explorer_atlas.temp run function explorer_atlas:find_map with storage explorer_atlas:temp offhand_map.tag.explorer_atlas
execute if score $result explorer_atlas.temp matches 0 run title @s actionbar {"translate":"explorer_atlas.error","fallback": "An unknown error occured","color":"red"}
execute if score $result explorer_atlas.temp matches 0 run return 0
# return early if it exists
execute if data storage explorer_atlas:temp found_map run title @s actionbar {"translate":"explorer_atlas.atlas_has_map","fallback": "This explorer atlas already has that map"}
execute if data storage explorer_atlas:temp found_map run return 0


### Safe to add map

# add map to list
data modify storage explorer_atlas:temp atlas.tag.explorer_atlas.maps append from storage explorer_atlas:temp offhand_map

# increase the map count by 1
execute store result score $count explorer_atlas.temp run data get storage explorer_atlas:temp atlas.tag.explorer_atlas.map_count
scoreboard players add $count explorer_atlas.temp 1
execute store result storage explorer_atlas:temp atlas.tag.explorer_atlas.map_count int 1 run scoreboard players get $count explorer_atlas.temp
# update the lore
function explorer_atlas:atlas_editing/update_map_count_lore with storage explorer_atlas:temp atlas.tag.explorer_atlas

# load atlas back into players hand
execute in minecraft:overworld run data remove block -30000000 0 2435 Items
execute in minecraft:overworld run data modify block -30000000 0 2435 Items append from storage explorer_atlas:temp atlas
execute in minecraft:overworld run item replace entity @s weapon.mainhand from block -30000000 0 2435 container.0


# remove map & play sound
item modify entity @s weapon.offhand explorer_atlas:remove_1
playsound minecraft:item.armor.equip_leather player @s

# display actionbar message with the name of the map, or "Map" if no custom name
execute if data entity @s Inventory[{Slot:-106b}].tag.display.Name run title @s actionbar {"translate":"explorer_atlas.atlas_added_map","fallback": "Added %s to your explorer atlas","with": [{"nbt":"Inventory[{Slot:-106b}].tag.display.Name","entity":"@s","interpret":true,"italic":true}]}
execute unless data entity @s Inventory[{Slot:-106b}].tag.display.Name run title @s actionbar {"translate":"explorer_atlas.atlas_added_map","fallback": "Added %s to your explorer atlas","with": [{"translate":"item.minecraft.filled_map"}]}
