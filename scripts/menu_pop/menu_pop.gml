// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function menu_pop(menu_type) {
	with obj_control {
		lock_ui = true
		main_tab = menu_type
		province_overview_id = -1
	}
	with obj_button {
		if type == "BuildingSlot" || type == "Construct Slot" || type == "ProfileSmall" || type == "Dropdown" || diplo_action || court_action {
			instance_destroy(self)
		}
	}
	
	if menu_type == "Liege" {
		// Concessions:
		with instance_create_depth(19, 680, -1003, obj_button) {
			type = "Demonstrate Fealty (-5)"
			court_action = true
			sprite_index = spr_rectlarge_button
		}
		with instance_create_depth(19, 752, -1003, obj_button) {
			type = "Pay Tribute (-10)"
			court_action = true
			sprite_index = spr_rectlarge_button
		}
		with instance_create_depth(19, 824, -1003, obj_button) {
			type = "Offer Recruits (-15)"
			court_action = true
			sprite_index = spr_rectlarge_button
		}
		with instance_create_depth(19, 896, -1003, obj_button) {
			type = "Grant Province (-25)" 
			court_action = true
			sprite_index = spr_rectlarge_button
		}
		
		// Demands:
		with instance_create_depth(360, 680, -1003, obj_button) {
			type = "Request Title (+1)"
			court_action = true
			opinion_req = 0
			sprite_index = spr_rectlarge_button
		}
		with instance_create_depth(360, 752, -1003, obj_button) {
			type = "Request Funds (+5)"
			court_action = true
			opinion_req = 25
			sprite_index = spr_rectlarge_button
		}
		with instance_create_depth(360, 824, -1003, obj_button) {
			type = "Levy Reserves (+5)"
			court_action = true
			opinion_req = 25
			sprite_index = spr_rectlarge_button
		}
		with instance_create_depth(360, 896, -1003, obj_button) {
			type = "Demand Province (+10)" 
			court_action = true
			opinion_req = 50
			sprite_index = spr_rectlarge_button
		}
	}
}