function explorer_atlas:atlas_editing/add_item

# add compass to data
data modify storage explorer_atlas:temp item.tag.explorer_atlas.has_compass set value 1b
# add compass to the list (after clock if it exists, otherwise at the beginning)
execute if data storage explorer_atlas:temp item.tag.explorer_atlas.has_clock run data modify storage explorer_atlas:temp item.tag.display.Lore insert 3 value '[" ",{"translate":"item.minecraft.compass","color":"gray","italic":false}]'
execute unless data storage explorer_atlas:temp item.tag.explorer_atlas.has_clock run data modify storage explorer_atlas:temp item.tag.display.Lore insert 2 value '[" ",{"translate":"item.minecraft.compass","color":"gray","italic":false}]'

function explorer_atlas:atlas_editing/update_hand