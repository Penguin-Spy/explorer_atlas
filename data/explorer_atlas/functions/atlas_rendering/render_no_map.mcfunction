# replace held item with the book
data remove storage explorer_atlas:temp atlas.tag.map
data remove storage explorer_atlas:temp atlas.tag.display.MapColor
data modify storage explorer_atlas:temp atlas.tag.display.Name set value '{"translate":"item.explorer_atlas.atlas","fallback":"Explorer Atlas","italic":false}'
