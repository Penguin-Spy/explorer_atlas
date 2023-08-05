# random heading
execute store result score $random.heading explorer_atlas.temp run random value -180..179

# random elevation
execute store result score $random.elevation explorer_atlas.temp run random value -999..-900

# generate a random time for display in the nether
execute store result score $random.hour explorer_atlas.temp run random value 0..23
execute store result score $random.minute explorer_atlas.temp run random value 0..59
execute if score $random.hour explorer_atlas.temp matches ..9 if score $random.minute explorer_atlas.temp matches ..9 run data modify storage explorer_atlas:temp random_time set value '["",{"translate":"explorer_atlas.hud.time","fallback":"Time: ","color":"gold"},"0",{"score":{"name":"$random.hour","objective":"explorer_atlas.temp"}},":0",{"score":{"name":"$random.minute","objective":"explorer_atlas.temp"}}]'
execute if score $random.hour explorer_atlas.temp matches ..9 if score $random.minute explorer_atlas.temp matches 10.. run data modify storage explorer_atlas:temp random_time set value '["",{"translate":"explorer_atlas.hud.time","fallback":"Time: ","color":"gold"},"0",{"score":{"name":"$random.hour","objective":"explorer_atlas.temp"}},":",{"score":{"name":"$random.minute","objective":"explorer_atlas.temp"}}]'
execute if score $random.hour explorer_atlas.temp matches 10.. if score $random.minute explorer_atlas.temp matches ..9 run data modify storage explorer_atlas:temp random_time set value '["",{"translate":"explorer_atlas.hud.time","fallback":"Time: ","color":"gold"},{"score":{"name":"$random.hour","objective":"explorer_atlas.temp"}},":0",{"score":{"name":"$random.minute","objective":"explorer_atlas.temp"}}]'
execute if score $random.hour explorer_atlas.temp matches 10.. if score $random.minute explorer_atlas.temp matches 10.. run data modify storage explorer_atlas:temp random_time set value '["",{"translate":"explorer_atlas.hud.time","fallback":"Time: ","color":"gold"},{"score":{"name":"$random.hour","objective":"explorer_atlas.temp"}},":",{"score":{"name":"$random.minute","objective":"explorer_atlas.temp"}}]'

schedule function explorer_atlas:update_random 5t