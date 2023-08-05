data modify storage explorer_atlas:temp atlas set from entity @s Inventory[{Slot:-106b}]
data remove storage explorer_atlas:temp atlas.Slot
function explorer_atlas:atlas_rendering/update_atlas
execute in minecraft:overworld run item replace entity @s weapon.offhand from block -30000000 0 2435 container.0