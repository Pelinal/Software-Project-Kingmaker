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
	} else if menu_type == "Diplomacy" {
		obj_control.diplo_scroll = 0
		obj_control.diplo_count = 0
		var y_offset = 0
		for (var i = 0; i < array_length(global.tags); i ++) {
			if i != tag_fetch_id(obj_control.player_tag) && tag_total_development(global.tags[i][0]) > 0 {
				with instance_create_depth(22, 300 + y_offset, -1003, obj_button) {
					type = "TagListButton"
					tag_id = i
					sprite_index = spr_rectlong_button
				}
			
				y_offset += 64
				obj_control.diplo_count ++ 
			}
		}
		// 12, 13
		with instance_create_depth(616, 960, -1003, obj_button) {
			sprite_index = spr_square_button
			type = "TagListUP"
			ico_index = 12 // UP button
		}
		
		with instance_create_depth(548, 960, -1003, obj_button) {
			sprite_index = spr_square_button
			type = "TagListDN"
			ico_index = 13 // Down button
		}
	} else if menu_type == "Economy" {
		with instance_create_depth(22, 862, -1003, obj_button) {
			sprite_index = spr_square_button
			type = "MilBudgetDN"
			ico_index = 14
		}
		with instance_create_depth(22 + 72, 862, -1003, obj_button) {
			sprite_index = spr_square_button
			type = "MilBudgetNO"
			ico_index = 15
		}
		with instance_create_depth(22 + 144, 862, -1003, obj_button) {
			sprite_index = spr_square_button
			type = "MilBudgetUP"
			ico_index = 16
		}
	}
}