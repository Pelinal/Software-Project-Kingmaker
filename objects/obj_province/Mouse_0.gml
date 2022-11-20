/// @description Show Panel

obj_control.province_overview_id = prov_id
instance_destroy(obj_button)

if map_province_owner(prov_id, "ORL") {
	with instance_create_depth(320, 824, -103) {
		sprite_index = spr_tall_button
		image_index = 1
		type = "Build Units"
	}
}

if keyboard_check(vk_shift) {
	global.provinces[prov_id][6] = "ORL"
}