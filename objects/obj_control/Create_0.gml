/// @description Init

global.pause = false

province_overview_id = -1
province_popup_id = -1
zoom = 0
player_tag = "ORL"

date = ["April", 1648]
season = 0
turn_no = 1
turn_stage = "Player"
diplo_moves = 3
player_fabricating = 0
player_fabricate_target = noone

army_overview_id = -1
tag_overview_id = -1
main_tab = -1
lock_ui = false

// used to switch between languages
lang_setting = 1

// for dropdowns
dropdowns[0] = false
dropdowns[1] = false
dropdowns[2] = false
dropdowns[3] = false

// for moving armies
selected_army = noone

depth = -100

tag_init()
economy_init()
map_init()
char_init()
military_init()
economy_update()
