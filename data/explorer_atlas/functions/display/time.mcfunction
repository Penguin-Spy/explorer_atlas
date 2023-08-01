data modify storage explorer_atlas:temp string append value "Time: "

execute store result storage explorer_atlas:temp temp int 1 run time query daytime
data modify storage explorer_atlas:temp string append string storage explorer_atlas:temp temp
