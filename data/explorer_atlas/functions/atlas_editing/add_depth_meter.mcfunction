function explorer_atlas:atlas_editing/add_item

# add depth meter to data
data modify storage explorer_atlas:temp item.tag.explorer_atlas.has_depth_meter set value 1b
# add depth meter to the list (at the end)
execute if data storage explorer_atlas:temp item.tag.explorer_atlas.has_clock if data storage explorer_atlas:temp item.tag.explorer_atlas.has_compass run data modify storage explorer_atlas:temp item.tag.display.Lore insert 4 value '[" ",{"translate":"item.explorer_atlas.depth_meter","fallback":"Depth Meter","color":"gray","italic":false}]'
execute if data storage explorer_atlas:temp item.tag.explorer_atlas.has_clock unless data storage explorer_atlas:temp item.tag.explorer_atlas.has_compass run data modify storage explorer_atlas:temp item.tag.display.Lore insert 3 value '[" ",{"translate":"item.explorer_atlas.depth_meter","fallback":"Depth Meter","color":"gray","italic":false}]'
execute unless data storage explorer_atlas:temp item.tag.explorer_atlas.has_clock if data storage explorer_atlas:temp item.tag.explorer_atlas.has_compass run data modify storage explorer_atlas:temp item.tag.display.Lore insert 3 value '[" ",{"translate":"item.explorer_atlas.depth_meter","fallback":"Depth Meter","color":"gray","italic":false}]'
execute unless data storage explorer_atlas:temp item.tag.explorer_atlas.has_clock unless data storage explorer_atlas:temp item.tag.explorer_atlas.has_compass run data modify storage explorer_atlas:temp item.tag.display.Lore insert 2 value '[" ",{"translate":"item.explorer_atlas.depth_meter","fallback":"Depth Meter","color":"gray","italic":false}]'

function explorer_atlas:atlas_editing/update_hand