# arguments: {map_x, map_z, map_dimension}
# expects the atlas containing maps to be in explorer_atlas:temp atlas
# returns the map item in explorer_atlas:temp found_map
# returns 1 always (so execute store result always gets 0 on error)

data remove storage explorer_atlas:temp found_map
$data modify storage explorer_atlas:temp found_map set from storage explorer_atlas:temp atlas.tag.explorer_atlas.maps[{tag:{explorer_atlas:{map_x:$(map_x),map_z:$(map_z),map_dimension:"$(map_dimension)"}}}]

return 1