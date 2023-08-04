execute if data storage explorer_atlas:temp string run data modify storage explorer_atlas:temp string append value '{"text":" | ","color":"dark_gray"}'
data modify storage explorer_atlas:temp string append value '{"translate":"explorer_atlas.hud.heading","fallback":"Heading: ","color":"gold"}'

execute store result score $heading explorer_atlas.temp run data get entity @s Rotation[0]
# add 180 to the heading, so 0 = north & it goes up to 360
scoreboard players operation $heading explorer_atlas.temp += #180 explorer_atlas.temp
data modify storage explorer_atlas:temp string append value '[{"score":{"name":"$heading","objective":"explorer_atlas.temp"}},"°"]'
