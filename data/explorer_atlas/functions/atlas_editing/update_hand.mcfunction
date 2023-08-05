# load item into players hand
execute in minecraft:overworld run data remove block -30000000 0 2435 Items
execute in minecraft:overworld run data modify block -30000000 0 2435 Items append from storage explorer_atlas:temp item
execute in minecraft:overworld run item replace entity @s weapon.mainhand from block -30000000 0 2435 container.0