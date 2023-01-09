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
draw_text(212, 48, "Duke Gaston")
draw_text(212, 80, "Prestige: " + string(global.economy[tag_fetch_id(player_tag)][8]) + 
					"  Wealth: " + string(global.economy[tag_fetch_id(player_tag)][1]) + 
					"  Manpower: " + string(global.economy[tag_fetch_id(player_tag)][5]*100))

// Draw Top Right HUD
draw_set_font(fnt_header)
draw_set_colour(c_grey)
draw_menu(1408, 0, 16, 4)
draw_text(1428, 16, string(date[0]) + ", " + string(date[1]) + " AD")
draw_text(1428, 48, "Alert Level: None")
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
	
	
	
	//draw_sprite(spr_bottom_panel, 0, 0, 536)
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
		draw_text(27, 596, "Manpower: " + string(global.economy[tag_fetch_id(tag_overview_id)][5]*100))
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