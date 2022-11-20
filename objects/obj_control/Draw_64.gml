/// @description debug


//if province_popup_id != -1 {
//	draw_set_color(c_black)
//	draw_set_alpha(1)
//	draw_set_font(arial_big)
//	draw_set_halign(fa_right)
//	draw_text(1872, 984, global.provinces[province_popup_id][0])
//	draw_set_halign(fa_left)
//}

draw_text( 128, 128, string(zoom))

if province_overview_id != -1 {
	draw_menu(0, 792, 28, 9)
	draw_header(64, 792, 192, global.provinces[province_overview_id][0])
	
	draw_sprite(spr_coas, tag_fetch_id(global.provinces[province_overview_id][6]) + 1, 756 - 24, 804 + 24)
	draw_sprite(spr_coas, 0, 756 - 24, 804 + 24)
	draw_text(752, 804, "Owned By")
	
	// Draw Province Info
	draw_text(32, 856, "Capital: " + string(global.provinces[province_overview_id][5]))
	draw_text(32, 888, "Tax: " + string(global.provinces[province_overview_id][1]))
	draw_text(32, 920, "Manpower: " + string(global.provinces[province_overview_id][2]))
	draw_text(32, 952, "Production: " + string(global.provinces[province_overview_id][3]))
	draw_text(32, 984, "Trade Good: " + string(global.trade_goods[global.provinces[province_overview_id][4]][0]))
	
	
	
	//draw_sprite(spr_bottom_panel, 0, 0, 536)
}
