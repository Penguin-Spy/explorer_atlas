data remove storage explorer_atlas:temp string

# [0] "Time: "
# [1] <time>
# [2] " | "
# [3] "Heading: "
# [4] <heading>
# [5] " | "
# [6] "Depth: "
# [7] <depth>

# time, heading, depth
execute if predicate explorer_atlas:holding_clock run function explorer_atlas:display/time
execute if predicate explorer_atlas:holding_compass run function explorer_atlas:display/heading
execute if predicate explorer_atlas:holding_depth_meter run function explorer_atlas:display/depth

execute if data storage explorer_atlas:temp string run title @s actionbar ["",{"nbt":"string[0]","storage":"explorer_atlas:temp"},{"nbt":"string[1]","storage":"explorer_atlas:temp"},{"nbt":"string[2]","storage":"explorer_atlas:temp"},{"nbt":"string[3]","storage":"explorer_atlas:temp"},{"nbt":"string[4]","storage":"explorer_atlas:temp"},{"nbt":"string[5]","storage":"explorer_atlas:temp"},{"nbt":"string[6]","storage":"explorer_atlas:temp"},{"nbt":"string[7]","storage":"explorer_atlas:temp"}]
execute if data storage explorer_atlas:temp string run tag @s add explorer_atlas.showing_actionbar

execute unless data storage explorer_atlas:temp string run title @s[tag=explorer_atlas.showing_actionbar] actionbar ""
execute unless data storage explorer_atlas:temp string run tag @s remove explorer_atlas.showing_actionbar