# calculate current time values
function explorer_atlas:build_time_string

# update all players
execute as @a at @s run function explorer_atlas:update_player

schedule function explorer_atlas:update 2t