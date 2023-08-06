# ran at the player, as the player

scoreboard players set @s explorer_atlas.used_map 0

# filter items to only hold filled_maps that are lacking the explorer_atlas tag
data remove storage explorer_atlas:temp items
data modify storage explorer_atlas:temp items append from entity @s Inventory[{id:"minecraft:filled_map"}]
data remove storage explorer_atlas:temp items[{tag:{explorer_atlas:{}}}]
# todo: remove buried treasure/explorer maps

# get data for map (map_x, map_z, map_dimension) for current location
function explorer_atlas:calculate_map_data
# the map scale is always 0 when first created (0, 1, 2, 3, 4 -> 1:1, 1:2, 1:4, 1:8, 1:16 scaling)
data merge storage explorer_atlas:temp {map_data:{map_scale:0,map_scale_ratio:"1"}}


# copy map data to all maps in slots that don't have map data
execute if data storage explorer_atlas:temp items[{Slot:0b}] run item modify entity @s container.0 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:1b}] run item modify entity @s container.1 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:2b}] run item modify entity @s container.2 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:3b}] run item modify entity @s container.3 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:4b}] run item modify entity @s container.4 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:5b}] run item modify entity @s container.5 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:6b}] run item modify entity @s container.6 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:7b}] run item modify entity @s container.7 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:8b}] run item modify entity @s container.8 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:9b}] run item modify entity @s container.9 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:10b}] run item modify entity @s container.10 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:12b}] run item modify entity @s container.12 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:13b}] run item modify entity @s container.13 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:14b}] run item modify entity @s container.14 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:15b}] run item modify entity @s container.15 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:16b}] run item modify entity @s container.16 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:17b}] run item modify entity @s container.17 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:18b}] run item modify entity @s container.18 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:19b}] run item modify entity @s container.19 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:20b}] run item modify entity @s container.20 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:21b}] run item modify entity @s container.21 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:22b}] run item modify entity @s container.22 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:23b}] run item modify entity @s container.23 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:24b}] run item modify entity @s container.24 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:25b}] run item modify entity @s container.25 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:26b}] run item modify entity @s container.26 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:27b}] run item modify entity @s container.27 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:28b}] run item modify entity @s container.28 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:29b}] run item modify entity @s container.29 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:30b}] run item modify entity @s container.30 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:31b}] run item modify entity @s container.31 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:32b}] run item modify entity @s container.32 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:33b}] run item modify entity @s container.33 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:34b}] run item modify entity @s container.34 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:35b}] run item modify entity @s container.35 explorer_atlas:copy_map_data
execute if data storage explorer_atlas:temp items[{Slot:-106b}] run item modify entity @s weapon.offhand explorer_atlas:copy_map_data

# count how many map items were found
execute store result score $result explorer_atlas.temp if data storage explorer_atlas:temp items[]

# if 0, the player's inventory may be full and the map was dropped on the floor
# add data to all nearby map items that don't have the explorer_atlas data
execute if score $result explorer_atlas.temp matches 0 as @e[type=item,nbt={Item:{id:"minecraft:filled_map"}},distance=0..3] unless data entity @s Item.tag.explorer_atlas run data modify entity @s Item.tag.explorer_atlas set from storage explorer_atlas:temp map_data

# this still might fail to add the data somehow, but, uh, hopefully not ¯\_(ツ)_/¯

# if 0, no maps were found, warn the player
#execute if score $result explorer_atlas.temp matches 0 run tellraw @s {"translate":"explorer_atlas.map_not_found", "fallback":"Error! You filled out a map, but the item wasn't found by the Explorer Atlas datapack. That map item will be missing required data."}