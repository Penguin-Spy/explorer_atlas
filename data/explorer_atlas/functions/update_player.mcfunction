data remove storage explorer_atlas:temp string

# string is an array of the following values: (the | only appear if there's something before them)
# [0] "Time: "
# [1] <time>
# [2] " | "
# [3] "Heading: "
# [4] <heading>
# [5] " | "
# [6] "Depth: "
# [7] <depth>

# time, heading, depth
execute if predicate explorer_atlas:holding_clock run data modify storage explorer_atlas:temp string append value '{"nbt":"time","storage":"explorer_atlas:temp","interpret":true}'
execute if predicate explorer_atlas:holding_compass run function explorer_atlas:display/heading
execute if predicate explorer_atlas:holding_depth_meter run function explorer_atlas:display/depth

# render actionbar hud
execute if data storage explorer_atlas:temp string run title @s actionbar [{"nbt":"string[0]","storage":"explorer_atlas:temp","interpret":true},{"nbt":"string[1]","storage":"explorer_atlas:temp","interpret":true},{"nbt":"string[2]","storage":"explorer_atlas:temp","interpret":true},{"nbt":"string[3]","storage":"explorer_atlas:temp","interpret":true},{"nbt":"string[4]","storage":"explorer_atlas:temp","interpret":true},{"nbt":"string[5]","storage":"explorer_atlas:temp","interpret":true},{"nbt":"string[6]","storage":"explorer_atlas:temp","interpret":true},{"nbt":"string[7]","storage":"explorer_atlas:temp","interpret":true}]
execute if data storage explorer_atlas:temp string run tag @s add explorer_atlas.showing_actionbar

# if it was shown last update (but there's no hud this update), clear it
execute if entity @s[tag=explorer_atlas.showing_actionbar] unless data storage explorer_atlas:temp string run title @s actionbar ""
execute unless data storage explorer_atlas:temp string run tag @s remove explorer_atlas.showing_actionbar