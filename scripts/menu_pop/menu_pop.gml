// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function menu_pop(type) {
	with obj_control {
		lock_ui = true
		main_tab = type
		province_overview_id = -1
	}
	with obj_button {
		if type == "Build Units" || type == "Construct Slot" || type == "ProfileSmall" || type == "Dropdown" {
			instance_destroy(self)
		}
	}
}