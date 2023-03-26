
/// @description Check for hover mouse

//debug
//draw_self()

if position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), id) {
	// Check for Mouse Enter
	
	if type == "TT_Prestige" {
		draw_tooltip(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 256, 72, "Prestige",
					 "Represents a nation's politcal\nstanding, used as a secondary\ncurrency")
	} else if type == "TT_Wealth" {
		draw_tooltip(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 256, 72, "Wealth",
					 "The nation's treasury, the\nprimary currency")
	} else if type == "TT_Manpower" {
		draw_tooltip(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 256, 72, "Manpower",
					 "The pool of reserve troops,\nused as a currency for\nbuilding armies")
	} else if type == "TT_Threat" {
		draw_tooltip(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 256, 96, "Threat Level",
					 "The King's awareness of\nvassals' rebellious actions.\nHigher threat can have major\ngameplay effects")
	} else if type == "TT_Season" {
		draw_tooltip(device_mouse_x_to_gui(0)-256, device_mouse_y_to_gui(0), 256, 72, "Seasons",
					 "The current season affects\nlosses in combat due to weather")
	} else if type == "TT_DiploMove" {
		draw_tooltip(device_mouse_x_to_gui(0)-256, device_mouse_y_to_gui(0), 256, 96, "Diplomacy Moves",
					 "The number of remaining\ndiplomatic actions which can\nbe performed this turn")
	} else {
		
	}
	
	if mouse_check_button_pressed(mb_left){
		// Check for Mouse Press
	}
	
}

