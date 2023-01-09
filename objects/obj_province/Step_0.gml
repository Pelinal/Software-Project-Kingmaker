/// @description Mouse Controls

tag = global.provinces[prov_id][6]

if prov_occupied_by == noone {
	image_colour = tag_fetch_colour(global.provinces[prov_id][6])
} else {
	image_colour = tag_fetch_colour(prov_occupied_by) - make_color_rgb(20, 20, 20)
}

if position_meeting(mouse_x, mouse_y, id) {
	/// @description Show
	if !position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), obj_button) && !position_meeting(mouse_x, mouse_y, obj_army) {
		if prov_occupied_by == noone {
			image_colour = tag_fetch_colour(global.provinces[prov_id][6]) + make_colour_rgb(20, 20, 20)
		} else {
			image_colour = tag_fetch_colour(prov_occupied_by) - make_color_rgb(10, 10, 10)
		}
		obj_control.province_popup_id = prov_id
	}

	if mouse_check_button_pressed(mb_left) {
		/// @description Show Panel
		if !position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), obj_button) &&
		   !position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), obj_prevent_clickthrough) &&
		   !obj_control.lock_ui && !position_meeting(mouse_x, mouse_y, obj_army) { 
			instance_destroy(obj_prevent_clickthrough)
			obj_control.province_overview_id = prov_id
			with obj_button {
				if type == "Build Units" || type == "Construct Slot" || type == "ProfileSmall" || type == "Dropdown" || diplo_action {
					instance_destroy(self)
				}
			}
			if map_province_owner(prov_id) == obj_control.player_tag {
				with instance_create_depth(320, 824, -103, obj_button) {
					sprite_index = spr_tall_button
					image_index = 0
					type = "Build Units"
				}
			}
	
			with instance_create_depth(732, 828, -103, obj_button) {
				sprite_index = spr_button_179
				image_index = 0
				image_xscale = 0.715083799
				image_yscale = 0.715083799
				type = "ProfileSmall"
				tag_id = map_province_owner(obj_control.province_popup_id)
			}
	
			//with instance_create_depth(732, 828, -103, obj_button) {
			//	sprite_index = spr_button_179
			//	image_index = 0
			//	image_xscale = 0.715083799
			//	image_yscale = 0.715083799
			//	type = "ProfileSmall"
			//	tag_id = map_province_owner(obj_control.province_popup_id)
			//}
	

			if keyboard_check(vk_shift) {
				global.provinces[prov_id][6] = "ORL"
			}
		}
	} else if mouse_check_button_pressed(mb_right) {
		if obj_control.selected_army != noone && map_province_is_adjacent(prov_id, obj_control.selected_army.location) 
		&& (map_province_owner(prov_id) == obj_control.player_tag || tag_is_ally(obj_control.player_tag, map_province_owner(prov_id)) || tag_is_enemy(obj_control.player_tag, map_province_owner(prov_id)) ) {
			if obj_control.selected_army.moves_remaining > 0 {	
				obj_control.selected_army.x = x
				obj_control.selected_army.y = y
				obj_control.selected_army.location = prov_id
				obj_control.selected_army.moves_remaining -= 1
				
				// If Entering Enemy Province
				if tag_is_enemy(obj_control.player_tag, map_province_owner(prov_id)) {
					prov_occupied_by = obj_control.player_tag
				}
				
				obj_control.selected_army = noone
			}
		}
	}
} else {
	/// @description Hide
	if prov_occupied_by == noone {
		image_colour = tag_fetch_colour(global.provinces[prov_id][6])
	} else {
		image_colour = tag_fetch_colour(prov_occupied_by) - make_color_rgb(10, 10, 10)
	}
}