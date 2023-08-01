execute if data storage explorer_atlas:temp string run data modify storage explorer_atlas:temp string append value " | "
data modify storage explorer_atlas:temp string append value "Depth: "

execute store result storage explorer_atlas:temp temp int 1 run data get entity @s Pos[1]
data modify storage explorer_atlas:temp string append string storage explorer_atlas:temp temp
