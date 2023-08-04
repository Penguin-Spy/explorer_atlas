# ran as the player, at the player

data remove storage explorer_atlas:temp string
# string is an array of the following values: (the | only appear if there's something before them)
# [0] "Time: " <time>
# [1] " | "
# [2] "Heading: "
# [3] <heading>
# [4] " | "
# [5] "Elevation: "
# [6] <elevation>

# time, heading, elevation
execute if predicate explorer_atlas:holding_clock run data modify storage explorer_atlas:temp string append value '{"nbt":"time","storage":"explorer_atlas:temp","interpret":true}'
execute if predicate explorer_atlas:holding_compass run function explorer_atlas:display/heading
execute if predicate explorer_atlas:holding_depth_meter run function explorer_atlas:display/elevation

# render actionbar hud
execute unless score @s explorer_atlas.hud_delay matches 1.. if data storage explorer_atlas:temp string run title @s actionbar ["",{"nbt":"string[0]","storage":"explorer_atlas:temp","interpret":true},{"nbt":"string[1]","storage":"explorer_atlas:temp","interpret":true},{"nbt":"string[2]","storage":"explorer_atlas:temp","interpret":true},{"nbt":"string[3]","storage":"explorer_atlas:temp","interpret":true},{"nbt":"string[4]","storage":"explorer_atlas:temp","interpret":true},{"nbt":"string[5]","storage":"explorer_atlas:temp","interpret":true},{"nbt":"string[6]","storage":"explorer_atlas:temp","interpret":true}]
execute if data storage explorer_atlas:temp string run tag @s add explorer_atlas.showing_actionbar

# if it was shown last update (but there's no hud this update), clear it
execute unless score @s explorer_atlas.hud_delay matches 1.. if entity @s[tag=explorer_atlas.showing_actionbar] unless data storage explorer_atlas:temp string run title @s actionbar ""
execute unless data storage explorer_atlas:temp string run tag @s remove explorer_atlas.showing_actionbar


# update interaction entity stuff
execute if entity @s[tag=explorer_atlas.has_interactor] unless predicate explorer_atlas:sneaking_with_atlas run function explorer_atlas:atlas_editing/remove_interactor
execute unless entity @s[tag=explorer_atlas.has_interactor] if predicate explorer_atlas:sneaking_with_atlas run function explorer_atlas:atlas_editing/create_interactor

# note, this might cause the interaction entities to swap between players. that's fine, the specific entity itself has no unique data
execute if entity @s[tag=explorer_atlas.has_interactor] run execute positioned ~ ~0.77 ~ run tp @e[type=interaction,tag=explorer_atlas.atlas_interactor,limit=1,sort=nearest] ~ ~ ~


# countdown hud delay
execute if score @s explorer_atlas.hud_delay matches 1.. run scoreboard players remove @s explorer_atlas.hud_delay 1