# replace held item with map
# specifically only copy id ("filled_map"), map #, and display Name
data modify storage explorer_atlas:temp atlas.id set from storage explorer_atlas:temp found_map.id
data modify storage explorer_atlas:temp atlas.tag.map set from storage explorer_atlas:temp found_map.tag.map
data modify storage explorer_atlas:temp atlas.tag.display.MapColor set value 7492890

# if there's a display Name, copy it (via the sign to properly parse the nbt JSON text component)
execute if data storage explorer_atlas:temp found_map.tag.display.Name run execute in minecraft:overworld run data modify block -30000000 1 2435 front_text.messages[0] set value '[{"text":"","italic":false},{"nbt":"found_map.tag.display.Name","storage":"explorer_atlas:temp","interpret":true,"italic":true}," - ",{"translate":"item.explorer_atlas.atlas","fallback":"Explorer Atlas"}]'
execute if data storage explorer_atlas:temp found_map.tag.display.Name run execute in minecraft:overworld run data modify storage explorer_atlas:temp atlas.tag.display.Name set from block -30000000 1 2435 front_text.messages[0]

# otherwise, just use the default name
execute unless data storage explorer_atlas:temp found_map.tag.display.Name run data modify storage explorer_atlas:temp atlas.tag.display.Name set value '{"translate":"item.explorer_atlas.atlas","fallback":"Explorer Atlas","italic":false}'
