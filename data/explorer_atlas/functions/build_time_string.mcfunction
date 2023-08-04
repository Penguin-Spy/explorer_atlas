# get current daytime in total minutes since sunrise
execute store result score $time.total explorer_atlas.temp run time query daytime
scoreboard players operation $time.total explorer_atlas.temp /= #5 explorer_atlas.temp
scoreboard players operation $time.total explorer_atlas.temp *= #18 explorer_atlas.temp
scoreboard players operation $time.total explorer_atlas.temp /= #60 explorer_atlas.temp
# save total minutes for later calculating
scoreboard players operation $time.minute explorer_atlas.temp = $time.total explorer_atlas.temp

# calculate hours (total is in minutes, / by 60 to get hours & add 6 to offset bc sunrise is at 0)
scoreboard players operation $time.total explorer_atlas.temp /= #60 explorer_atlas.temp
scoreboard players operation $time.hour explorer_atlas.temp = $time.total explorer_atlas.temp
scoreboard players operation $time.hour explorer_atlas.temp += #6 explorer_atlas.temp

#calculate minutes (total was truncated to hours, convert back to minutes and subtract to get just the minutes)
scoreboard players operation $time.total explorer_atlas.temp *= #60 explorer_atlas.temp
scoreboard players operation $time.minute explorer_atlas.temp -= $time.total explorer_atlas.temp

# clamp hours to be under 24
execute if score $time.hour explorer_atlas.temp matches 24.. run scoreboard players operation $time.hour explorer_atlas.temp -= #24 explorer_atlas.temp

# generate string in storage (4 versions for 4 different combos of leading 0s)
execute if score $time.hour explorer_atlas.temp matches ..9 if score $time.minute explorer_atlas.temp matches ..9 run data modify storage explorer_atlas:temp time set value '["",{"translate":"explorer_atlas.hud.time","fallback":"Time: ","color":"gold"},"0",{"score":{"name":"$time.hour","objective":"explorer_atlas.temp"}},":0",{"score":{"name":"$time.minute","objective":"explorer_atlas.temp"}}]'
execute if score $time.hour explorer_atlas.temp matches ..9 if score $time.minute explorer_atlas.temp matches 10.. run data modify storage explorer_atlas:temp time set value '["",{"translate":"explorer_atlas.hud.time","fallback":"Time: ","color":"gold"},"0",{"score":{"name":"$time.hour","objective":"explorer_atlas.temp"}},":",{"score":{"name":"$time.minute","objective":"explorer_atlas.temp"}}]'
execute if score $time.hour explorer_atlas.temp matches 10.. if score $time.minute explorer_atlas.temp matches ..9 run data modify storage explorer_atlas:temp time set value '["",{"translate":"explorer_atlas.hud.time","fallback":"Time: ","color":"gold"},{"score":{"name":"$time.hour","objective":"explorer_atlas.temp"}},":0",{"score":{"name":"$time.minute","objective":"explorer_atlas.temp"}}]'
execute if score $time.hour explorer_atlas.temp matches 10.. if score $time.minute explorer_atlas.temp matches 10.. run data modify storage explorer_atlas:temp time set value '["",{"translate":"explorer_atlas.hud.time","fallback":"Time: ","color":"gold"},{"score":{"name":"$time.hour","objective":"explorer_atlas.temp"}},":",{"score":{"name":"$time.minute","objective":"explorer_atlas.temp"}}]'
