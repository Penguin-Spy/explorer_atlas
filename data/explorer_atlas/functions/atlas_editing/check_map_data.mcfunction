#return values:
# 0: success (scales match)
# 1: scales don't match
# 2: missing data
# 3: is an atlas itself

# make sure the filled_map isn't actually an atlas
execute if data storage explorer_atlas:temp offhand_map.tag.explorer_atlas.is_atlas run return 3

# make sure the map does have a scale (return 2, missing data)
execute unless data storage explorer_atlas:temp offhand_map.tag.explorer_atlas.map_scale run return 2
# make sure the map does have map_x (return 2, missing data)
execute unless data storage explorer_atlas:temp offhand_map.tag.explorer_atlas.map_x run return 2
# make sure the map does have map_z (return 2, missing data)
execute unless data storage explorer_atlas:temp offhand_map.tag.explorer_atlas.map_z run return 2
# make sure the map does have map_dimension (return 2, missing data)
execute unless data storage explorer_atlas:temp offhand_map.tag.explorer_atlas.map_dimension run return 2

# if this atlas doesn't have a scale yet it's fine to add this map, return 0 (fail, which means they're the same)
execute unless data storage explorer_atlas:temp atlas.tag.explorer_atlas.map_scale run return 0

# otherwise, compare the scales (1 means success which means the scales are different)
data modify storage explorer_atlas:temp temp set from storage explorer_atlas:temp atlas.tag.explorer_atlas.map_scale
return run data modify storage explorer_atlas:temp temp set from storage explorer_atlas:temp offhand_map.tag.explorer_atlas.map_scale