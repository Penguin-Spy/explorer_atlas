advancement revoke @s only explorer_atlas:on_use_atlas


execute if predicate explorer_atlas:offhand_clock unless data entity @s SelectedItem.tag.explorer_atlas.has_clock run function explorer_atlas:atlas_editing/add_clock
execute if predicate explorer_atlas:offhand_compass unless data entity @s SelectedItem.tag.explorer_atlas.has_compass run function explorer_atlas:atlas_editing/add_compass
execute if predicate explorer_atlas:offhand_depth_meter unless data entity @s SelectedItem.tag.explorer_atlas.has_depth_meter run function explorer_atlas:atlas_editing/add_depth_meter