/// @description Drag to move camera

if mouse_check_button_pressed(mb_middle) {
	drag_x = mouse_x
	drag_y = mouse_y
}

if keyboard_check_pressed(vk_escape) {
	if global.pause {
		global.pause = false
		with obj_button {
			if type == "LangSetting" {
				instance_destroy(self)
			}
		}
	} else {
		global.pause = true
		with instance_create_depth(896, 540, -1003, obj_button) {
			type = "LangSetting"
			sprite_index = spr_square_button
			image_xscale = 2
			image_yscale = 2
			image_speed = 0
			image_index = 0
		}
	}
}


if mouse_check_button(mb_middle) {
	// Drag the camera
	camera_set_view_pos(view_camera, drag_x - (mouse_x - camera_get_view_x(view_camera)), drag_y - (mouse_y - camera_get_view_y(view_camera)))
	// Prevent leaving view
	camera_set_view_pos(view_camera, max(0, min(camera_get_view_x(view_camera), room_width - camera_get_view_width(view_camera))), max(0, min(camera_get_view_y(view_camera), room_height - camera_get_view_height(view_camera))))
}

if mouse_check_button(mb_right) {
	province_overview_id = -1
	tag_overview_id = -1
	main_tab = -1
	lock_ui = false
	prov_select = false
	build_select = false
	with obj_button {
		if type == "BuildingSlot" || type == "ProfileSmall" || diplo_action || court_action {
			instance_destroy(self)
		}
	}
}


if mouse_wheel_up() {
	camera_set_view_size(view_camera, camera_get_view_width(view_camera) - 64, camera_get_view_height(view_camera) - 36)
	zoom += 1
}
if camera_get_view_width(view_camera) < room_width && camera_get_view_height(view_camera) < room_height {
	if mouse_wheel_down() {
		camera_set_view_size(view_camera, camera_get_view_width(view_camera) + 64, camera_get_view_height(view_camera) + 36)
		zoom -= 1
	}
}

if army_overview_id == -1 {
	selected_army = noone
}


if threat_level <= 0 {
	threat_level_name = "None"
} else if threat_level >= 1 && threat_level < 10 {
	threat_level_name = "Trivial"
} else if threat_level >= 10 && threat_level < 25 {
	threat_level_name = "Low"
} else if threat_level >= 25 && threat_level < 35 {
	threat_level_name = "Medium"
} else if threat_level >= 35 && threat_level < 50 {
	threat_level_name = "High"
} else if threat_level >= 50 && threat_level < 70 {
	threat_level_name = "Severe"
} else if threat_level > 70 {
	threat_level_name = "Absolute"
}

// Prov Select
if prov_select {
	if prov_selected != -1 {
		if prov_select_purpose == "GrantProv" {
			global.provinces[prov_selected][6] = "FRA"	
		} else if prov_select_purpose == "TakeProv" {
			global.provinces[prov_selected][6] = player_tag
		} else if prov_select_purpose = "CedeProv" {
			global.provinces[prov_selected][6] = cede_to
			threat_level += 2
		}
		
		prov_selected = -1
		prov_select = false
		cede_to = ""
		//prov_list = []
	}
}

///// AI Turn Manager
if turn_stage == "AI" {
	repeat(1) {
		for (var i = 0; i < array_length(global.tags); i ++) {
			// Goes through every tag and checks what they are capable of doing on their turn
			var tag, tag_id, ruler, armies
			tag_id = i
			tag = global.tags[i][0]
			ruler = global.tags[i][6]
			armies = find_my_armies(tag_id)
			
			// Gimme money says Mr AI
			economy_update(tag)
			
			// Update flags
			flags_update(tag_id)
			
			// Ingores the player, skips to next iteration
			if tag == obj_control.player_tag { continue }
			
			// 1: Do I have an Alliance?
			
			// 2: Do I have a marriage with my allies?
			
			// 3a: Are any un-allied neighbours weaker than me?
			// 3b: Do I have a claim on them?
			// 3c: Are we already at War?
			
			// 4a: Can I afford to build more armies?
			// 4b: Am I already at my force limit? (10 * Manpower from Development)
			
			// 5: Buildings
			if !tag_has_flag(tag, "BuiltRecently") && global.economy[tag_id][1] >= 125 {
				// 5a: check all owned provinces
				var owned_provs = map_find_owned_list(tag)
				show_debug_message("Owned Provs (" + tag + "): " + string(owned_provs))
				if array_length(owned_provs) > 0 {
					for (var prov = 0; prov < array_length(owned_provs); prov ++) {
						// Check all slots in province
						if tag_has_flag(tag, "BuiltRecently") { break }
						for (var slot = 0; slot < array_length(global.buildslots[owned_provs[prov]]); slot ++) {
							var building = global.buildslots[owned_provs[prov]][slot]
							show_debug_message("("+tag+") Building: " + string(building))
							// 5b: Is there already a building here? Can it be upgraded?
							if building != -1 && global.buildings[building][6] {
								show_debug_message("("+tag+") is Upgrading ")
								// If I can afford to upgrade:
								if global.economy[tag_id][1] >= global.buildings[building + 1][3] {
									global.buildslots[owned_provs[prov]][slot] = building + 1
									add_wealth(tag, -global.buildings[building + 1][3])
									
									// apply building effect
									if global.buildings[building + 1][1] == "Tax" {
										global.provinces[owned_provs[prov]][1] += global.buildings[building + 1][2]
									} else if global.buildings[building + 1][1] == "Production" {
										global.provinces[owned_provs[prov]][3] += global.buildings[building + 1][2]
									} else if global.buildings[building + 1][1] == "Manpower" {
										global.provinces[owned_provs[prov]][2] += global.buildings[building + 1][2]
									} else if global.buildings[building + 1][1] == "Threat" {
										// Placeholder for Threat Impact	
									}
									
									flag_add(tag, "BuiltRecently", 3) // Add three turn cooldown for building
									show_debug_message("("+tag+") Flags: " + string(global.flags[tag_id]))
									break 
								} else {
									continue	
								}
							} else if building == -1 {
								// IF slot is empty
								show_debug_message("("+tag+") slot is empty ")
								var wealth = global.economy[tag_id][1]
								for (i = 0; i < array_length(global.buildings); i ++) {
									// Check potential buildings
									var affordables = []
									if global.buildings[i][4] == -1 && (wealth >= global.buildings[i][3]) {
										// If building has no prerequisites and is affordable
										array_push(affordables, i)
									}
									
									// If there is an affordable building
									if array_length(affordables) > 0 {
										show_debug_message("("+tag+") is building a new one ")
										// Choose random affordable building
										var chosen_building = affordables[irandom_range(0, array_length(affordables)-1)]
									
										global.buildslots[owned_provs[prov]][slot] = chosen_building
										add_wealth(tag, -global.buildings[chosen_building][3])
									
										// apply building effect
										if global.buildings[chosen_building][1] == "Tax" {
											global.provinces[owned_provs[prov]][1] += global.buildings[chosen_building][2]
										} else if global.buildings[chosen_building][1] == "Production" {
											global.provinces[owned_provs[prov]][3] += global.buildings[chosen_building][2]
										} else if global.buildings[chosen_building][1] == "Manpower" {
											global.provinces[owned_provs[prov]][2] += global.buildings[chosen_building][2]
										} else if global.buildings[chosen_building][1] == "Threat" {
											// Placeholder for Threat Impact	
										}
									
										flag_add(tag, "BuiltRecently", 3) // Add three turn cooldown for building
									}
								}
							} else {
								continue
							}
						}
					}
				}
				
					// 5c: if not, is there a free slot?
					// 5d: if free slot; can i afford to build something? Choose from a random range of affordable options
				// 5e: add flag for 3 turns "BuiltRecently"
			}	
			
			// 6a: Does the King like me?
			// 6b: Do I like the King? (If so, improve relations. If not, plot)
			
			// 7: Am I at war?
			if array_length(global.wars[tag_id]) > 0 {
				// Check each of my armies
				for (var army = 0; army < array_length(armies); army ++) {
					var enemy_armies = []
					if array_length(armies[army].path) == 0 {
						// If army has no path
						enemy_armies = find_enemy_armies(tag)								  // Fetches all enemy army object ids
						var target_army = find_target_army(enemy_armies, armies[army])			  // Chooses an enemy army to chase
						//if target_army == noone { continue }
						show_debug_message(target_army)
						//show_debug_message(armies[army].location)
						//if target_army != noone { show_debug_message(target_army.location) }
						
						armies[army].path = find_path_to_target(target_army, armies[army])
						show_debug_message(armies[army].path)
						
					} 
					
					if array_length(armies[army].path) > 0 {
						// If army has a path
						armies[army].location = armies[army].path[0]
						armies[army].x = global.provinces[armies[army].path[0]][7]
						armies[army].y = global.provinces[armies[army].path[0]][8]
						array_delete(armies[army].path, 0, 1)
					}
					
					if array_length(enemy_armies) > 0 { check_for_potential_battle(armies[army]) }
				}
			}
			
			// 7b: Return home if not at war
		}
	}
	
	obj_army.moves_remaining = 2
	economy_update(player_tag)
	
	// Update the Date
	// Seasons: 0 - Spring, 1 - Summer, 2 - Autumn, 3 - Winter
	if obj_control.date[0] == "January"			{ obj_control.date[0] = "February"	}
	else if obj_control.date[0] == "February"	{ obj_control.date[0] = "March"			season = 0 }
	else if obj_control.date[0] == "March"		{ obj_control.date[0] = "April"		}
	else if obj_control.date[0] == "April"		{ obj_control.date[0] = "May"		}
	else if obj_control.date[0] == "May"		{ obj_control.date[0] = "June"			season = 1 }
	else if obj_control.date[0] == "June"		{ obj_control.date[0] = "July"		}
	else if obj_control.date[0] == "July"		{ obj_control.date[0] = "August"	}
	else if obj_control.date[0] == "August"		{ obj_control.date[0] = "September"		season = 2 }
	else if obj_control.date[0] == "September"	{ obj_control.date[0] = "October"	}
	else if obj_control.date[0] == "October"	{ obj_control.date[0] = "November"	}
	else if obj_control.date[0] == "November"	{ obj_control.date[0] = "December"	}
	else if obj_control.date[0] == "December"	{ obj_control.date[0] = "January" 		season = 3			obj_control.date[1] += 1 }
	
	if player_fabricating > 0 && player_fabricating < 3 { player_fabricating += 1 }
	if player_fabricating >= 3 { tag_add_claim(player_tag, player_fabricate_target) player_fabricate_target = noone player_fabricating = 0 }
	
	diplo_moves = 3
	court_actions = 1
	turn_no += 1
	turn_stage = "Player"
}















/////////// RESERVE CODE (defunct)

//if array_length(global.wars[tag_id]) > 0 {
//				// Checks if you have any enemies
//				for (var army_id = 0; army_id < array_length(global.army[tag_id]); army_id ++) {
//					// Cycles through your armies
//					var enemy_army
//					with obj_army {
//						// Checks that this army belongs to you
//						if id.tag_id == tag_id && id.army_id == army_id {
//							var your_army = id
//							for (var enemy_id = 0; enemy_id < array_length(global.wars[tag_id]); enemy_id ++) {
//								// Cycles through each enemy
//								for (var ae = 0; ae < instance_number(obj_army); ae ++) {
//									enemy_army = instance_find(obj_army, ae);
//									// Checks if the army belongs to the enemy
//									if enemy_army.tag_id == enemy_id {
//										// Checks if the enemy army is close enough
//										if distance_to_object(your_army) < 400 {
//											break
//										} else {
//											enemy_army = noone	
//										}
//									}
//								}
//							}
							
//							/// Move the army in the general direction of the enemy army
//							if enemy_army != noone {
//								for (moves_remaining = 2; moves_remaining > 0; moves_remaining --) {
//									var x_dir, y_dir
//									var adjs = map_province_get_adjacent_list(your_army.location)
//									if abs(your_army.x - enemy_army.x) > abs(your_army.y - enemy_army.y) {
//										// If X difference is greater than Y difference
//										if your_army.x - enemy_army.x > 0 {
//											x_dir = "right"
//										} else if your_army.x - enemy_army.x < 0 {
//											x_dir = "left"
//										}
										
//										for (var j = 0; j < array_length(adjs); j ++) {
//											// Cycles through adjacaent provinces
//											if x_dir == "right" && global.provinces[adjs[j]][7] > your_army.x {
//												your_army.location = adjs[j]
//												your_army.x = global.provinces[adjs[j]][7]
//												your_army.y = global.provinces[adjs[j]][8]
//												break
//											} else if x_dir == "left" && global.provinces[adjs[j]][7] < your_army.x {
//												your_army.location = adjs[j]
//												your_army.x = global.provinces[adjs[j]][7]
//												your_army.y = global.provinces[adjs[j]][8]
//												break
//											}
//										}
//									} else if abs(your_army.x - enemy_army.x) < abs(your_army.y - enemy_army.y) {
//										// If Y difference is greater than X difference
//										if your_army.y - enemy_army.y > 0 {
//											y_dir = "down"
//										} else if your_army.y - enemy_army.y < 0 {
//											y_dir = "up"
//										}
										
//										for (var j = 0; j < array_length(adjs); j ++) {
//											// Cycles through adjacaent provinces
//											if y_dir == "down" && global.provinces[adjs[j]][8] > your_army.y {
//												your_army.location = adjs[j]
//												your_army.x = global.provinces[adjs[j]][7]
//												your_army.y = global.provinces[adjs[j]][8]
//												break
//											} else if y_dir == "up" && global.provinces[adjs[j]][8] < your_army.y {
//												your_army.location = adjs[j]
//												your_army.x = global.provinces[adjs[j]][7]
//												your_army.y = global.provinces[adjs[j]][8]
//												break
//											}
//										}
//									}
//								}
//							}
//						}
//					}
//				}
//			}