/// @description debug


//if province_popup_id != -1 {
//	draw_set_color(c_black)
//	draw_set_alpha(1)
//	draw_set_font(arial_big)
//	draw_set_halign(fa_right)
//	draw_text(1872, 984, global.provinces[province_popup_id][0])
//	draw_set_halign(fa_left)
//}

//draw_text( 128, 128, string(zoom))


// Draw Top Left HUD
draw_set_alpha(1)
draw_set_colour(c_white)
draw_menu(0, 0, 6, 6)
draw_sprite_ext(spr_coas, tag_fetch_id(player_tag) + 1, 6, 6, 1.4, 1.4, 0, c_white, 1)
draw_sprite_ext(spr_coas, 0, 6, 6, 1.4, 1.4, 0, c_white, 1)

draw_set_font(fnt_header)
draw_set_colour(c_grey)
draw_menu(192, 0, 16, 4)
draw_text(212, 16, global.tags[tag_fetch_id(player_tag)][4] + " of " + global.tags[tag_fetch_id(player_tag)][lang_setting])
draw_text(212, 48, global.tags[tag_fetch_id(player_tag)][5] + " " + global.chars[global.tags[tag_fetch_id(player_tag)][6]][0])
draw_text(212, 80, "Prestige: " + string(global.economy[tag_fetch_id(player_tag)][8]) + 
					"  Wealth: " + string(global.economy[tag_fetch_id(player_tag)][1]) + 
					"  Manpower: " + string(round(global.economy[tag_fetch_id(player_tag)][5]*100)))

// Draw Top Right HUD
draw_set_font(fnt_header)
draw_set_colour(c_grey)
draw_menu(1408, 0, 16, 4)
draw_text(1428, 16, string(date[0]) + ", " + string(date[1]) + " AD")
draw_text(1428, 48, "Threat: " + threat_level_name)
draw_text(1428, 80, "Turn: " + string(turn_no))
draw_text(1620, 80, "Diplo Moves: " + string(diplo_moves))
draw_set_colour(c_white)
draw_sprite(spr_seasons, season, 1818, 22)


if province_overview_id != -1 && main_tab == -1 {
	draw_menu(0, 792, 28, 9)
	draw_header(64, 792, 192, global.provinces[province_overview_id][0])
	
	draw_sprite(spr_coas, tag_fetch_id(global.provinces[province_overview_id][6]) + 1, 732, 828)
	
	draw_sprite(spr_coas, 0, 732, 828)
	draw_text(752, 804, "Owned By")
	
	// Draw Province Info
	draw_text(32, 856, "Capital: " + string(global.provinces[province_overview_id][5]))
	draw_text(32, 888, "Tax: " + string(global.provinces[province_overview_id][1]))
	draw_text(32, 920, "Manpower: " + string(global.provinces[province_overview_id][2]))
	draw_text(32, 952, "Production: " + string(global.provinces[province_overview_id][3]))
	draw_text(32, 984, "Trade Good: " + string(global.trade_goods[global.provinces[province_overview_id][4]][0]))
	
	if build_select { 
		draw_menu(896, 792, 11, 9)
		
		draw_set_colour(c_grey)
		draw_header(896, 792-24, 352, "Name              Effect  Cost")
	}
	
	//draw_sprite(spr_bottom_panel, 0, 0, 536)
}

// Prov Select
if prov_select {
	draw_menu(704, 200, 11, 27)
	
	draw_set_colour(c_grey)
	draw_set_font(fnt_title)
	draw_header(760, 200, 240, "Select Province")
	draw_set_font(fnt_header_2)
	draw_text(738, 224, "Name")
	draw_set_halign(fa_right)
	draw_text(1022, 224, "Dev")
	draw_set_halign(fa_left)
}
if main_tab != -1 {
	draw_menu(0, 200, 22, 27)
	
	if main_tab == "Profile" {
		// DIVIDER 1: OVERVIEW
		draw_set_colour(c_grey)
		draw_set_font(fnt_title)
		draw_text(24, 232, global.tags[tag_fetch_id(tag_overview_id)][lang_setting]) // Name
		draw_set_font(fnt_map_lg)
		draw_text(27, 290, global.tags[tag_fetch_id(tag_overview_id)][4]) // Rank
		draw_set_font(fnt_header_2)
		draw_sprite_ext(spr_coas, tag_fetch_id(tag_overview_id) + 1, 568, 218, 0.85, 0.85, 0, c_white, 1)
		draw_sprite_ext(spr_coas, 0, 568, 218, 0.85, 0.85, 0, c_white, 1)
		draw_line_width_color(24, 334, 676, 334, 3, c_gray, c_gray)
		
		// DIVIDER 2: RULER
		draw_text(27, 338, "Ruler")
		draw_sprite(spr_portraits, global.tags[tag_fetch_id(tag_overview_id)][6], 24, 368)
		draw_sprite(spr_coas, 0, 24, 368)
		if string_length(global.tags[tag_fetch_id(tag_overview_id)][5] + " " + global.chars[global.tags[tag_fetch_id(tag_overview_id)][6]][0] + " " + global.chars[global.tags[tag_fetch_id(tag_overview_id)][6]][1]) > 39 {
			draw_set_font(fnt_header_3)
		}
		draw_text(160, 368, global.tags[tag_fetch_id(tag_overview_id)][5] + " " + global.chars[global.tags[tag_fetch_id(tag_overview_id)][6]][0] + " " + global.chars[global.tags[tag_fetch_id(tag_overview_id)][6]][1])
		draw_set_font(fnt_header_2)
		draw_text(160, 410, "House of " + global.chars[global.tags[tag_fetch_id(tag_overview_id)][6]][2])
		draw_text(160, 450, "Traits: " + global.traits[global.chars[global.tags[tag_fetch_id(tag_overview_id)][6]][3]][0] + ", " + global.traits[global.chars[global.tags[tag_fetch_id(tag_overview_id)][6]][4]][0] + ", " + global.traits[global.chars[global.tags[tag_fetch_id(tag_overview_id)][6]][5]][0])
		draw_line_width_color(24, 510, 676, 510, 3, c_gray, c_gray)
	
		// DIVIDER 3: STATS
		draw_text(27, 514, "Stats")
		draw_text(27, 544, "Wealth: " + string(global.economy[tag_fetch_id(tag_overview_id)][1]))
		draw_text(27, 570, "Prestige: " + string(global.economy[tag_fetch_id(tag_overview_id)][8]))
		draw_text(27, 596, "Manpower: " + string(round(global.economy[tag_fetch_id(tag_overview_id)][5]*100)))
		draw_text(27+323, 544, "Development: " + string(tag_total_development(tag_overview_id)))
		draw_text(27+323, 570, "Opinion of You: " + string(global.opinions[tag_fetch_id(tag_overview_id)][tag_fetch_id(player_tag)]))
		draw_text(27+323, 596, "Military Size: " + string(military_get_tag_total(tag_overview_id)))
		draw_line_width_color(24, 632, 676, 632, 3, c_gray, c_gray)
		
		// DIVIDER 4: DIPLOMACY
		draw_text(27, 636, "Diplomatic Actions")
		draw_text(27, 880, "Allies: " + tag_get_allies(tag_overview_id))
		draw_text(27, 904, "Enemies: " + tag_get_enemies(tag_overview_id))
		draw_text(27, 928, "Claims: " + tag_get_claims(tag_overview_id))
		// drop downs and buttons created in menu_pop()
	} else if main_tab == "Liege" {
		// KING'S COURT 
		// DIV 1: THE KING
		draw_set_colour(c_grey)
		
		draw_set_halign(fa_center)
		draw_set_font(fnt_map_lg)
		draw_text(352, 232,"King's Court") // Tag 7 = France
		draw_set_font(fnt_header_2)
		draw_text(352, 272, global.tags[7][5] + " " + global.chars[global.tags[7][6]][0] + " " + global.chars[global.tags[7][6]][1])
		draw_set_font(fnt_header_2)
		draw_set_halign(fa_left)
		draw_rectangle(224, 312, 479, 567, true)
		draw_sprite_stretched(spr_portraits, global.tags[7][6], 224, 312, 256, 256)
		draw_set_halign(fa_center)
		draw_set_font(fnt_header_3)
		draw_set_halign(fa_left)
		draw_line_width_color(24, 582, 676, 582, 3, c_gray, c_gray)
		// DIV 2: OPINION & THREAT
		draw_set_font(fnt_header_2)
		draw_text(27, 586,"Opinion of You: " + string(global.opinions[7][tag_fetch_id(player_tag)]))
		draw_set_halign(fa_right)
		draw_text(672, 586,"Threat Level: " + threat_level_name + " (" + string(threat_level) + ")" )
		draw_set_halign(fa_left)
		draw_line_width_color(24, 618, 676, 618, 3, c_gray, c_gray)
		// DIV3 ACTIONS
		draw_line_width_color(352, 618, 352, 1048, 3, c_gray, c_gray)
		draw_text(27, 622, "Concessions")
		draw_set_halign(fa_right)
		draw_text(672, 622, "Demands" )
		draw_set_halign(fa_left)
	} else if main_tab == "Economy" {
		// DIV 1: Income
		draw_set_colour(c_grey)
		draw_set_font(fnt_map_lg)
		draw_text(22, 232,"Economy")
		draw_set_font(fnt_header_2)
		draw_line_width_color(352, 216+48, 352, 378+48, 3, c_gray, c_gray)
		draw_line_width_color(21, 344+48, 679, 344+48, 3, c_gray, c_gray)
		draw_line_width_color(21, 378+48, 679, 378+48, 3, c_gray, c_gray)
		draw_text(22, 232+48, "Income")
		draw_set_halign(fa_right)
		draw_text(672, 232+48, "Expense" )
		draw_set_halign(fa_left)
		draw_set_font(fnt_header_3)
		draw_text(22, 264+48, "Tax")
		draw_text(22, 292+48, "Production")
		draw_text(360, 264+48, "Buildings")
		draw_text(360, 292+48, "Armies")
		draw_text(360, 320+48, "Liege")
		draw_text(360, 352+48, "Total Expense")
		draw_text(22, 352+48, "Total Income")
		
		draw_set_halign(fa_right)
		draw_text(344, 264+48, string(tax_income))
		draw_text(344, 292+48, pro_income)
		draw_text(344, 352+48, global.economy[tag_fetch_id(player_tag)][2])
		
		draw_text(672, 264+48, -bld_expense)
		draw_text(672, 292+48, -arm_expense)
		draw_text(672, 320+48, -global.economy[tag_fetch_id(player_tag)][2] * 0.1)
		draw_text(672, 352+48, -global.economy[tag_fetch_id(player_tag)][3])
		draw_text(672, 384+48, pre_profit)
		draw_set_halign(fa_left)
		draw_set_font(fnt_header_2)
		draw_text(22, 384+48, "Sum Total")
		draw_line_width_color(21, 410+48, 679, 410+48, 3, c_gray, c_gray)
		
		// DIV 2: Trade Goods
		draw_text(22, 418+48, "Trade Goods")
		draw_set_font(fnt_header_3)
		draw_text(22, 448+48, "Name       Value")
		
		draw_text(22, 472+48, global.trade_goods[0][0] + "       " + string(global.trade_goods[0][1]))
		draw_text(22, 496+48, global.trade_goods[1][0] + "      " + string(global.trade_goods[1][1]))
		draw_text(22, 516+48, global.trade_goods[2][0] + "      " + string(global.trade_goods[2][1]))
		draw_text(22, 540+48, global.trade_goods[3][0] + "  " + string(global.trade_goods[3][1]))
		draw_text(22, 564+48, global.trade_goods[4][0] + "       " + string(global.trade_goods[4][1]))
		draw_text(22, 588+48, global.trade_goods[5][0] + "     " + string(global.trade_goods[5][1]))
		draw_text(22, 612+48, global.trade_goods[6][0] + "       " + string(global.trade_goods[6][1]))
		draw_text(22, 636+48, global.trade_goods[7][0] + "     " + string(global.trade_goods[7][1]))
		draw_text(22, 660+48, global.trade_goods[8][0] + "       " + string(global.trade_goods[8][1]))
		draw_text(22, 684+48, global.trade_goods[9][0] + "      " + string(global.trade_goods[9][1]))
		draw_text(22, 708+48, global.trade_goods[10][0] + "       " + string(global.trade_goods[10][1]))
		draw_text(22, 732+48, global.trade_goods[11][0] + "       " + string(global.trade_goods[11][1]))
		
		draw_line_width_color(21, 756+48, 679, 756+48, 3, c_gray, c_gray)
		
		// DIV 3: Budget actions
		draw_set_font(fnt_header_2)
		draw_text(22, 760+48, "Budgeting")
	}
}

//if army_overview_id != -1 {
//	draw_menu(1376, 324, 16, 13)
//	draw_header(1408, 324, 218, global.army[army_overview_id][0])
//	draw_set_font(fnt_map_lg) 
//	draw_set_color(c_grey)
//	draw_text(1404, 356, "Army Overview")
//	draw_set_font(fnt_header)
//	//if global.army[army_overview_id][1] != noone {
//	//	draw_text(1404, 388, "General: " + global.general[global.army[army_overview_id][1]][0])
//	//} else { 
//	//	draw_text(1404, 388, "General: NONE")
//	//}
	
//	draw_text(1404, 388, "General: NONE")
	
//	//draw_line_width_color(1400, 418, 1876, 418, 3, c_gray, c_gray)
//}

if global.pause {
	draw_menu(832, 476, 8, 8)
	draw_header(928, 476, 64, "Pause")
}