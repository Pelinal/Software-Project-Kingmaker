/// @description Update + React
// Update Values
//units = global.army[army_id][3]
//owner = global.army[army_id][2]
//general = global.army[army_id][1]
//total_mp = 0
//for (i = 0; i < array_length(units); i ++) {
//	total_mp += units[i][1] 
//}

if position_meeting(device_mouse_x(0), device_mouse_y(0), id) {
	//obj_control.province_popup_id = -1
	if mouse_check_button_pressed(mb_left) {
		if tag_id == tag_fetch_id(obj_control.player_tag) {
			obj_control.army_overview_id = army_id
			obj_control.selected_army = id
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
