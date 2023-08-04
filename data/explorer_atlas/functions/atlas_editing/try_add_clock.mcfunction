# delay the actionbar hud from showing
scoreboard players set @s explorer_atlas.hud_delay 20

# if there's already a clock, display message & return early
execute if data entity @s SelectedItem.tag.explorer_atlas.has_clock run title @s actionbar {"translate":"explorer_atlas.atlas_has_item","fallback": "This explorer atlas already has a %s","with": [{"translate":"item.minecraft.clock"}]}
execute if data entity @s SelectedItem.tag.explorer_atlas.has_clock run return 1

# common stuff before adding an item
function explorer_atlas:atlas_editing/add_item

# add clock
data modify storage explorer_atlas:temp item.tag.explorer_atlas.has_clock set value 1b
# add clock to the list
data modify storage explorer_atlas:temp item.tag.display.Lore insert 2 value '[" ",{"translate":"item.minecraft.clock","color":"gray","italic":false}]'

title @s actionbar {"translate":"explorer_atlas.atlas_attached_item","fallback": "Attached a %s to your explorer atlas","with": [{"translate":"item.minecraft.clock"}]}

function explorer_atlas:atlas_editing/update_hand