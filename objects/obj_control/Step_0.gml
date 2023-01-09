/// @description Drag to move camera

if mouse_check_button_pressed(mb_middle) {
	drag_x = mouse_x
	drag_y = mouse_y
}

if keyboard_check_pressed(vk_escape) {
	if global.pause {
		global.pause = false
		with obj_button {
			if type == "LangSetting" {
				instance_destroy(self)
			}
		}
	} else {
		global.pause = true
		with instance_create_depth(896, 540, -1003, obj_button) {
			type = "LangSetting"
			sprite_index = spr_square_button
			image_xscale = 2
			image_yscale = 2
			image_speed = 0
			image_index = 0
		}
	}
}


if mouse_check_button(mb_middle) {
	// Drag the camera
	camera_set_view_pos(view_camera, drag_x - (mouse_x - camera_get_view_x(view_camera)), drag_y - (mouse_y - camera_get_view_y(view_camera)))
	// Prevent leaving view
	camera_set_view_pos(view_camera, max(0, min(camera_get_view_x(view_camera), room_width - camera_get_view_width(view_camera))), max(0, min(camera_get_view_y(view_camera), room_height - camera_get_view_height(view_camera))))
}

if mouse_check_button(mb_right) {
	province_overview_id = -1
	tag_overview_id = -1
	main_tab = -1
	lock_ui = false
	with obj_button {
		if type == "Build Units" || type == "Construct Slot" || type == "ProfileSmall" || diplo_action {
			instance_destroy(self)
		}
	}
}


if mouse_wheel_up() {
	camera_set_view_size(view_camera, camera_get_view_width(view_camera) - 64, camera_get_view_height(view_camera) - 36)
	zoom += 1
}
if camera_get_view_width(view_camera) < room_width && camera_get_view_height(view_camera) < room_height {
	if mouse_wheel_down() {
		camera_set_view_size(view_camera, camera_get_view_width(view_camera) + 64, camera_get_view_height(view_camera) + 36)
		zoom -= 1
	}
}

if army_overview_id == -1 {
	selected_army = noone
}

///// AI Turn Manager
if turn_stage == "AI" {
	//repeat(1) {
	//	for (var i = 0; i < array_length(global.tags); i ++) {
	//		// Goes through every tag and checks what they are capable of doing on their turn
			
	//		// 1: Do I have an Alliance?
			
	//		// 2: Do I have a marriage with my allies?
			
	//		// 3a: Are any un-allied neighbours weaker than me?
	//		// 3b: Do I have a claim on them?
	//		// 3c: Are we already at War?
			
	//		// 4a: Can I afford to build more armies?
	//		// 4b: Am I already at my force limit? (10 * Manpower from Development)
			
	//		// 5a: Can I afford to build more buildings?
	//		// 5b: Do I need manpower or income? (determines what type they build)
			
	//		// 6a: Does the King like me?
	//		// 6b: Do I like the King? (If so, improve relations. If not, plot)
			
	//		// 7a: Am I at war?
	//		// 7b: Can I move my armies? Are they on their borders?
	//		// 7c: Am I weaker (defend), or am I stronger (attack)
	//	}
	//}
	
	obj_army.moves_remaining = 2
	economy_update()
	
	// Update the Date
	// Seasons: 0 - Spring, 1 - Summer, 2 - Autumn, 3 - Winter
	if obj_control.date[0] == "January"			{ obj_control.date[0] = "February"	}
	else if obj_control.date[0] == "February"	{ obj_control.date[0] = "March"			season = 0 }
	else if obj_control.date[0] == "March"		{ obj_control.date[0] = "April"		}
	else if obj_control.date[0] == "April"		{ obj_control.date[0] = "May"		}
	else if obj_control.date[0] == "May"		{ obj_control.date[0] = "June"			season = 1 }
	else if obj_control.date[0] == "June"		{ obj_control.date[0] = "July"		}
	else if obj_control.date[0] == "July"		{ obj_control.date[0] = "August"	}
	else if obj_control.date[0] == "August"		{ obj_control.date[0] = "September"		season = 2 }
	else if obj_control.date[0] == "September"	{ obj_control.date[0] = "October"	}
	else if obj_control.date[0] == "October"	{ obj_control.date[0] = "November"	}
	else if obj_control.date[0] == "November"	{ obj_control.date[0] = "December"	}
	else if obj_control.date[0] == "December"	{ obj_control.date[0] = "January" 		season = 3			obj_control.date[1] += 1 }
	
	if player_fabricating > 0 && player_fabricating < 3 { player_fabricating += 1 }
	if player_fabricating >= 3 { tag_add_claim(player_tag, player_fabricate_target) player_fabricate_target = noone player_fabricating = 0 }
	
	diplo_moves = 3
	turn_no += 1
	turn_stage = "Player"
}