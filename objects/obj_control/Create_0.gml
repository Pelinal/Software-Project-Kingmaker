/// @description Init

global.pause = false

// Army Quality
army_quality = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]

// Budget
mil_budget = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]
//adm_budget = [1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1]

province_overview_id = -1
province_popup_id = -1
zoom = 0
player_tag = "ORL"

date = ["January", 1648]
season = 3
turn_no = 1
turn_stage = "Player"
diplo_moves = 3
court_actions = 1
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

intrigue_open = false

// for moving armies
selected_army = noone

threat_level = 0 // 10 - Trivial, 25 - Low, 35 - Medium, 50 - High, 70+ Severe, 100 - Paranoid
threat_level_name = "None"

// for selecting provinces
prov_select = false
cede_to = "" // Tag of who to give prov to
prov_selected = -1
prov_select_purpose = "" // either ArmyBuild, GrantProv, TakeProv, CedeProv

// for building
build_select = false

/// For economy
tax_income = 0
pro_income = 0
man_income = 0
bld_expense = 0
arm_expense = 0
pre_profit  = 0

// for diplomacy
diplo_scroll = 0
diplo_count = 0

depth = -100

tag_init()
economy_init()
map_init()
char_init()
military_init()
economy_update(player_tag)
