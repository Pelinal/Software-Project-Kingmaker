/// @description Mouse Check
if position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id) {
	// Check for Mouse Enter
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
				obj_control.lock_ui = true
				obj_control.main_tab = "Profile"
				menu_pop("Profile")
			} else if type == "LangSetting" {
				if obj_control.lang_setting == 1 {
					obj_control.lang_setting = 3
				} else {
					obj_control.lang_setting = 1
				}
			} else if type == "ArmyClose" {
				obj_control.army_overview_id = -1
				obj_control.selected_army = noone
			} else if type = "ArmySplit" {
				var new_army
				new_army = global.army[tag_fetch_id(obj_control.player_tag)][obj_control.selected_army.army_id] / 2
				global.army[tag_fetch_id(obj_control.player_tag)][obj_control.selected_army.army_id] -= new_army
				array_push(global.army[tag_fetch_id(obj_control.player_tag)], new_army)
				with instance_create_depth(obj_control.selected_army.x, obj_control.selected_army.y, obj_control.selected_army.depth, obj_army) {
					tag_id = obj_control.selected_army.tag_id
					army_id = array_length(global.army) - 1
					location = obj_control.selected_army.location
				}
			} else if type == "ArmyMerge" {
				with obj_control.selected_army {
					var other_army = instance_place(x, y, obj_army);
					if (other_army != noone) {
						global.army[tag_fetch_id(obj_control.player_tag)][obj_control.selected_army.army_id] += global.army[tag_fetch_id(obj_control.player_tag)][other_army.army_id]
						array_delete(global.army[tag_fetch_id(obj_control.player_tag)], other_army.army_id, 1)
						instance_destroy(other_army)
					}
				}
			} else if type == "Intrigue" {
				if obj_control.intrigue_open {
					obj_control.intrigue_open = false 
					
					with obj_button {
						if type == "Sabotage Armies" || type == "Raid Province" || type == "Infiltrate Court" {
							instance_destroy(self)
						}
					}
				}
				else {
					obj_control.intrigue_open = true
					
					with instance_create_depth(x, y + 64, -1003, obj_button) {
						type = "Sabotage Armies"
						image_xscale = 0.85
						diplo_action = true
						opinion_req = 0
						ico_index = 22
						sprite_index = spr_rectlarge_button
					}
					with instance_create_depth(x, y + 128, -1003, obj_button) {
						type = "Raid Province"
						image_xscale = 0.85
						diplo_action = true
						opinion_req = 0
						ico_index = 23
						sprite_index = spr_rectlarge_button
					}
					with instance_create_depth(x, y + 192, -1003, obj_button) {
						type = "Infiltrate Court"
						image_xscale = 0.85
						diplo_action = true
						opinion_req = 0
						ico_index = 24
						sprite_index = spr_rectlarge_button
					}
				}
			} else if type == "Form Alliance" && obj_control.diplo_moves > 0 {
				obj_control.diplo_moves -= 1
				if tag_opinion_of(obj_control.tag_overview_id, obj_control.player_tag) >= 25 && !tag_is_ally(obj_control.tag_overview_id, obj_control.player_tag) {
					tag_add_opinion(obj_control.tag_overview_id, obj_control.player_tag, 50)
					tag_add_opinion(obj_control.player_tag, obj_control.tag_overview_id, 50)
					tag_add_ally(obj_control.tag_overview_id, obj_control.player_tag)
					obj_control.threat_level -= 1
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
					obj_control.threat_level += 1
					obj_control.player_fabricating = 1
					obj_control.player_fabricate_target = obj_control.tag_overview_id
				}
			} else if type == "Declare War" && tag_has_claim(obj_control.player_tag, obj_control.tag_overview_id) && !tag_is_enemy(obj_control.player_tag, obj_control.tag_overview_id) {
				tag_add_opinion(obj_control.tag_overview_id, obj_control.player_tag, -50)
				tag_declare_war(obj_control.player_tag, obj_control.tag_overview_id)
				obj_control.threat_level += 5
			} else if type == "Declare War" && tag_is_enemy(obj_control.player_tag, obj_control.tag_overview_id) {
				with obj_province {
					if prov_occupied_by == obj_control.player_tag {
						map_province_own(prov_id, obj_control.player_tag)
						tag = obj_control.player_tag
						prov_occupied_by = noone
					} else if tag_is_enemy(prov_occupied_by, obj_control.player_tag) {
						map_province_own(prov_id, prov_occupied_by)
						tag = prov_occupied_by
						prov_occupied_by = noone
					} else if tag_is_ally(prov_occupied_by, obj_control.player_tag) {
						prov_occupied_by = noone
					}
				}
				tag_declare_peace(obj_control.player_tag, obj_control.tag_overview_id)
			} else if type == "Improve Relations" && obj_control.diplo_moves > 0 {
				obj_control.diplo_moves -= 1
				tag_add_opinion(obj_control.tag_overview_id, obj_control.player_tag, 10)
			} else if type == "End Turn" {
				obj_control.turn_stage = "AI"
			} else if type == "Demonstrate Fealty (-5)" {
				if global.economy[tag_fetch_id(obj_control.player_tag)][8] >= 10 && obj_control.court_actions > 0 {
					obj_control.threat_level -= 5
					if obj_control.threat_level < 0 { obj_control.threat_level = 0 }
					tag_add_opinion("FRA", obj_control.player_tag, 10)
					global.economy[tag_fetch_id(obj_control.player_tag)][8] -= 10
					obj_control.court_actions -= 1
					ico_index = 5
				}
			} else if type == "Pay Tribute (-10)" {
				if global.economy[tag_fetch_id(obj_control.player_tag)][1] >= 500 && obj_control.court_actions > 0 {
					obj_control.threat_level -= 10
					if obj_control.threat_level < 0 { obj_control.threat_level = 0 }
					global.economy[tag_fetch_id(obj_control.player_tag)][1] -= 500
					tag_add_opinion("FRA", obj_control.player_tag, 25)
					obj_control.court_actions -= 1
					ico_index = 6
				}
			} else if type == "Offer Recruits (-15)" {
				if global.economy[tag_fetch_id(obj_control.player_tag)][5] >= 5 && obj_control.court_actions > 0 {
					obj_control.threat_level -= 15
					if obj_control.threat_level < 0 { obj_control.threat_level = 0 }
					global.economy[tag_fetch_id(obj_control.player_tag)][5] -= 5
					tag_add_opinion("FRA", obj_control.player_tag, 35)
					obj_control.court_actions -= 1
					ico_index = 7
				}
			} else if type == "Grant Province (-25)" {
				if obj_control.court_actions > 0 {
					obj_control.threat_level -= 25
					if obj_control.threat_level < 0 { obj_control.threat_level = 0 }
					tag_add_opinion("FRA", obj_control.player_tag, 50)
					map_list_provselect(obj_control.player_tag)
					obj_control.prov_select_purpose = "GrantProv"
					obj_control.court_actions -= 1
					ico_index = 8
				}
			} else if type == "Request Title (+1)" {
				if obj_control.court_actions > 0 {
					obj_control.threat_level += 5
					if obj_control.threat_level > 100 { obj_control.threat_level = 100 }
					tag_remove_opinion("FRA", obj_control.player_tag, 5)
					global.economy[tag_fetch_id(obj_control.player_tag)][8] += 25
					obj_control.court_actions -= 1
					ico_index = 9
				}
			} else if type == "Request Funds (+5)" {
				if tag_opinion_of("FRA", obj_control.player_tag) > 25 || military_get_tag_total("FRA") * 1.2 < military_get_tag_total(obj_control.player_tag) {
					if obj_control.court_actions > 0 {
						obj_control.threat_level += 5
						if obj_control.threat_level > 100 { obj_control.threat_level = 100 }
						global.economy[tag_fetch_id(obj_control.player_tag)][1] += 500
						tag_remove_opinion("FRA", obj_control.player_tag, 15)
						obj_control.court_actions -= 1
						ico_index = 10
					}
				}
			} else if type == "Levy Reserves (+5)" {
				if tag_opinion_of("FRA", obj_control.player_tag) > 15 || military_get_tag_total("FRA") * 1.334 < military_get_tag_total(obj_control.player_tag) {
					if obj_control.court_actions > 0 {	
						obj_control.threat_level += 5
						if obj_control.threat_level > 100 { obj_control.threat_level = 100 }
						global.economy[tag_fetch_id(obj_control.player_tag)][5] += 5
						tag_remove_opinion("FRA", obj_control.player_tag, 25)
						obj_control.court_actions -= 1
						ico_index = 11
					}
				}
			} else if type == "Demand Province (+10)" {
				if tag_opinion_of("FRA", obj_control.player_tag) > 50 || military_get_tag_total("FRA") * 1.5 < military_get_tag_total(obj_control.player_tag) {
					if obj_control.court_actions > 0 {		
						obj_control.threat_level += 10
						if obj_control.threat_level > 100 { obj_control.threat_level = 100 }
						tag_remove_opinion("FRA", obj_control.player_tag, 35)
						map_list_provselect("FRA")
						obj_control.prov_select_purpose = "TakeProv"
						obj_control.court_actions -= 1
						ico_index = 12
					}
				}
			} else if type == "ProvSelect" {
				obj_control.prov_selected = prov_to_select
				
				with obj_button {
					if type == "ProvSelect" {
						instance_destroy(self)	
					}
				}
			} else if type == "BuildingSlot" && (global.buildslots[build_prov][build_slot] == -1 || global.buildings[global.buildslots[build_prov][build_slot] + 1][4] == global.buildslots[build_prov][build_slot]) {
				buildings_list_all(build_prov, build_slot)
			} else if type == "BuildSelect" {
				if global.economy[tag_fetch_id(obj_control.player_tag)][1] >= global.buildings[building_to_select][3] {
					global.buildslots[build_prov][build_slot] = building_to_select
					obj_control.build_select = false
					global.economy[tag_fetch_id(obj_control.player_tag)][1] -= global.buildings[building_to_select][3]
					if global.economy[tag_fetch_id(obj_control.player_tag)][1] < 0 {
						global.economy[tag_fetch_id(obj_control.player_tag)][1] = 0	
					}
					
					// Do the building effect
					if global.buildings[building_to_select][1] == "Tax" {
						global.provinces[build_prov][1] += global.buildings[building_to_select][2]
					} else if global.buildings[building_to_select][1] == "Production" {
						global.provinces[build_prov][3] += global.buildings[building_to_select][2]
					} else if global.buildings[building_to_select][1] == "Manpower" {
						global.provinces[build_prov][2] += global.buildings[building_to_select][2]
					} else if global.buildings[building_to_select][1] == "Threat" {
						// Placeholder for Threat Impact	
					}
					
					
				}
			} else if type == "TagListDN" && obj_control.diplo_scroll < (obj_control.diplo_count-10) {
				/// Scroll up on diplomenu
				obj_control.diplo_scroll += 1
				with obj_button {
					if type == "TagListButton" {
						y -= 64
					}
				}
			} else if type == "TagListUP" && obj_control.diplo_scroll > 0 {
				/// Scroll up on diplomenu
				obj_control.diplo_scroll -= 1
				with obj_button {
					if type == "TagListButton" {
						y += 64
					}
				}
			} else if type == "MilBudgetDN" {
				obj_control.mil_budget[tag_fetch_id(obj_control.player_tag)] = 0
			} else if type == "MilBudgetNO" {
				obj_control.mil_budget[tag_fetch_id(obj_control.player_tag)] = 1
			} else if type == "MilBudgetUP" {
				obj_control.mil_budget[tag_fetch_id(obj_control.player_tag)] = 2
			} else if type == "TagTo" {
				obj_control.player_tag = obj_control.tag_overview_id
			} else if type == "ArmyUpButton" {
				if global.economy[tag_id][1] >= 25 && global.economy[tag_id][5] > 1 {
					global.economy[tag_id][1] -= 25
					global.economy[tag_id][5] -= 1
					global.army[tag_id][army_id] += 100
				}
			} else if type == "ArmyDownButton" {
				if global.army[tag_id][army_id] > 100 {
					global.economy[tag_id][1] += 25
					global.economy[tag_id][5] += 1
					global.army[tag_id][army_id] -= 100
				}
			} else if type == "ArmyNewButton" {
				if global.economy[tag_id][1] >= 25 && global.economy[tag_id][5] > 1 {
					global.economy[tag_id][1] -= 25
					global.economy[tag_id][5] -= 1
					
					
					//show_debug_message(global.army[tag_id])
					map_list_provselect(obj_control.player_tag)
					obj_control.prov_select_purpose = "BuildArmy"
					
					
					
					menu_pop("Military")
				}
			} else if type == "EVT_Option" {
				if e_option == "To Glory!" || e_option == "That's Enough (Exit Tutorial)" {
					refresh_events()
				} else if e_option == "Summon the Advisors (Tutorial)" {
					refresh_events()
					show_event("Tutorial: Objective", "The primary objective of Kingmaker is to expand your nation through any means possible. Conquer territory from your neighbours, construct buildings to improve your economy, and recruit more men to your armies to facilitate further expansion. Eventually, you must challenge the King himself and take the capital of Paris to become King yourself, thus winning the game.", 7, ["Next (Controls)", "That's Enough (Exit Tutorial)"])
				} else if e_option == "Next (Controls)" {
					refresh_events()
					show_event("Tutorial: Controls", "The game's primary control scheme is using the mouse; LEFT-CLICK for using buttons, RIGHT-CLICK to close any menu, MIDDLE-CLICK on map to drag the view, SCROLL-WHEEL to zoom in and out of the map view.", 6, ["Next (Diplomacy)", "That's Enough (Exit Tutorial)"])
				} else if e_option == "Next (Diplomacy)" {
					refresh_events()
					show_event("Tutorial: Diplomacy", "In addition to the obvious interaction of warfare, you can perform certain beneficial diplomacy with other nations. This includes forming alliances, improving relations and forming political marriages. It is also on this interface that you are able to engage in intrigue, claim fabrication and war declaration.", 5, ["That's Enough (Exit Tutorial)"])
				} else if e_option == "A shame" {
					global.economy[tag_fetch_id(obj_control.player_tag)][8] -= 5
					refresh_events()
				} else if e_option == "Now we strike!" {
					global.economy[tag_fetch_id(obj_control.player_tag)][8] += 5
					refresh_events()
				} else if e_option == "Let their cities burn!" {
					global.economy[tag_fetch_id(obj_control.player_tag)][8] += 5
					refresh_events()
				} else if e_option == "Their secrets laid bare" {
					global.economy[tag_fetch_id(obj_control.player_tag)][8] += 5
					refresh_events()
				}
			// Intrigue
			} else if type == "Sabotage Armies" && !tag_has_flag(obj_control.player_tag, "RecentIntrigue") {
				var chance = random(1)
				if chance <= 0.4 {
					// 40 % chance
					var flavstring = army_damage_random(obj_control.tag_overview_id)
					show_event("Sabotage: Success!", "The poisioning was a success. The " + flavstring, 3, ["Now we strike!"])
					flag_add(obj_control.player_tag, "RecentIntrigue", 3)	
				} else {
					show_event("Sabotage: Failure!", "Our agent in charge of sabotaging the enemy's armies has been captured. It seems our efforts were in vain, maybe we'll get them next time?", 3, ["A shame"])
					flag_add(obj_control.player_tag, "RecentIntrigue", 3)	
				}
			} else if type == "Raid Province" && !tag_has_flag(obj_control.player_tag, "RecentIntrigue") {
				var chance = random(1)
				if chance <= 0.3 {
					// 30 % chance
					var flavstring = map_damage_random(obj_control.tag_overview_id)
					show_event("Raid: Success!", "Our raiding party has returned in triump! The " + flavstring +  " has been damaged by 2 points of development.", 3, ["Let their cities burn!"])
					flag_add(obj_control.player_tag, "RecentIntrigue", 3)	
				} else {
					show_event("Raid: Failure!", "A disaster! Our raiding party was captured and executed by the enemy, we have had to deny all involvement. This will be a major setback in our efforts.", 3, ["A shame"])
					flag_add(obj_control.player_tag, "RecentIntrigue", 3)	
				}
			} else if type == "Infiltrate Court" && !tag_has_flag(obj_control.player_tag, "RecentIntrigue") {
				var chance = random(1)
				if chance <= 0.6 {
					// 60 % chance
					obj_control.player_sees[tag_fetch_id(obj_control.tag_overview_id)] = true
					show_event("Infiltration: Success!", "Our agent reports they have successfully infilrated themselves into the enemy's court, earning trust among the courtiers there.", 3, ["Their secrets laid bare"])
					flag_add(obj_control.player_tag, "RecentIntrigue", 3)			
				} else {
					show_event("Infiltration: Failure!", "Efforts to infiltrate our enemy's court have turned sour. Our agents have been captured and forced to retreat.", 3, ["A shame"])
					flag_add(obj_control.player_tag, "RecentIntrigue", 3)	
				}
			} else if type == "TagListButton" && visible {
					//show_debug_message("tagid::: " + string(tag_id))
					
					obj_control.main_tab = "Profile"
					obj_control.tag_overview_id = global.tags[tag_id][0]
					//show_debug_message("overviewid::: " + string(obj_control.tag_overview_id))
					//obj_control.lock_ui = true
					
					
					if obj_control.tag_overview_id != obj_control.player_tag {
						// Create Diplo Dropdowns
						obj_control.dropdowns = [false, false, false, false]
						if obj_control.tag_overview_id == "FRA" {
							/// DEBUG BUTTON
							with instance_create_depth(502, 218, -1111, obj_button) {
								type = "TagTo"
								ico_index = 11
								sprite_index = spr_square_button
							}
							/////////////////
							with instance_create_depth(24, 680, -1003, obj_button) {
								type = "Improve Relations"
								diplo_action = true
								opinion_req = 0
								ico_index = 1
								sprite_index = spr_rectlarge_button
							}
							with instance_create_depth(24, 744, -1003, obj_button) {
								type = "Arrange Marriage"
								diplo_action = true
								opinion_req = 75
								ico_index = 2
								sprite_index = spr_rectlarge_button
							}
							
							
							with instance_create_depth(350, 680, -103, obj_button) {
								type = "Declare War"
								diplo_action = true
								opinion_req = 0
								ico_index = 13
								sprite_index = spr_rectlarge_button
							}
							with instance_create_depth(350, 744, -103, obj_button) {
								type = "Fabricate Claim"
								diplo_action = true
								opinion_req = 0
								ico_index = 3
								sprite_index = spr_rectlarge_button
							}
							with instance_create_depth(350, 808, -103, obj_button) {
								type = "Intrigue"
								diplo_action = true
								opinion_req = 0
								ico_index = 4
								sprite_index = spr_rectlarge_button
							}
						} else if obj_control.tag_overview_id == "SPA" || obj_control.tag_overview_id == "PAP" {
							/// DEBUG BUTTON
							with instance_create_depth(502, 218, -1111, obj_button) {
								type = "TagTo"
								ico_index = 11
								sprite_index = spr_square_button
							}
							/////////////////
							with instance_create_depth(24, 680, -1003, obj_button) {
								type = "Improve Relations"
								diplo_action = true
								opinion_req = 0
								ico_index = 1
								sprite_index = spr_rectlarge_button
							}
							with instance_create_depth(24, 744, -1003, obj_button) {
								type = "Arrange Marriage"
								diplo_action = true
								opinion_req = 50
								ico_index = 2
								sprite_index = spr_rectlarge_button
							}
						} else {
							/// DEBUG BUTTON
							with instance_create_depth(502, 218, -1111, obj_button) {
								type = "TagTo"
								ico_index = 11
								sprite_index = spr_square_button
							}
							/////////////////
							with instance_create_depth(24, 680, -1003, obj_button) {
								type = "Form Alliance"
								diplo_action = true
								opinion_req = 50
								ico_index = 0
								sprite_index = spr_rectlarge_button
							}
							with instance_create_depth(24, 744, -1003, obj_button) {
								type = "Improve Relations"
								diplo_action = true
								opinion_req = 0
								ico_index = 1
								sprite_index = spr_rectlarge_button
							}
							with instance_create_depth(24, 808, -1003, obj_button) {
								type = "Arrange Marriage"
								diplo_action = true
								opinion_req = 25
								ico_index = 2
								sprite_index = spr_rectlarge_button
							}
							
							
							with instance_create_depth(350, 680, -103, obj_button) {
								type = "Declare War"
								diplo_action = true
								opinion_req = 0
								ico_index = 13
								sprite_index = spr_rectlarge_button
							}
							with instance_create_depth(350, 744, -103, obj_button) {
								type = "Fabricate Claim"
								diplo_action = true
								opinion_req = 0
								ico_index = 3
								sprite_index = spr_rectlarge_button
							}
							with instance_create_depth(350, 808, -103, obj_button) {
								type = "Intrigue"
								diplo_action = true
								opinion_req = 0
								ico_index = 4
								sprite_index = spr_rectlarge_button
							}
						}
					}
					
					//instance_destroy(self)
				}
			
			//else if type == "Build Units" {
			//	// Create Plus, Minus and OK buttons
			//	with obj_button { 
			//		if type == "BA_Plus" || type == "BA_Minus" || type == "BA_OK" {
			//			instance_destroy(self)
			//		}
			//	}
			//	with instance_create_depth((x + sprite_width) -64, y - 64, -1004, obj_button) {
			//		type = "BA_Plus"
			//		ico_index = 8
			//		sprite_index = spr_square_button
			//	}
			//	with instance_create_depth(x, y - 64, -1004, obj_button) {
			//		type = "BA_Minus"
			//		ico_index = 9
			//		sprite_index = spr_square_button
			//	}
			//	//with instance_create_depth(x + sprite_width, y - 64, -1004, obj_button) {
			//	//	type = "BA_OK"
			//	//	ico_index = 10
			//	//	sprite_index = spr_square_button
			//	//}
			//}
			//if type == "Dropdown" {
			//	switch dropdown_type {
			//		case "Relations":
			//			obj_control.dropdowns[0] = !obj_control.dropdowns[0]
			//			break
			//		case "Intrigue":
			//			obj_control.dropdowns[1] = !obj_control.dropdowns[0]
			//			break
			//		case "Economic":
			//			obj_control.dropdowns[2] = !obj_control.dropdowns[2]
			//			break
			//	}
			//}
			
			if obj_control.lock_ui == false {
				if type == "ProfileSmall" {
					//show_debug_message("Clicked Profile or Taglist")
					obj_control.tag_overview_id = tag_id
					obj_control.province_overview_id = -1
					obj_control.lock_ui = true
					obj_control.main_tab = "Profile"
					
					with obj_button {
						if type == "BuildingSlot" {
							instance_destroy()
						}
					}
					
					if obj_control.tag_overview_id != obj_control.player_tag {
						// Create Diplo Dropdowns
						obj_control.dropdowns = [false, false, false, false]
						if obj_control.tag_overview_id == "FRA" {
							/// DEBUG BUTTON
							with instance_create_depth(502, 218, -1111, obj_button) {
								type = "TagTo"
								ico_index = 11
								sprite_index = spr_square_button
							}
							/////////////////
							with instance_create_depth(24, 680, -1003, obj_button) {
								type = "Improve Relations"
								diplo_action = true
								opinion_req = 0
								ico_index = 1
								sprite_index = spr_rectlarge_button
							}
							with instance_create_depth(24, 744, -1003, obj_button) {
								type = "Arrange Marriage"
								diplo_action = true
								opinion_req = 75
								ico_index = 2
								sprite_index = spr_rectlarge_button
							}
							
							with instance_create_depth(350, 680, -103, obj_button) {
								type = "Declare War"
								diplo_action = true
								opinion_req = 0
								ico_index = 13
								sprite_index = spr_rectlarge_button
							}
							with instance_create_depth(350, 744, -103, obj_button) {
								type = "Fabricate Claim"
								diplo_action = true
								opinion_req = 0
								ico_index = 3
								sprite_index = spr_rectlarge_button
							}
							with instance_create_depth(350, 808, -103, obj_button) {
								type = "Intrigue"
								diplo_action = true
								opinion_req = 0
								ico_index = 4
								sprite_index = spr_rectlarge_button
							}
						} else if obj_control.tag_overview_id == "SPA" || obj_control.tag_overview_id == "PAP" {
							/// DEBUG BUTTON
							with instance_create_depth(502, 218, -1111, obj_button) {
								type = "TagTo"
								ico_index = 11
								sprite_index = spr_square_button
							}
							/////////////////
							with instance_create_depth(24, 680, -1003, obj_button) {
								type = "Improve Relations"
								diplo_action = true
								opinion_req = 0
								ico_index = 1
								sprite_index = spr_rectlarge_button
							}
							with instance_create_depth(24, 744, -1003, obj_button) {
								type = "Arrange Marriage"
								diplo_action = true
								opinion_req = 50
								ico_index = 2
								sprite_index = spr_rectlarge_button
							}
						} else {
							/// DEBUG BUTTON
							with instance_create_depth(502, 218, -1111, obj_button) {
								type = "TagTo"
								ico_index = 11
								sprite_index = spr_square_button
							}
							/////////////////
							with instance_create_depth(24, 680, -1003, obj_button) {
								type = "Form Alliance"
								diplo_action = true
								opinion_req = 50
								ico_index = 0
								sprite_index = spr_rectlarge_button
							}
							with instance_create_depth(24, 744, -1003, obj_button) {
								type = "Improve Relations"
								diplo_action = true
								opinion_req = 0
								ico_index = 1
								sprite_index = spr_rectlarge_button
							}
							with instance_create_depth(24, 808, -1003, obj_button) {
								type = "Arrange Marriage"
								diplo_action = true
								opinion_req = 25
								ico_index = 2
								sprite_index = spr_rectlarge_button
							}
							
							with instance_create_depth(350, 680, -103, obj_button) {
								type = "Declare War"
								diplo_action = true
								opinion_req = 0
								ico_index = 13
								sprite_index = spr_rectlarge_button
							}
							with instance_create_depth(350, 744, -103, obj_button) {
								type = "Fabricate Claim"
								diplo_action = true
								opinion_req = 0
								ico_index = 3
								sprite_index = spr_rectlarge_button
							}
							with instance_create_depth(350, 808, -103, obj_button) {
								type = "Intrigue"
								diplo_action = true
								opinion_req = 0
								ico_index = 4
								sprite_index = spr_rectlarge_button
							}
						}
					}
					
					instance_destroy(self)
				}
			}
	}
} 

if !position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id) {
	image_index = 0
}

if position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id) {
	image_index = 1
}

if type == "TagListButton" && (y > 904 || y < 300) {
	visible = false
} else {
	visible = true	
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
	tag_id = obj_control.player_tag
} else if type == "CloseArmy" {
	ico_index = 7
}
if obj_control.tag_overview_id == -1 {
	if type == "Dropdown" {
		instance_destroy(self)
		obj_control.dropdowns = [false, false, false, false]
	}
	
	if diplo_action || type == "TagTo" {
		instance_destroy(self)
	}
}

if obj_control.main_tab != "Diplomacy" && (type == "TagListButton" || type == "TagListUP" || type == "TagListDN") {
	instance_destroy(self)
}

if obj_control.main_tab != "Military" && (type == "ArmyListButton" || type == "ArmyNewButton" || type == "ArmyUpButton" || type == "ArmyDownButton") {
	instance_destroy(self)
}

if obj_control.main_tab != "Economy" && (type == "MilBudgetDN" || type == "MilBudgetNO" || type == "MilBudgetUP") {
	instance_destroy(self)
}

if !obj_control.prov_select && type == "ProvSelect" {	
	instance_destroy(self)
}
if !obj_control.build_select && type == "BuildSelect" {	
	instance_destroy(self)
}

if obj_control.province_overview_id == -1 && type == "BuildingSlot" {
	instance_destroy(self)
}
