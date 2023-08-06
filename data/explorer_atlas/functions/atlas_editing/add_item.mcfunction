item modify entity @s weapon.offhand explorer_atlas:remove_1
playsound minecraft:item.armor.equip_leather player @s

# load atlas from players hand
data modify storage explorer_atlas:temp atlas set from entity @s SelectedItem

# create lore "Items: " entry if it doesn't exist
execute unless data storage explorer_atlas:temp atlas.tag.display.Lore[1] run data modify storage explorer_atlas:temp atlas.tag.display.Lore insert 1 value '{"translate":"item.explorer_atlas.atlas_description.items","fallback":"Items: ","color":"gray","italic":false}'