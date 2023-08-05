# only works with 1:1 scale right now

execute store result score $x explorer_atlas.temp run data get entity @s Pos[0]
scoreboard players operation $x explorer_atlas.temp += #64 explorer_atlas.temp
scoreboard players operation $x explorer_atlas.temp /= #128 explorer_atlas.temp

execute store result score $z explorer_atlas.temp run data get entity @s Pos[2]
scoreboard players operation $z explorer_atlas.temp += #64 explorer_atlas.temp
scoreboard players operation $z explorer_atlas.temp /= #128 explorer_atlas.temp