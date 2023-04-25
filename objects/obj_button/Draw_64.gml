/// @description Draw Self
if type == "ArmyMerge" || type == "ArmySplit" 
|| type == "ArmyBuild" || type == "ArmyClose" {
	exit;
}
draw_self()
draw_set_alpha(1)
draw_set_font(fnt_header)
draw_set_colour(c_white)
if type == "Build Units" {
	draw_sprite(sprite_index, 2, x, y)
	draw_set_colour(c_black)
	draw_set_halign(fa_center)
	draw_text(x + sprite_width/2, 1020, type)
	draw_set_halign(fa_left)
} else if sprite_index = spr_square_button && type != "LangSetting" {
	draw_sprite(spr_square_button, ico_index, x, y)
} else if sprite_index = spr_sqdark_button {
	draw_sprite(spr_sqdark_button, ico_index, x, y)
} else if type == "BuildingSlot" {
	if global.buildslots[build_prov][build_slot] != -1 {
		if global.buildslots[build_prov][build_slot] >= 0 && global.buildslots[build_prov][build_slot] <= 2 {
			draw_sprite(spr_building_slot, 3, x, y)
		} else if global.buildslots[build_prov][build_slot] >= 3 && global.buildslots[build_prov][build_slot] <= 5 {
			draw_sprite(spr_building_slot, 4, x, y)
		} else if global.buildslots[build_prov][build_slot] >= 6 && global.buildslots[build_prov][build_slot] <= 9 {
			draw_sprite(spr_building_slot, 5, x, y)
		} else if global.buildslots[build_prov][build_slot] >= 10 {
			draw_sprite(spr_building_slot, 6, x, y)
		}
	} else {
		draw_sprite(spr_building_slot, 2, x, y)
	}
} else if type == "LangSetting" {
	draw_set_color(c_black)
	draw_text(x + 20, y + 54, "Language")
	draw_set_color(c_white)
} else if type == "Dropdown" {
	draw_set_colour(c_grey)
	draw_text(x + 96, y + 24, dropdown_type)
} else if diplo_action == true || type == "End Turn" {
	draw_set_colour(c_white)
	if type == "Declare War" && tag_is_enemy(obj_control.player_tag, obj_control.tag_overview_id) {
		draw_text(x + 74, y + 24, "Offer Peace")
		draw_sprite(spr_icons, 15, x + 3, y + 3)
	} else if type == "Declare War" && !tag_is_enemy(obj_control.player_tag, obj_control.tag_overview_id) {
		draw_text(x + 74, y + 24, "Declare War")
		draw_sprite(spr_icons, 13, x + 3, y + 3)
	} else if type == "Form Alliance" && tag_is_ally(obj_control.player_tag, obj_control.tag_overview_id) {
		draw_text(x + 74, y + 24, "Break Alliance")
		draw_sprite(spr_icons, 14, x + 3, y + 3)
	} else if type == "Intrigue" && !obj_control.intrigue_open { 
		draw_sprite(spr_icons, ico_index, x + 3, y + 3)
		draw_text(x + 74, y + 24, "Open Intrigue")
		draw_sprite(spr_icons, 20, (x + sprite_width) - 64, y + 3)
	} else if type == "Intrigue" && obj_control.intrigue_open { 
		draw_sprite(spr_icons, ico_index, x + 3, y + 3)
		draw_text(x + 74, y + 24, "Close Intrigue")
		draw_sprite(spr_icons, 21, (x + sprite_width) - 64, y + 3)
	} else {
		draw_sprite(spr_icons, ico_index, x + 3, y + 3)
		draw_text(x + 74, y + 24, type)
	}
	if opinion_req != 0 {
		if type == "Form Alliance" && !tag_is_ally(obj_control.player_tag, obj_control.tag_overview_id) {
			if tag_opinion_of(obj_control.tag_overview_id, obj_control.player_tag) >= 25 {
				draw_sprite(sprite_index, 2, x, y)
			} else {
				draw_sprite(sprite_index, 3, x, y)
			}
		} else if type == "Arrange Marriage" {
			if tag_opinion_of(obj_control.tag_overview_id, obj_control.player_tag) >= 0 {
				draw_sprite(sprite_index, 2, x, y)
			} else {
				draw_sprite(sprite_index, 3, x, y)
			}
		}
	}
} else if type == "ArmyList" {
	draw_set_colour(c_grey)
	draw_text(x + 96, y + 24, global.unit[unit_id][0])
} else if court_action == true {
	draw_set_colour(c_white)
	draw_sprite(spr_icons, ico_index, x + 3, y + 3)
	draw_set_font(fnt_header_4)
	draw_text(x + 74, y + 24, type)
	if opinion_req != 0 {	
		if tag_opinion_of("FRA", obj_control.player_tag) >= opinion_req {
			draw_sprite(sprite_index, 2, x, y)
		} else {
			draw_sprite(sprite_index, 3, x, y)
		}
	}
} else if type == "EVT_Option" {
	draw_set_colour(c_white)
	draw_set_font(fnt_header_4)
	draw_set_halign(fa_center)
	draw_text(x + 240, y + 16, e_option)
	draw_set_halign(fa_left)
} else if type == "ProvSelect" {
	draw_set_colour(c_white)
	draw_text(x + 12, y + 24, global.provinces[prov_to_select][0])
	draw_set_halign(fa_right)
	draw_text(x + (sprite_width - 12), y + 24, string(global.provinces[prov_to_select][1] + global.provinces[prov_to_select][2] + global.provinces[prov_to_select][3]))
	draw_set_halign(fa_left)
} else if type == "BuildSelect" {
	draw_set_colour(c_white)
	draw_text(x + 12, y + 24, global.buildings[building_to_select][0])
	draw_set_halign(fa_right)
	draw_text(x + (sprite_width - 12), y + 24, string(global.buildings[building_to_select][1]) + " " + string(global.buildings[building_to_select][2]) +  "  " + string(global.buildings[building_to_select][3]))
	draw_set_halign(fa_left)
} else if type == "TagListButton" {
	draw_set_colour(c_white)
	draw_text(x + 12, y + 24, global.tags[tag_id][obj_control.lang_setting])
	draw_sprite_stretched(spr_coas, tag_id + 1, (x + sprite_width) - 61, y+3, 58, 58)
	draw_text(x + 128+32, y + 24, get_opinion_name(tag_opinion_of(global.tags[tag_id][0], obj_control.player_tag))) // Opinon of Player
	draw_text(x + 292+32, y + 24, get_opinion_name(tag_opinion_of(obj_control.player_tag, global.tags[tag_id][0]))) // Player's opinion of
} else if type == "ArmyListButton" {
	draw_set_colour(c_white)
	draw_set_font(fnt_header_4)
	draw_text(x + 12, y + 24, + "Armée d'" + global.tags[tag_id][1] + " " + string(army_id + 1))
	draw_text(x + 200, y + 24, string(global.army[tag_id][army_id]))
	if obj_control.army_quality[tag_id] > 0 {
		draw_sprite(spr_icons, obj_control.army_quality[tag_id] + 24, (x + sprite_width) - 64, y + 4)
	}
	//draw_text(x + 128+32, y + 24, get_opinion_name(tag_opinion_of(global.tags[tag_id][0], obj_control.player_tag))) // Opinon of Player
	 
} else if type == "ArmyNewButton" {
	draw_set_colour(c_white)
	draw_set_font(fnt_header_3)
	draw_set_color(c_ltgrey)
	draw_text(x + 12, y + 24, "Click to Create New")
	draw_set_color(c_white)
	//draw_text(x + 128+32, y + 24, get_opinion_name(tag_opinion_of(global.tags[tag_id][0], obj_control.player_tag))) // Opinon of Player
	 
} else if type == "Exit Game" {
	draw_set_colour(c_white)
	draw_set_font(fnt_header_3)
	draw_text(x + 6, y + 12, "Exit Game")
} else if type == "Credits" {
	draw_set_colour(c_white)
	draw_set_font(fnt_header_3)
	draw_text(x + 6, y + 12, "Credits")
}



if position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id) {
	if type == "Liege" {
		draw_tooltip(x, y + 68, 256, 96, "King's Court", "View the King's current opinion\n" +
														 "of you, his alert level and\n" +
														 "other useful info about the\n" + 
														 "King's courtiers.")
	} else if type == "Military" {
		draw_tooltip(x - 64, y + 68, 256, 96, "Military", "View your military units and\n" + 
														  "armies, train new recruits,\n" +
													      "or compare your overall power\n" +
														  "against other vassals.")
	} else if type == "Economy" {
		draw_tooltip(x - 128, y + 68, 256, 72, "Economy", "View your economy and see total\n" + 
														  "expenditure or income, as well\n" +
													      "as the income of other vassals.")
	} else if type == "Diplomacy" {
		draw_tooltip(x - 192, y + 68, 256, 96, "Diplomacy", "Engage in relations with other\n" + 
														    "vassals such as fabricating\n" +
													        "land claims, war declaration or\n" +
														    "intrigue and alliances.")
	} else if type == "Profile" {
		draw_tooltip(x - 6, y + 192, 256, 72, global.tags[tag_fetch_id(tag_id)][obj_control.lang_setting], "See an overview of a nation,\n" + 
																					"its ruler, dynasty, obligations,\n" +
																					"rank, etc.\n")
	}  else if type == "ProfileSmall" {
		draw_tooltip(x + 132, y + 16, 256, 72, global.tags[tag_fetch_id(tag_id)][obj_control.lang_setting], "See an overview of a nation,\n" + 
																					 "its ruler, dynasty, obligations,\n" +
																					 "rank, etc.\n")
	} else if type == "Form Alliance" {
		draw_tooltip(x, y + 68, 256, 96, "Opinion Req: Cordial", "Negotiate an alliance with a\n" + 
																 "nation. They will agree to aid\n" +
																 "you in wars, provided you do\n" +
																 "the same for them.")
	} else if type == "Arrange Marriage" {
		draw_tooltip(x, y + 68, 256, 96, "Opinion Req: Neutral", "Arrange a political marriage\n" + 
																"between your two houses for an\n" +
																"opinion increase and prestige\n" +
																"gain.")
	} else if type == "Fabricate Claim" && obj_control.player_fabricating < 1 && !tag_has_claim(obj_control.player_tag, obj_control.tag_overview_id) {
		draw_tooltip(x, y + 68, 256, 96, "Prestige Cost: 10",	"Fabricate a claim on a province\n" + 
																"so that you may take their land\n" +
																"in a war. This will take three\n" +
																"turns to complete.")
	} else if type == "Fabricate Claim" && obj_control.player_fabricating > 0 && !tag_has_claim(obj_control.player_tag, obj_control.tag_overview_id) {
		draw_tooltip(x, y + 68, 256, 96, "Currently Fabricating","Fabricate a claim on a province\n" + 
																 "so that you may take their land\n" +
																 "in a war. This will take three\n" +
																 "turns to complete.")
	} else if type == "Fabricate Claim" && tag_has_claim(obj_control.player_tag, obj_control.tag_overview_id) {
		draw_tooltip(x, y + 68, 256, 96, "Already Have Claim",   "Fabricate a claim on a province\n" + 
																 "so that you may take their land\n" +
																 "in a war. This will take three\n" +
																 "turns to complete.")
	} else if type == "Improve Relations" {
		draw_tooltip(x, y + 68, 256, 96, "Increase Opinion",	"Improve their opinion of you,\n" + 
																"to open up new diplomatic\n" +
																"options or prevent them from\n" +
																"declaring war on you.")
	} else if type == "Declare War" && !tag_has_claim(obj_control.player_tag, obj_control.tag_overview_id) {
		draw_tooltip(x, y + 68, 256, 96, "Must Have Claim",		"Declare war on them! Take\n" + 
																"their land by force and\n" +
																"increase your own domain.\n")
	} else if type == "Declare War" && tag_has_claim(obj_control.player_tag, obj_control.tag_overview_id) {
		draw_tooltip(x, y + 68, 256, 96, "Claim On Them",		"Declare war on them! Take\n" + 
																"their land by force and\n" +
																"increase your own domain.\n")
	} else if type == "MilBudgetDN" {
		draw_tooltip(x, y + 64, 256, 96, "Low Military Budget",		"A 50% reduction to army upkeep\n" + 
																	"at the cost of 1 star quality\n" +
																	"of army loss.\n")
	} else if type == "MilBudgetNO" {
		draw_tooltip(x, y + 64, 292, 96, "Balanced Military Budget","Normal maintenance cost with no\n" + 
																	"effect on army quality.")
	} else if type == "MilBudgetUP" {
		draw_tooltip(x, y + 64, 256, 96, "High Military Budget",	"A 50% increase to army upkeep\n" + 
																	"in exchange for a +1 star army\n" +
																	"quality improvement.\n")
	} else if type == "Demonstrate Fealty (-5)" {
		draw_tooltip(x + sprite_width, y, 256, 72, "Spend Prestige",			"In exchange for a -5 reduction\n" + 
																				"of global Threat Level.")
	} else if type == "Pay Tribute (-10)" {
		draw_tooltip(x + sprite_width, y, 256, 72, "Spend Wealth",			"In exchange for a -10 reduction\n" + 
																			"of global Threat Level.")
	} else if type == "Offer Recruits (-15)" {
		draw_tooltip(x + sprite_width, y, 256, 72, "Spend Manpower",			"In exchange for a -15 reduction\n" + 
																				"of global Threat Level.")
	} else if type == "Grant Province (-25)" {
		draw_tooltip(x + sprite_width, y, 256, 72, "Province to King",		"In exchange for a -25 reduction\n" + 
																			"of global Threat Level.")
	} else if type == "Request Title (+1)" {
		draw_tooltip(x + sprite_width, y, 256, 72, "Gain Prestige",			"At the cost of a +1 increase\n" + 
																			"of global Threat Level.")
	} else if type == "Request Funds (+5)" {
		draw_tooltip(x + sprite_width, y, 256, 72, "Gain Wealth",			"At the cost of a +5 increase\n" + 
																			"of global Threat Level.")
	} else if type == "Levy Reserves (+5)" {
		draw_tooltip(x + sprite_width, y, 256, 72, "Gain Manpower",			"At the cost of a +5 increase\n" + 
																			"of global Threat Level.")
	} else if type == "Demand Province (+10)" {
		draw_tooltip(x + sprite_width, y, 256, 72, "Take King's Land",		"At the cost of a +10 increase\n" + 
																			"of global Threat Level.")
	} else if type == "ArmyUpButton" {
		draw_tooltip(x + sprite_width, y, 256, 72, "Recruit 100",			"Increase army size by 100,\n" + 
																			"costs 100 manpower & 25\n"   +
																		    "wealth.")
	} else if type == "ArmyDownButton" {
		draw_tooltip(x + sprite_width, y, 256, 72, "Disband 100",			"Decrease army size by 100,\n" + 
																			"refunds 100 manpower & 25\n"   +
																		    "wealth.")
	} else if type == "ArmyNewButton" {
		draw_tooltip(x, y + sprite_height, 256, 72, "Create New Army",		"Spend 100 manpower and 25\n" + 
																			"wealth to create a new army\n"   +
																		    "in a chosen province.")
	} else if type == "Intrigue" {
		draw_tooltip(x+ sprite_width, y, 256, 96, "Intrigue",			"Perform acts of espionage such\n" + 
																"as poisoning enemy armies, or\n" +
																"raiding their lands. Costs wealth\n" +
																"and has a variable success chance.")
	} else if type == "Sabotage Armies" {
		draw_tooltip(x + sprite_width, y, 256, 96, "Damage Enemy Army",	"Cooldown of 3 turns. Randomly\n" + 
																		"damage an enemy army by 25%.\n" +
																		"Has default success rate of 40%.")
	} else if type == "Raid Province" {
		draw_tooltip(x+ sprite_width, y, 256, 96, "Lower Development",	"Lower development in an enemy \n" + 
																		"province to damage their local\n" +
																		"economy. Cooldown of 3 turns.")
	} else if type == "Infiltrate Court" {
		draw_tooltip(x+ sprite_width, y-64, 256, 96, "Reveal Enemy Armies",	"3 turn cooldown. Expose all\n" + 
																			"enemy army positions. Base\n" +
																			"success rate of 60%.")
	} else if type == "EVT_Option" {
		switch e_option {
			case "Now we strike!":
				draw_tooltip(x, y + 64, 256, 32, "Success!", "Gain 5 prestige")
				break
			case "Let their cities burn!":
				draw_tooltip(x, y + 64, 256, 32, "Success!", "Gain 5 prestige")
				break
			case "Their secrets laid bare":
				draw_tooltip(x, y + 64, 256, 32, "Success!", "Gain 5 prestige")
				break
			case "A shame":
				draw_tooltip(x, y + 64, 256, 32, "Failure!", "Lose 5 prestige")
				break
			default:
				break
		}
	}
	
}
