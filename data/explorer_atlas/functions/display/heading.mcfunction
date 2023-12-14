execute if data storage explorer_atlas:temp string run data modify storage explorer_atlas:temp string append value '{"text":" | ","color":"dark_gray"}'

# get random heading or real heading
execute if predicate explorer_atlas:display_random run scoreboard players operation $heading explorer_atlas.temp = #random.heading explorer_atlas.temp
execute unless predicate explorer_atlas:display_random store result score $heading explorer_atlas.temp run data get entity @s Rotation[0]

# add 180 to the heading, so 0 = north & it goes up to 360
scoreboard players operation $heading explorer_atlas.temp += #180 explorer_atlas.temp

# figure out the cardinal direction and generate the string
execute if score $heading explorer_atlas.temp matches ..22 run data modify storage explorer_atlas:temp string append value '["",{"translate":"explorer_atlas.hud.heading","fallback":"Heading: ","color":"gold"},{"score":{"name":"$heading","objective":"explorer_atlas.temp"}},"° (N)"]'
execute if score $heading explorer_atlas.temp matches 23..67 run data modify storage explorer_atlas:temp string append value '["",{"translate":"explorer_atlas.hud.heading","fallback":"Heading: ","color":"gold"},{"score":{"name":"$heading","objective":"explorer_atlas.temp"}},"° (NE)"]'
execute if score $heading explorer_atlas.temp matches 68..112 run data modify storage explorer_atlas:temp string append value '["",{"translate":"explorer_atlas.hud.heading","fallback":"Heading: ","color":"gold"},{"score":{"name":"$heading","objective":"explorer_atlas.temp"}},"° (E)"]'
execute if score $heading explorer_atlas.temp matches 113..157 run data modify storage explorer_atlas:temp string append value '["",{"translate":"explorer_atlas.hud.heading","fallback":"Heading: ","color":"gold"},{"score":{"name":"$heading","objective":"explorer_atlas.temp"}},"° (SE)"]'
execute if score $heading explorer_atlas.temp matches 158..202 run data modify storage explorer_atlas:temp string append value '["",{"translate":"explorer_atlas.hud.heading","fallback":"Heading: ","color":"gold"},{"score":{"name":"$heading","objective":"explorer_atlas.temp"}},"° (S)"]'
execute if score $heading explorer_atlas.temp matches 203..247 run data modify storage explorer_atlas:temp string append value '["",{"translate":"explorer_atlas.hud.heading","fallback":"Heading: ","color":"gold"},{"score":{"name":"$heading","objective":"explorer_atlas.temp"}},"° (SW)"]'
execute if score $heading explorer_atlas.temp matches 248..292 run data modify storage explorer_atlas:temp string append value '["",{"translate":"explorer_atlas.hud.heading","fallback":"Heading: ","color":"gold"},{"score":{"name":"$heading","objective":"explorer_atlas.temp"}},"° (W)"]'
execute if score $heading explorer_atlas.temp matches 293..337 run data modify storage explorer_atlas:temp string append value '["",{"translate":"explorer_atlas.hud.heading","fallback":"Heading: ","color":"gold"},{"score":{"name":"$heading","objective":"explorer_atlas.temp"}},"° (NW)"]'
execute if score $heading explorer_atlas.temp matches 338.. run data modify storage explorer_atlas:temp string append value '["",{"translate":"explorer_atlas.hud.heading","fallback":"Heading: ","color":"gold"},{"score":{"name":"$heading","objective":"explorer_atlas.temp"}},"° (N)"]'
# (0) N  22
# 23  NE 67
# 68  E  112
# 113 SE 157
# 158 S  202
# 203 SW 247
# 248 W  292
# 293 NW 337
# 338 N  (360)
