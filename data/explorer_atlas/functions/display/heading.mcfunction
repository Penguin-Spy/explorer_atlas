execute if data storage explorer_atlas:temp string run data modify storage explorer_atlas:temp string append value " | "
data modify storage explorer_atlas:temp string append value "Heading: "

execute store result storage explorer_atlas:temp temp int 1 run data get entity @s Rotation[0]
data modify storage explorer_atlas:temp string append string storage explorer_atlas:temp temp
