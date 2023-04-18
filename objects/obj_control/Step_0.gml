/// @description Drag to move camera

// Alter this if other things end up affecting army quality
army_quality = mil_budget
///////

if !instance_exists(selected_army) {
	selected_army = noone
}

if mouse_check_button_pressed(mb_middle) {
	drag_x = mouse_x
	drag_y = mouse_y
}

if main_tab == -1 {
	intrigue_open = false
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

//// Diplo scroll
//if main_tab == "Diplomacy" {
//	} else if mouse_wheel_down() && obj_control.diplo_scroll < 19 {
//		/// Scroll up on diplomenu
//		obj_control.diplo_scroll += 1
//		with obj_button {
//			if type == "TagListButton" {
//				y -= 64
//			}
//		}
//	} else if mouse_wheel_up() && obj_control.diplo_scroll > 0 {
//		/// Scroll up on diplomenu
//		obj_control.diplo_scroll -= 1
//		with obj_button {
//			if type == "TagListButton" {
//				y += 64
//			}
//		}
//}

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
		} else if prov_select_purpose == "BuildArmy" {
			array_push(global.army[tag_fetch_id(player_tag)], 100)
			with instance_create_depth(global.provinces[prov_selected][7], global.provinces[prov_selected][8], depth, obj_army) {
				
				id.tag_id = tag_fetch_id(obj_control.player_tag)		// The Owner
				army_id = array_length(global.army[id.tag_id])-1		// The Army id
				total_mp =  global.army[id.tag_id][army_id]			// The Army size
				location = obj_control.prov_selected			// The Province ID of its current location
			}
			
			menu_pop("Military")
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
			var tag, tag_id, ruler, armies, diplo_pts, local_flags
			tag_id = i
			tag = global.tags[i][0]
			ruler = global.tags[i][6]
			armies = find_my_armies(tag_id)
			diplo_pts = 3
			local_flags = [false, false, false, false] // 0 - Alliance Action, 1 - Marriage/Break Action, 2 - Insult/Claim Action
			
			// Ignores dead tags
			if tag_total_provinces(tag) == 0 { continue }
		
			// Gimme money says Mr AI
			economy_update(tag)
			
			// Update flags
			flags_update(tag_id)
			if array_length(global.flags[tag_id]) > 0 { print("[" + tag + " | " + string(turn_no) + "] Flags: " + string(global.flags[tag_id])) }
	
			// Ingores the player, skips to next iteration
			if tag == obj_control.player_tag || tag == "SPA" || tag == "PAP" { continue }
			
			// 1: Do I have an Alliance?
			allies_update(tag_id) // Removes invalid allies
			//wars_update(tag_id) // Removes non-mutual conflicts
			if diplo_pts > 0 && !local_flags[0] && tag != "FRA" {
				var a_chance = 0
				if array_length(global.allies[tag_id]) == 0 { a_chance = 15 }
				else if array_length(global.allies[tag_id]) == 1 { a_chance = 1 }
				else if array_length(global.allies[tag_id]) >= 2 { a_chance = 0 }
			
				// Random chance to find an ally
				if irandom(100) <= a_chance {
					// Search through tags to find one who likes me
					var new_ally = noone
					for (var a_tag = 0; a_tag < array_length(global.tags); a_tag ++) {
						var this_tag = global.tags[a_tag][0]
						if tag_total_provinces(this_tag) > 0 && tag_opinion_of(this_tag, tag) >= 25 {
							// If tag has at least one province and has good opinion
							if !tag_is_ally(tag, this_tag) && !tag_is_enemy(tag, this_tag) && this_tag != tag && this_tag != "FRA" && this_tag != obj_control.player_tag && this_tag != "SPA" && this_tag != "PAP" {
								// Can't already be an ally, or an enemy in a war, or yourself
								new_ally = this_tag
								break
							}
						}
					}
					
					// Add the ally
					if new_ally != noone && array_length(global.allies[tag_id]) <= 2 && array_length(global.allies[tag_fetch_id(new_ally)]) <= 2 {
						tag_add_ally(tag, new_ally)
						tag_add_opinion(tag, new_ally, 25)
						tag_add_opinion(new_ally, tag, 25)
						print("[" + tag + " | " + string(turn_no) + "] Allied with " + new_ally)
						diplo_pts -= 1
						new_ally = noone
						local_flags[0] = true
					} else {
						// No valid alliance, improve relation with random country
						var rand_tag = global.tags[irandom_range(0, array_length(global.tags)-1)][0]
						tag_add_opinion(tag, rand_tag, 10)
						tag_add_opinion(rand_tag, tag, 10)
						print("[" + tag + " | " + string(turn_no) + "] No Valid Ally, Improved Opinion w/ " + rand_tag)
						diplo_pts -= 1
						local_flags[0] = true
					}
				}
			}
			
			// 2: Do ally have a marriage with my allies? Should ally break an alliance?
			if diplo_pts > 0 && !local_flags[1] && array_length(global.allies[tag_id]) != 0 {
				if array_length(global.allies[tag_id]) == 0 { a_chance = 0 }
				else if array_length(global.allies[tag_id]) == 1 { a_chance = 30 }
				else if array_length(global.allies[tag_id]) >= 2 { a_chance = 50 }
				
				// Random chance to arrange marriage with an ally or break alliance
				if irandom(100) <= a_chance {
					var m_ally = noone
					var b_ally = noone
					for (var ally = 0; ally < array_length(global.allies[tag_id]); ally ++) {
						// Cycle through allies
						if tag_opinion_of(global.allies[tag_id][ally], tag) <= 50 {
							// Check for friendly ally (for marriage)
							m_ally = global.allies[tag_id][ally]
							break
						}
						
						if tag_opinion_of(global.allies[tag_id][ally], tag) < 0 {
							// Check for unfriendly ally (for breaking alliances)
							b_ally = global.allies[tag_id][ally]
							break
						}
					}
					
					// If there is a valid marriage target
					if m_ally != noone {
						var m_ally_id = tag_fetch_id(m_ally)
						//global.economy[m_ally_id][8] += 10
						global.economy[tag_id][8] += 10
						//tag_add_opinion(tag, m_ally_id, 25)
						tag_add_opinion(m_ally_id, tag, 25)
						diplo_pts -= 1
						print("[" + tag + " | " + string(turn_no) + "] Arranged marriage with " + m_ally)
						m_ally = noone
					}
					
					// If there is a valid alliance-break target
					if b_ally != noone {
						tag_remove_ally(tag, b_ally)
						tag_add_opinion(tag, b_ally, -50)
						tag_add_opinion(b_ally, tag, -50)
						diplo_pts -= 1
						print("[" + tag + " | " + string(turn_no) + "] Broke alliance with " + b_ally)
						b_ally = noone
					}
			
					local_flags[1] = true
				}
			}
			
			// 3a: Are any neighbours weaker than me?
			if diplo_pts > 0 && !local_flags[2] && tag != "FRA" && tag != "SPA" && tag != "PAP" {
				if irandom(100) <= 10 {
					// Cycle through potential foes
					var new_enemy = noone
					for(var e_tags = 0; e_tags < array_length(global.tags); e_tags ++) {
						// Check for excluded tags, dead ones and allies
						var e_tag = global.tags[e_tags][0]
						if e_tag != "FRA" && e_tag != "SPA" && e_tag != "PAP" && tag_total_provinces(e_tag) > 0 && !tag_is_ally(e_tag, tag) && !tag_is_enemy(e_tag, tag) {
							if military_get_tag_total(tag) > military_get_tag_total(e_tag) && map_tag_is_adjacent(tag, e_tag) {
								// If my army is larger than theirs and we are adjacent to each other
								new_enemy = e_tag
								break
							}
						}
					}
				
					if new_enemy != noone && tag_has_claim(tag, new_enemy) && array_length(global.wars[tag_id]) == 0 && (tag_opinion_of(tag, new_enemy) <= 0 || tag_opinion_of(new_enemy, tag) <= 0) {
						// If you have a claim, Declare War!!!
						tag_declare_war(tag, new_enemy)
						tag_add_opinion(new_enemy, tag, -50)
						diplo_pts -= 1
						print("[" + tag + " | " + string(turn_no) + "] Declared war on " + new_enemy)
						new_enemy = noone
					} else if new_enemy != noone && !tag_has_claim(tag, new_enemy) && (tag_opinion_of(tag, new_enemy) <= 0 || tag_opinion_of(new_enemy, tag) <= 0) {
						// If we have bad relations and havent got a claim
						global.economy[tag_id][8] -= 10
						tag_add_claim(tag, new_enemy)
						print("[" + tag + " | " + string(turn_no) + "] Fabricated claim on " + new_enemy)
						new_enemy = noone
					}
				
					if new_enemy != noone && tag_opinion_of(new_enemy, tag) > 0 {
						tag_remove_opinion(new_enemy, tag, 25)
						tag_remove_opinion(tag, new_enemy, 25)
						diplo_pts = -1
						print("[" + tag + " | " + string(turn_no) + "] Sent an insult to " + new_enemy)
						new_enemy = noone
					}
				}
				local_flags[2] = true
			}
			
			// 4a: Can I afford to build more armies?
			if global.economy[tag_id][1] >= 20 && global.economy[tag_id][5] >= 1 && military_get_tag_total(tag) < (tag_total_development(tag)*100) {
				// If I am below force limit and can afford it, build to army
				// If I have an existing army, build to it
				var my_armies = find_my_armies(tag_id)
				if array_length(my_armies) > 0 {
					var rand_army = irandom_range(0, array_length(my_armies)-1)
					global.army[tag_id][my_armies[rand_army].army_id] += 100
					global.economy[tag_id][5] -= 1
					global.economy[tag_id][1] -= 20
					
					print("[" + tag + " | " + string(turn_no) + "] Added to existing army.")
				} else {
					// if not, build a new army
					var rand_provs = map_find_owned_list(tag)
					var rand_prov = rand_provs[irandom_range(0, array_length(rand_provs)-1)]
					array_push(global.army[tag_id], 100)
					
					print("[" + tag + " | " + string(turn_no) + "] Wants to raise new army in PROV " + string(rand_prov))
					
					with instance_create_depth(global.provinces[rand_prov][7], global.provinces[rand_prov][8], depth, obj_army) {
				
						id.tag_id = tag_id									// The Owner
						army_id   = array_length(global.army[id.tag_id])-1	// The Army id
						total_mp  = global.army[id.tag_id][army_id]			// The Army size
						location  = rand_prov								// The Province ID of its current location
					}
					
					global.economy[tag_id][5] -= 1
					global.economy[tag_id][1] -= 20
					
					print("[" + tag + " | " + string(turn_no) + "] Raised new army.")
				}
			}
			// 4b: Am I already at my force limit? (10 * Manpower from Development)
			
			// 5: Buildings
			if !tag_has_flag(tag, "BuiltRecently") && global.economy[tag_id][1] >= 125 {
				// 5a: check all owned provinces
				var a_chance = 15
				var owned_provs = map_find_owned_list(tag)
				//show_debug_message("Owned Provs (" + tag + "): " + string(owned_provs))
				if array_length(owned_provs) > 0 && irandom(100) <= a_chance {
					for (var prov = 0; prov < array_length(owned_provs); prov ++) {
						// Check all slots in province
						if tag_has_flag(tag, "BuiltRecently") { break }
						for (var slot = 0; slot < array_length(global.buildslots[owned_provs[prov]]); slot ++) {
							var building = global.buildslots[owned_provs[prov]][slot]
							//show_debug_message("("+tag+") Building: " + string(building))
							// 5b: Is there already a building here? Can it be upgraded?
							//show_debug_message("building id: " + string(building))
							if building != -1 && global.buildings[building][6] {
								//show_debug_message("("+tag+") is Upgrading ")
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
									//show_debug_message("("+tag+") Flags: " + string(global.flags[tag_id]))
									break 
								} else {
									continue	
								}
							} else if building == -1 {
								// IF slot is empty
								//show_debug_message("("+tag+") slot is empty ")
								var wealth = global.economy[tag_id][1]
								var affordables = []
								for (var p_building = 0; p_building < array_length(global.buildings); p_building ++) {
									// Check potential buildings
									if global.buildings[p_building][4] == -1 && (wealth >= global.buildings[p_building][3]) {
										// If building has no prerequisites and is affordable
										array_push(affordables, p_building)
									}
								}
									// If there is an affordable building
								if array_length(affordables) > 0 {
									//show_debug_message("("+tag+") is building a new one ")
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
			if array_length(global.wars[tag_id]) > 0 && tag_total_provinces(tag) > 0 {
				// Check each of my armies
				for (var army = 0; army < array_length(armies); army ++) {
					var enemy_armies = []
					var target_army = noone
					if array_length(armies[army].path) == 0 {
						// If army has no path
						enemy_armies = find_enemy_armies(tag)								  // Fetches all enemy army object ids
						target_army = find_target_for_army(enemy_armies, armies[army])			  // Chooses an enemy army to chase
						//if target_army == noone { continue }
						show_debug_message("Target Army: " + string(target_army))
						//show_debug_message(armies[army].location)
						//if target_army != noone { show_debug_message(target_army.location) }
						
						armies[army].path = find_path_to_target(target_army, armies[army])
						show_debug_message("[" + tag + ": " + string(armies[army].army_id) + "] Path: " + string(armies[army].path))
						
					}
					
					show_debug_message("[" + tag + ": " + string(armies[army].army_id) + "] Target: " + string(target_army))
					
					if target_army != noone {
						if typeof(target_army) == "ref" {
							// If the target is another army
							if check_for_adjacent_enemy(armies[army]) == noone {
								// If enemy army is no longer adjacent to that target province
								show_debug_message("[" + tag + ": " + string(armies[army].army_id) + "] Path no longer valid, recalculating...")
								armies[army].path = find_path_to_target(target_army, armies[army])
							}
						} else {
							// If the target is a province id
							if global.provinces[target_army][9].prov_occupied_by != noone {
								// If the province is already occupied by someone
								show_debug_message("[" + tag + ": " + string(armies[army].army_id) + "] Path no longer valid, recalculating...")
								enemy_armies = find_enemy_armies(tag)									  // Fetches all enemy army object ids
								var target_army = find_target_for_army(enemy_armies, armies[army])			  // Chooses an enemy army to chase
								
								armies[army].path = find_path_to_target(target_army, armies[army])
							}
						}
						
						if typeof(target_army) != "ref" && array_length(armies[army].path) == 1 {
							show_debug_message("[" + tag + ": " + string(armies[army].army_id) + "] Booting them to target, wiping path...")
							armies[army].location = target_army
							armies[army].x = global.provinces[target_army][7]
							armies[army].y = global.provinces[target_army][8]
							armies[army].path = []
						}
					}
						
					if array_length(armies[army].path) > 0 {
						// If army has a path
						show_debug_message("[" + tag + ": " + string(armies[army].army_id) + "] Path = " + string(armies[army].path))
						armies[army].location = armies[army].path[0]
						armies[army].x = global.provinces[armies[army].path[0]][7]
						armies[army].y = global.provinces[armies[army].path[0]][8]
						array_delete(armies[army].path, 0, 1)
					}
					
					if array_length(enemy_armies) > 0 { check_for_potential_battle(armies[army]) }
					
				}
				
				// Check if you are the main enemy of your main enemy
				var e_first = tag_fetch_id(global.wars[tag_id][0])
				print("[" + tag + " | " + string(turn_no) + "] e_first = " + string(e_first))
				print("[" + tag + " | " + string(turn_no) + "] wars (enemies) = " + string(global.wars[tag_id]))
				if array_length(global.wars[tag_id]) > 0 && array_length(global.wars[e_first]) > 0 && e_first != tag_id {
					if global.wars[e_first][0] == tag {
						// Check if war is able to end
						// If you win absolutely: Take all occupations, enemy relinquishes theirs
						if military_get_tag_total(global.wars[tag_id][0]) == 0 && array_length(global.wars[tag_id]) > 0 && (has_provs_occupied(tag) || has_provs_occupied(global.wars[tag_id][0])) {
							// Take land, declare peace
							with obj_province {
								if map_province_owner(prov_id) == global.wars[tag_id][0] && prov_occupied_by == noone {
									// Occupy remaining enemy provs
									prov_occupied_by = tag
								}
							}
						
							with obj_province {
								// If you've occupied it, take it
								if prov_occupied_by == tag {
									map_province_own(prov_id, tag)
									id.tag = tag
									prov_occupied_by = noone
								// If enemy has occupied something, release it
								}
								if prov_occupied_by == global.wars[tag_id][0] {
									prov_occupied_by = noone
								}
								// If ally has occupied something, take it, if adjacent, otherwise you take it
								if tag_is_ally(tag, prov_occupied_by) {
									// ally takes it
									map_province_own(prov_id, prov_occupied_by)
									id.tag = prov_occupied_by
									prov_occupied_by = noone
								}
							}
						
							print("[" + tag + " | " + string(turn_no) + "] Won war against " + global.wars[tag_id][0])
							tag_declare_peace(tag, global.wars[tag_id][0])
						} else if all_provs_occupied(tag) {
							// if all of your provinces are occupied
							with obj_province {
								if id.tag == tag && prov_occupied_by != noone {
									map_province_own(prov_id, prov_occupied_by)
									id.tag = prov_occupied_by
									prov_occupied_by = noone
								}
								
								//if tag_is_enemy(prov_occupied_by, tag) {
								//	prov_occupied_by = noone
								//}
								//if tag_is_ally(prov_occupied_by, tag) {
								//	prov_occupied_by = noone
								//}
							}
							
							print("[" + tag + " | " + string(turn_no) + "] Lost war against " + global.wars[tag_id][0])
							tag_declare_peace(tag, global.wars[tag_id][0])
						} // If the war is indecisive
						else if military_get_tag_total(global.wars[tag_id][0]) == 0 && military_get_tag_total(tag) == 0 {
							// Release all occupations
							
							with obj_province {
								if tag_is_enemy(prov_occupied_by, tag) {
									// Release enemy occupations
									prov_occupied_by = noone
								}
								
								if prov_occupied_by == tag {
									// Release your occupations
									prov_occupied_by = noone
								}
								
								if tag_is_ally(prov_occupied_by, tag) {
									prov_occupied_by = noone
								}
							}
							
							print("[" + tag + " | " + string(turn_no) + "] Ended war against " + global.wars[tag_id][0])
							tag_declare_peace(tag, global.wars[tag_id][0])
						}
					} // If country no longer exists, annul war
					else if tag_total_provinces(global.wars[tag_id][0]) {
						print("[" + tag + " | " + string(turn_no) + "] Ended war against " + global.wars[tag_id][0])
						tag_declare_peace(tag, global.wars[tag_id][0])
					}
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