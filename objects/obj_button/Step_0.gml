/// @description Mouse Check
if position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id) {
	// Check for Mouse Enter
	if type != "Dropdown" {	
		image_index = 1
	} else {
		if dropdown_type == "Relations" && !obj_control.dropdowns[0] {
			image_index = 1
		} else if dropdown_type == "Relations" && obj_control.dropdowns[0] {
			image_index = 3
		} else if dropdown_type == "Intrigue" && !obj_control.dropdowns[1] {
			image_index = 1
		} else if dropdown_type == "Intrigue" && obj_control.dropdowns[1] {
			image_index = 3
		} else if dropdown_type == "Economic" && !obj_control.dropdowns[2] {
			image_index = 1
		} else if dropdown_type == "Economic" && obj_control.dropdowns[2] {
			image_index = 3
		} else if dropdown_type == "Liege" && !obj_control.dropdowns[3] {
			image_index = 1
		} else if dropdown_type == "Liege" && obj_control.dropdowns[3] {
			image_index = 3
		}
	}
	
	if mouse_check_button_pressed(mb_left){
		// Check for Left Pressed
			instance_destroy(obj_prevent_clickthrough)
			if type == "Liege" {
				// open the kings court
				menu_pop("Liege")
			} else if type == "Military" {
				// open the military tab
				menu_pop("Military")
			} else if type == "Economy" {
				// open the economy tab
				menu_pop("Economy")
			} else if type == "Diplomacy" {
				// open the diplomacy tab
				menu_pop("Diplomacy")
			} else if type == "Profile" {
				// open the profile
				obj_control.tag_overview_id = tag_id
				menu_pop("Profile")
			} else if type == "LangSetting" {
				if obj_control.lang_setting == 1 {
					obj_control.lang_setting = 3
				} else {
					obj_control.lang_setting = 1
				}
			} else if type == "CloseArmy" {
				obj_control.army_overview_id = -1
				with obj_button {
					if type == "ArmyList" {
						instance_destroy(self)
					}
				}
				instance_destroy(self)
			} else if type == "Form Alliance" && obj_control.diplo_moves > 0 {
				obj_control.diplo_moves -= 1
				if tag_opinion_of(obj_control.tag_overview_id, obj_control.player_tag) >= 25 && !tag_is_ally(obj_control.tag_overview_id, obj_control.player_tag) {
					tag_add_opinion(obj_control.tag_overview_id, obj_control.player_tag, 50)
					tag_add_opinion(obj_control.player_tag, obj_control.tag_overview_id, 50)
					tag_add_ally(obj_control.tag_overview_id, obj_control.player_tag)
				}
			} else if type == "Arrange Marriage" && obj_control.diplo_moves > 0 {
				obj_control.diplo_moves -= 1
				if tag_opinion_of(obj_control.tag_overview_id, obj_control.player_tag) >= 0 {
					tag_add_opinion(obj_control.tag_overview_id, obj_control.player_tag, 25)
					tag_add_opinion(obj_control.player_tag, obj_control.tag_overview_id, 25)
					global.economy[tag_fetch_id(obj_control.player_tag)][8] += 10
					global.economy[tag_fetch_id(obj_control.tag_overview_id)][8] += 10
				}
			} else if type == "Fabricate Claim" && obj_control.player_fabricating < 1 && obj_control.diplo_moves > 0 && !tag_has_claim(obj_control.player_tag, obj_control.tag_overview_id) {
				obj_control.diplo_moves -= 1
				if tag_opinion_of(obj_control.tag_overview_id, obj_control.player_tag) >= 0 {
					tag_add_opinion(obj_control.tag_overview_id, obj_control.player_tag, -10)
					global.economy[tag_fetch_id(obj_control.player_tag)][8] -= 10
					obj_control.player_fabricating = 1
					obj_control.player_fabricate_target = obj_control.tag_overview_id
				}
			} else if type == "Declare War" && tag_has_claim(obj_control.player_tag, obj_control.tag_overview_id) && !tag_is_enemy(obj_control.player_tag, obj_control.tag_overview_id) {
				tag_add_opinion(obj_control.tag_overview_id, obj_control.player_tag, -50)
				tag_declare_war(obj_control.player_tag, obj_control.tag_overview_id)
			} else if type == "Declare War" && tag_is_enemy(obj_control.player_tag, obj_control.tag_overview_id) {
				tag_declare_peace(obj_control.player_tag, obj_control.tag_overview_id)
				with obj_province {
					if prov_occupied_by == obj_control.player_tag {
						map_province_own(prov_id, obj_control.player_tag)
						tag = obj_control.player_tag
						prov_occupied_by = noone
					}
				}
			} else if type == "End Turn" {
				obj_control.turn_stage = "AI"
			}
			
			if type == "Dropdown" {
				switch dropdown_type {
					case "Relations":
						obj_control.dropdowns[0] = !obj_control.dropdowns[0]
						break
					case "Intrigue":
						obj_control.dropdowns[1] = !obj_control.dropdowns[0]
						break
					case "Economic":
						obj_control.dropdowns[2] = !obj_control.dropdowns[2]
						break
				}
			}
			
			if obj_control.lock_ui == false {
				if type == "Build Units" {
					
				} else if type == "ProfileSmall" {
					obj_control.tag_overview_id = tag_id
					obj_control.lock_ui = true
					obj_control.main_tab = "Profile"
					
					if obj_control.tag_overview_id != obj_control.player_tag {
						// Create Diplo Dropdowns
						obj_control.dropdowns = [false, false, false, false]
						if obj_control.tag_overview_id == "FRA" {
							with instance_create_depth(24, 680, -1003, obj_button) {
								type = "Improve Relations"
								diplo_action = true
								opinion_req = 0
								sprite_index = spr_rectlarge_button
							}
							with instance_create_depth(24, 744, -1003, obj_button) {
								type = "Arrange Marriage"
								diplo_action = true
								opinion_req = 75
								sprite_index = spr_rectlarge_button
							}
							
							
							with instance_create_depth(350, 680, -103, obj_button) {
								type = "Declare War"
								diplo_action = true
								opinion_req = 0
								sprite_index = spr_rectlarge_button
							}
							with instance_create_depth(350, 744, -103, obj_button) {
								type = "Fabricate Claim"
								diplo_action = true
								opinion_req = 0
								sprite_index = spr_rectlarge_button
							}
							with instance_create_depth(350, 808, -103, obj_button) {
								type = "Sabotage Armies"
								diplo_action = true
								opinion_req = 0
								sprite_index = spr_rectlarge_button
							}
						} else if obj_control.tag_overview_id == "SPA" || obj_control.tag_overview_id == "PAP" {
							with instance_create_depth(24, 680, -1003, obj_button) {
								type = "Improve Relations"
								diplo_action = true
								opinion_req = 0
								sprite_index = spr_rectlarge_button
							}
							with instance_create_depth(24, 744, -1003, obj_button) {
								type = "Arrange Marriage"
								diplo_action = true
								opinion_req = 50
								sprite_index = spr_rectlarge_button
							}
						} else {
							with instance_create_depth(24, 680, -1003, obj_button) {
								type = "Form Alliance"
								diplo_action = true
								opinion_req = 50
								sprite_index = spr_rectlarge_button
							}
							with instance_create_depth(24, 744, -1003, obj_button) {
								type = "Improve Relations"
								diplo_action = true
								opinion_req = 0
								sprite_index = spr_rectlarge_button
							}
							with instance_create_depth(24, 808, -1003, obj_button) {
								type = "Arrange Marriage"
								diplo_action = true
								opinion_req = 25
								sprite_index = spr_rectlarge_button
							}
							
							
							with instance_create_depth(350, 680, -103, obj_button) {
								type = "Declare War"
								diplo_action = true
								opinion_req = 0
								sprite_index = spr_rectlarge_button
							}
							with instance_create_depth(350, 744, -103, obj_button) {
								type = "Fabricate Claim"
								diplo_action = true
								opinion_req = 0
								sprite_index = spr_rectlarge_button
							}
							with instance_create_depth(350, 808, -103, obj_button) {
								type = "Sabotage Armies"
								diplo_action = true
								opinion_req = 0
								sprite_index = spr_rectlarge_button
							}
						}
					}
					
					instance_destroy(self)
				}
			}
	}
} else {
	if type != "Dropdown" {	
		image_index = 0
	} else {
		if dropdown_type == "Relations" && !obj_control.dropdowns[0] {
			image_index = 0
		} else if dropdown_type == "Relations" && obj_control.dropdowns[0] {
			image_index = 2
		} else if dropdown_type == "Intrigue" && !obj_control.dropdowns[1] {
			image_index = 0
		} else if dropdown_type == "Intrigue" && obj_control.dropdowns[1] {
			image_index = 2
		} else if dropdown_type == "Economic" && !obj_control.dropdowns[2] {
			image_index = 0
		} else if dropdown_type == "Economic" && obj_control.dropdowns[2] {
			image_index = 2
		} else if dropdown_type == "Liege" && !obj_control.dropdowns[3] {
			image_index = 0
		} else if dropdown_type == "Liege" && obj_control.dropdowns[3] {
			image_index = 2
		}
	}
}

if type == "Liege" {
	ico_index = 2
} else if type == "Military" {
	ico_index = 3
} else if type == "Economy" {
	ico_index = 4
} else if type == "Diplomacy" {
	ico_index = 5
} else if type == "Profile" {
	tag_id = "ORL"
} else if type == "CloseArmy" {
	ico_index = 7
}
if obj_control.tag_overview_id == -1 {
	if type == "Dropdown" {
		instance_destroy(self)
		obj_control.dropdowns = [false, false, false, false]
	}
	
	if diplo_action {
		instance_destroy(self)
	}
}


