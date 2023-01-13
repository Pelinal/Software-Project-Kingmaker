/// @description Draw Self

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
} else if type == "LangSetting" {
	draw_set_color(c_black)
	draw_text(x + 20, y + 54, "Language")
	draw_set_color(c_white)
} else if type == "Dropdown" {
	draw_set_colour(c_grey)
	draw_text(x + 96, y + 24, dropdown_type)
} else if diplo_action == true || type == "End Turn" {
	draw_set_colour(c_grey)
	if type == "Declare War" && tag_is_enemy(obj_control.player_tag, obj_control.tag_overview_id) {
		draw_text(x + 12, y + 24, "Offer Peace")
	} else if type == "Declare War" && !tag_is_enemy(obj_control.player_tag, obj_control.tag_overview_id) {
		draw_text(x + 12, y + 24, "Delcare War")
	} else if type == "Form Alliance" && tag_is_ally(obj_control.player_tag, obj_control.tag_overview_id) {
		draw_text(x + 12, y + 24, "Break Alliance")
	} else {
		draw_text(x + 12, y + 24, type)
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
		draw_tooltip(x, y + 68, 256, 96, "Opinion Required: 25", "Negotiate an alliance with a\n" + 
																 "nation. They will agree to aid\n" +
																 "you in wars, provided you do\n" +
																 "the same for them.")
	} else if type == "Arrange Marriage" {
		draw_tooltip(x, y + 68, 256, 96, "Opinion Required: 0", "Arrange a political marriage\n" + 
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
		draw_tooltip(x, y + 68, 256, 96, "Once Per Turn",		"Improve their opinion of you,\n" + 
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
	}
}

 