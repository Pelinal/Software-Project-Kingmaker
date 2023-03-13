/// @description Mouse Checks

if position_meeting(mouse_x, mouse_y, id) {
	if mouse_check_button_pressed(mb_left) {
		if type == "ArmyClose" {
			obj_control.army_overview_id = -1
			obj_control.selected_army = noone
		} else if type == "ArmySplit" {
			var new_army
			new_army = global.army[tag_fetch_id(obj_control.player_tag)][obj_control.selected_army.army_id] / 2
			global.army[tag_fetch_id(obj_control.player_tag)][obj_control.selected_army.army_id] -= new_army
			array_push(global.army[tag_fetch_id(obj_control.player_tag)], new_army)
			//show_debug_message(obj_control.selected_army.tag_id)
			with instance_create_depth(obj_control.selected_army.x, obj_control.selected_army.y, obj_control.selected_army.depth, obj_army) {
				tag_id = obj_control.selected_army.tag_id
				army_id = array_length(global.army[tag_fetch_id(obj_control.player_tag)]) - 1
				location = map_province_get_adjacent(obj_control.selected_army.location, obj_control.player_tag)
			}
		} else if type == "ArmyMerge" {
			with obj_control.selected_army {
				var other_army = find_adjacent_armies(obj_control.selected_army.location, obj_control.player_tag)
				if other_army != noone && other_army != obj_control.selected_army { 
					other_army = other_army[0]
					var other_army_id = other_army.army_id
					show_debug_message("Other Army: " + string(other_army.army_id))
					show_debug_message("Selected Army: " + string(obj_control.selected_army.army_id))
					global.army[tag_fetch_id(obj_control.player_tag)][obj_control.selected_army.army_id] += global.army[tag_fetch_id(obj_control.player_tag)][other_army_id]
					show_debug_message("Before Deletion: " + string(global.army[tag_fetch_id(obj_control.player_tag)]))
					array_delete(global.army[tag_fetch_id(obj_control.player_tag)], other_army_id, 1)
					show_debug_message("After Deletion: " + string(global.army[tag_fetch_id(obj_control.player_tag)]))
					
					
					obj_control.selected_army = noone
					obj_control.army_overview_id = -1
					
					refresh_armies()
					
					with obj_non_gui_button {
						if type == "ArmyMerge" || type == "ArmySplit" || type == "ArmyBuild" || type == "ArmyClose" {
							instance_destroy(self)	
						}
					}
					
					
					
					
					
					//show_debug_message(global.army[tag_fetch_id(obj_control.player_tag)])
				}
			}
		} else if type == "ArmyBuild" {
			if global.economy[tag_fetch_id(obj_control.player_tag)][5] >= 1 && global.economy[tag_fetch_id(obj_control.player_tag)][1] >= 100 {
				global.economy[tag_fetch_id(obj_control.player_tag)][5] -= 1
				global.economy[tag_fetch_id(obj_control.player_tag)][1] -= 100
				
				global.army[tag_fetch_id(obj_control.player_tag)][obj_control.selected_army.army_id] += 100
			}
		}
	}
}

if type == "ArmyMerge" || type == "ArmySplit" || type == "ArmyBuild" || type == "ArmyClose" {
	if obj_control.selected_army == noone {	
		instance_destroy(self)	
	}
}