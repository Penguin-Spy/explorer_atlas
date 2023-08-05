data modify storage explorer_atlas:temp atlas set from entity @s SelectedItem
function explorer_atlas:atlas_rendering/update_atlas
execute in minecraft:overworld run item replace entity @s weapon.mainhand from block -30000000 0 2435 container.0