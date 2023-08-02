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
scoreboard players set _180 explorer_atlas.temp 180
# time constants
scoreboard players set _5 explorer_atlas.temp 5
scoreboard players set _18 explorer_atlas.temp 18
scoreboard players set _60 explorer_atlas.temp 60
scoreboard players set _24 explorer_atlas.temp 24

#scoreboard player set $cfg.depth_offset explorer_atlas.temp ???

schedule clear explorer_atlas:tick
function explorer_atlas:tick