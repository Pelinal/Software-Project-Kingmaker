/// @description Update + React
// Update Values
//units = global.army[army_id][3]
//owner = global.army[army_id][2]
//general = global.army[army_id][1]
//total_mp = 0
//for (i = 0; i < array_length(units); i ++) {
//	total_mp += units[i][1] 
//}

quality = obj_control.army_quality[tag_id]

if army_id < array_length(global.army[tag_id]) {
	total_mp = global.army[tag_id][army_id]
} else {
	total_mp = 0	
}

if total_mp <= 0 {
	array_delete(global.army[tag_id], army_id, 1)
	instance_destroy()
}


if location >= 0 {
	x = global.provinces[location][7]
	y = global.provinces[location][8]
}

if tag_id = tag_fetch_id(obj_control.player_tag) {
	if obj_control.selected_army == id {
		image_index = 1
	} else {
		image_index = 0
	}
} else {
	if tag_is_enemy(obj_control.player_tag, global.tags[tag_id][0]) {
		image_index = 2
	} else if tag_is_ally(obj_control.player_tag, global.tags[tag_id][0]) {
		image_index = 3
	}
}

if tag_id == tag_fetch_id(obj_control.player_tag) || tag_is_ally(obj_control.player_tag, global.tags[tag_id][0]) || tag_is_enemy(obj_control.player_tag, global.tags[tag_id][0]) {
	// If the unit should be visible
	visible = true
} else {
	visible = false
	
	
}

if position_meeting(device_mouse_x(0), device_mouse_y(0), id) && image_alpha > 0 {
	//obj_control.province_popup_id = -1
	if mouse_check_button_pressed(mb_left) {
		with obj_non_gui_button {
			if type == "ArmyMerge" || type == "ArmySplit" || type == "ArmyBuild" || type == "ArmyClose" {
				instance_destroy(self)	
			}
		}
		if tag_id == tag_fetch_id(obj_control.player_tag) {
			obj_control.army_overview_id = army_id
			obj_control.selected_army = id
			
			with instance_create_depth(x - 36, y - 37, -103, obj_non_gui_button) {
				type = "ArmyMerge"
				start_x = x
				start_y = y
				sprite_index = spr_quick_buttons
				image_index = 0
				image_speed = 0
			}
			with instance_create_depth(x -20, y - 37, -103, obj_non_gui_button) {
				type = "ArmySplit"
				start_x = x
				start_y = y
				sprite_index = spr_quick_buttons
				image_index = 1
				image_speed = 0
			}
			with instance_create_depth(x - 4, y - 37, -103, obj_non_gui_button) {
				type = "ArmyBuild"
				start_x = x
				start_y = y
				sprite_index = spr_quick_buttons
				image_index = 2
				image_speed = 0
			}
			with instance_create_depth(x + 12, y - 37, -103, obj_non_gui_button) {
				type = "ArmyClose"
				start_x = x
				start_y = y
				sprite_index = spr_quick_buttons
				image_index = 3
				image_speed = 0
			}
			
			//with instance_create_depth(1814, 334, -103, obj_button) {
			//	type = "CloseArmy"
			//	sprite_index = spr_square_button
			//}
			//y_margin = 424
			//for (i = 0; i < array_length(units); i++) {
			//	with instance_create_depth(1404, y_margin, -103, obj_button) {
			//		sprite_index = spr_army_list
			//		type = "ArmyList"
			//		army_id = obj_control.army_overview_id
			//		unit_id = global.army[army_id][3][obj_army.i][0]
			//	}
				
			//	y_margin += 64
			//}
		}
	}
}

// Check for AI initiated battles
///check_for_adjacent_enemy(id)

//////// BATTLE
//var colliding_army = instance_place(x, y, obj_army)
//if tag_is_enemy(global.tags[colliding_army.tag_id][0], global.tags[tag_id][0]) {
//	if colliding_army.location == location {
//		// Fight!!!
//		if total_mp > colliding_army.total_mp {
//			// If youre stronger
//			global.army[tag_id][army_id] -= 
//		} else {
//			// If youre weaker
//		}
//	}
//}


