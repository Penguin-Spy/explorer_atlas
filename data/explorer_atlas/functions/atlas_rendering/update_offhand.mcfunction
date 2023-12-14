data modify storage explorer_atlas:temp atlas set from entity @s Inventory[{Slot:-106b}]

execute store result score $result explorer_atlas.temp run function explorer_atlas:atlas_rendering/update_atlas
# returns 1 for found map, 2 for not found map

# only replace the item & copy count if the item type changed
execute if score $result explorer_atlas.temp matches 1 if data storage explorer_atlas:temp atlas{id:"minecraft:book"} run item replace entity @s weapon.offhand with filled_map
execute if score $result explorer_atlas.temp matches 1 if data storage explorer_atlas:temp atlas{id:"minecraft:book"} run item modify entity @s weapon.offhand explorer_atlas:copy_atlas_count
execute if score $result explorer_atlas.temp matches 2 if data storage explorer_atlas:temp atlas{id:"minecraft:filled_map"} run item replace entity @s weapon.offhand with book
execute if score $result explorer_atlas.temp matches 2 if data storage explorer_atlas:temp atlas{id:"minecraft:filled_map"} run item modify entity @s weapon.offhand explorer_atlas:copy_atlas_count

# always copy atlas data, and copy found map name if one was found
item modify entity @s weapon.offhand explorer_atlas:copy_atlas_data
execute if score $result explorer_atlas.temp matches 1 run item modify entity @s weapon.offhand explorer_atlas:copy_found_map_name
