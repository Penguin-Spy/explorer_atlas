data modify storage explorer_atlas:temp atlas set from entity @s Inventory[{Slot:-106b}]
function explorer_atlas:atlas_rendering/update_atlas
item modify entity @s weapon.offhand explorer_atlas:copy_atlas_data