/// @description Insert description here
// You can write your code in this editor

if position_meeting(mouse_x, mouse_y, id) && !position_meeting(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), obj_button)  && !obj_control.lock_ui && !position_meeting(mouse_x, mouse_y, obj_army) {
	if tag != "PAP" {	
		draw_tooltip(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 256, 24, global.provinces[prov_id][0], "Owned by: " + global.tags[tag_fetch_id(tag)][4] + " of " + global.tags[tag_fetch_id(tag)][obj_control.lang_setting] + "ID: " + string(prov_id))
	} else {
		draw_tooltip(device_mouse_x_to_gui(0), device_mouse_y_to_gui(0), 256, 24, global.provinces[prov_id][0], "Owned by: " + "The " + global.tags[tag_fetch_id(tag)][obj_control.lang_setting] + "ID: " + string(prov_id))
	}
}