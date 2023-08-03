# load item into players hand
data remove block -30000000 0 2435 Items
data modify block -30000000 0 2435 Items append from storage explorer_atlas:temp item
item replace entity @s weapon.mainhand from block -30000000 0 2435 container.0