/// @description Mouse Controls

tag = global.provinces[prov_id][6]

global.provinces[prov_id][7] = x
global.provinces[prov_id][8] = y
global.provinces[prov_id][9] = id

var colliding_unit = instance_place(x, y, obj_army)
if colliding_unit != noone {
	if colliding_unit.location == prov_id {
		unit_in_prov = colliding_unit
	}
} else {
	unit_in_prov = noone
}

if unit_in_prov != noone && instance_exists(unit_in_prov) {
	if tag_is_enemy(global.tags[unit_in_prov.tag_id][0], map_province_owner(prov_id)) {
		prov_occupied_by = global.tags[unit_in_prov.tag_id][0]
	}
	if prov_occupied_by != noone && tag_is_ally(tag, map_province_owner(prov_id)) {
		// Allies reoccupy your land for you?
		prov_occupied_by = noone
	}
	if prov_occupied_by != noone && tag == global.tags[unit_in_prov.tag_id][0] {
		prov_occupied_by = noone
	}
}

if !instance_exists(unit_in_prov) {
	unit_in_prov = noone
}

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
		//if !!position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), obj_button) {
		//	obj_control.selected_army = noone
		//	obj_control.army_overview_id = -1
		//}
		/// @description Show Panel
		if !position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), obj_button) &&
		   !position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), obj_prevent_clickthrough) && 
		   !obj_control.lock_ui && !position_meeting(mouse_x, mouse_y, obj_army) { 
			instance_destroy(obj_prevent_clickthrough)
			obj_control.province_overview_id = prov_id
			obj_control.prov_select = false
			obj_control.build_select = false
			with obj_button {
				if type == "BuildingSlot" || type == "BuildSelect" || type == "ProfileSmall" || type == "Dropdown" || diplo_action || court_action {
					instance_destroy(self)
				}
			}
			
			if map_province_owner(prov_id) == obj_control.player_tag {
				var new_button = instance_create_depth(336, 840, -103, obj_button)
				new_button.sprite_index = spr_building_slot
				new_button.build_prov = prov_id
				new_button.build_slot = 0
				new_button.type = "BuildingSlot"
				
				var new_button = instance_create_depth(432, 840, -103, obj_button)
				new_button.sprite_index = spr_building_slot
				new_button.build_prov = prov_id
				new_button.build_slot = 1
				new_button.type = "BuildingSlot"
				
				var new_button = instance_create_depth(336, 936, -103, obj_button)
				new_button.sprite_index = spr_building_slot
				new_button.build_prov = prov_id
				new_button.build_slot = 2
				new_button.type = "BuildingSlot"
				
				var new_button = instance_create_depth(432, 936, -103, obj_button)
				new_button.sprite_index = spr_building_slot
				new_button.build_prov = prov_id
				new_button.build_slot = 3
				new_button.type = "BuildingSlot"
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
				global.provinces[prov_id][6] = obj_control.player_tag
			}
		}
	} else if mouse_check_button_pressed(mb_right) && obj_control.army_overview_id != -1 {
		if unit_in_prov == noone {
			if obj_control.selected_army != noone && map_province_is_adjacent(prov_id, obj_control.selected_army.location) 
			&& (map_province_owner(prov_id) == obj_control.player_tag || tag_is_ally(obj_control.player_tag, map_province_owner(prov_id)) || tag_is_enemy(obj_control.player_tag, map_province_owner(prov_id))) {
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
					obj_control.army_overview_id = -1
				}
			}
		} else {
			if unit_in_prov != noone {
				if obj_control.selected_army.moves_remaining > 0 {
					if tag_is_enemy(global.tags[unit_in_prov.tag_id][0], obj_control.player_tag) {
						if unit_in_prov.total_mp > obj_control.selected_army.total_mp {
							// If your army is weaker than the enemy
							global.army[obj_control.selected_army.tag_id][obj_control.selected_army.army_id] -= global.army[unit_in_prov.tag_id][unit_in_prov.army_id] - global.army[obj_control.selected_army.tag_id][obj_control.selected_army.army_id] 
							global.army[unit_in_prov.tag_id][unit_in_prov.army_id] -= ((global.army[unit_in_prov.tag_id][unit_in_prov.army_id] - global.army[obj_control.selected_army.tag_id][obj_control.selected_army.army_id]) / 2) * (1 + (obj_control.army_quality[obj_control.selected_army.tag_id]/10))
						} else {
							// If your army is stronger than theirs
							global.army[obj_control.selected_army.tag_id][obj_control.selected_army.army_id] -= (global.army[obj_control.selected_army.tag_id][obj_control.selected_army.army_id] - global.army[unit_in_prov.tag_id][unit_in_prov.army_id]) / 2
							global.army[unit_in_prov.tag_id][unit_in_prov.army_id] -= (global.army[obj_control.selected_army.tag_id][obj_control.selected_army.army_id] - global.army[unit_in_prov.tag_id][unit_in_prov.army_id]) * (1 + (obj_control.army_quality[obj_control.selected_army.tag_id]/10))
						}
					
						obj_control.selected_army.moves_remaining = 0
					}
				}
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
