# Copyright © Penguin_Spy 2023
# This Source Code Form is subject to the terms of the Mozilla Public
# License, v. 2.0. If a copy of the MPL was not distributed with this
# file, You can obtain one at https://mozilla.org/MPL/2.0/.

# Display install notice & license thingy on new install/version change
execute unless data storage explorer_atlas:data {last_version: 1.0d} run tellraw @a {"text":"Explorer Atlas (v1.0) is installed!", "color":"green"}
execute unless data storage explorer_atlas:data {last_version: 1.0d} run tellraw @a ["This datapack is licensed under the ",{"text":"Mozilla Public License, v. 2.0","underlined":true,"color":"blue","clickEvent":{"action":"open_url","value":"http://mozilla.org/MPL/2.0/"},"hoverEvent":{"action":"show_text","contents":["http://mozilla.org/MPL/2.0/"]}},"."]
execute unless data storage explorer_atlas:data {last_version: 1.0d} run tellraw @a ["The Source Code Form is available at ",{"text":"Penguin-Spy/explorer_atlas","underlined":true,"color":"blue","clickEvent":{"action":"open_url","value":"https://github.com/Penguin-Spy/explorer_atlas"},"hoverEvent":{"action":"show_text","contents":["https://github.com/Penguin-Spy/explorer_atlas"]}},"."]
execute unless data storage explorer_atlas:data {last_version: 1.0d} run tellraw @a ["Use ",{"text":"/function explorer_atlas:settings","color":"gray","clickEvent":{"action":"run_command","value":"/function explorer_atlas:settings"},"hoverEvent":{"action":"show_text","contents":["Click to run"]}}," to configure the datapack."]
data modify storage explorer_atlas:data last_version set value 1.0d

scoreboard objectives add explorer_atlas.temp dummy
# heading offset
scoreboard players set #180 explorer_atlas.temp 180
# time offset
scoreboard players set #6 explorer_atlas.temp 6
# time calculation constants
scoreboard players set #5 explorer_atlas.temp 5
scoreboard players set #18 explorer_atlas.temp 18
scoreboard players set #60 explorer_atlas.temp 60
scoreboard players set #24 explorer_atlas.temp 24
# map coord calculation constants
scoreboard players set #128 explorer_atlas.temp 128
scoreboard players set #64 explorer_atlas.temp 64

#scoreboard player set $cfg.depth_offset explorer_atlas.temp ???
# used to delay showing the actionbar hud after editing the atlas (so the edit message shows up)
scoreboard objectives add explorer_atlas.hud_delay dummy

# used to detect filling out a map
scoreboard objectives add explorer_atlas.used_map minecraft.used:minecraft.map


# initalize the yellow shulker box & cherry sign (outside world border, y0 to work with any world height)
execute in minecraft:overworld run forceload add -30000000 2435
execute in minecraft:overworld run setblock -30000000 0 2435 yellow_shulker_box
execute in minecraft:overworld run setblock -30000000 1 2435 cherry_sign


# every tick (only for detecting/handling filling out a map item)
schedule clear explorer_atlas:tick
function explorer_atlas:tick

# every 2 ticks (appropriate tradeoff between performance and responsiveness)
schedule clear explorer_atlas:update
function explorer_atlas:update

# every 5 ticks (so the display doesn't update too often and look too chaotic)
schedule clear explorer_atlas:update_random
function explorer_atlas:update_random