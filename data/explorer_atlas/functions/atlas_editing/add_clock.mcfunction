function explorer_atlas:atlas_editing/add_item

# add clock
data modify storage explorer_atlas:temp item.tag.explorer_atlas.has_clock set value 1b
# add clock to the list
data modify storage explorer_atlas:temp item.tag.display.Lore insert 2 value '[" ",{"translate":"item.minecraft.clock","color":"gray","italic":false}]'

function explorer_atlas:atlas_editing/update_hand