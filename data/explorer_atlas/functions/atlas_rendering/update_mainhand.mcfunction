data modify storage explorer_atlas:temp atlas set from entity @s SelectedItem
function explorer_atlas:atlas_rendering/update_atlas
item modify entity @s weapon.mainhand explorer_atlas:copy_atlas_data