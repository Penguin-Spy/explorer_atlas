# must run as the player, at the player to calculate map data for
# only works with 1:1 scale right now

execute store result score $x explorer_atlas.temp run data get entity @s Pos[0]
scoreboard players operation $x explorer_atlas.temp += #64 explorer_atlas.temp
scoreboard players operation $x explorer_atlas.temp /= #128 explorer_atlas.temp

execute store result score $z explorer_atlas.temp run data get entity @s Pos[2]
scoreboard players operation $z explorer_atlas.temp += #64 explorer_atlas.temp
scoreboard players operation $z explorer_atlas.temp /= #128 explorer_atlas.temp


# move to storage
execute store result storage explorer_atlas:temp map_data.map_x int 1 run scoreboard players get $x explorer_atlas.temp
execute store result storage explorer_atlas:temp map_data.map_z int 1 run scoreboard players get $z explorer_atlas.temp
data modify storage explorer_atlas:temp map_data.map_dimension set from entity @s Dimension