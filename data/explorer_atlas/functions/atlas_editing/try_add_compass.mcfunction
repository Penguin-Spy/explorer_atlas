# delay the actionbar hud from showing
scoreboard players set @s explorer_atlas.hud_delay 20

# if there's already a compass, display message & return early
execute if data entity @s SelectedItem.tag.explorer_atlas.has_compass run title @s actionbar {"translate":"explorer_atlas.atlas_has_item","fallback": "This explorer atlas already has a %s","with": [{"translate":"item.minecraft.compass"}]}
execute if data entity @s SelectedItem.tag.explorer_atlas.has_compass run return 1

# common stuff before adding an item
function explorer_atlas:atlas_editing/add_item

# add compass to data
data modify storage explorer_atlas:temp atlas.tag.explorer_atlas.has_compass set value 1b
# add compass to the list (after clock if it exists, otherwise at the beginning)
execute if data storage explorer_atlas:temp atlas.tag.explorer_atlas.has_clock run data modify storage explorer_atlas:temp atlas.tag.display.Lore insert 3 value '[" ",{"translate":"item.minecraft.compass","color":"gray","italic":false}]'
execute unless data storage explorer_atlas:temp atlas.tag.explorer_atlas.has_clock run data modify storage explorer_atlas:temp atlas.tag.display.Lore insert 2 value '[" ",{"translate":"item.minecraft.compass","color":"gray","italic":false}]'

title @s actionbar {"translate":"explorer_atlas.atlas_attached_item","fallback": "Attached a %s to your explorer atlas","with": [{"translate":"item.minecraft.compass"}]}

item modify entity @s weapon.mainhand explorer_atlas:copy_atlas_data