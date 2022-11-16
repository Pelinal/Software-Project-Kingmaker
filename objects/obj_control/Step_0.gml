/// @description Drag to move camera

if mouse_check_button_pressed(mb_middle) {
	drag_x = mouse_x
	drag_y = mouse_y
}


if mouse_check_button(mb_middle) {
	// Drag the camera
	camera_set_view_pos(view_camera, drag_x - (mouse_x - camera_get_view_x(view_camera)), drag_y - (mouse_y - camera_get_view_y(view_camera)))
	// Prevent leaving view
	camera_set_view_pos(view_camera, max(0, min(camera_get_view_x(view_camera), room_width - camera_get_view_width(view_camera))), max(0, min(camera_get_view_y(view_camera), room_height - camera_get_view_height(view_camera))))
}

if mouse_check_button(mb_right) {
	province_overview_id = -1
}


if mouse_wheel_up() {
	camera_set_view_size(view_camera, camera_get_view_width(view_camera) - 64, camera_get_view_height(view_camera) - 36)
}
if camera_get_view_width(view_camera) < room_width && camera_get_view_height(view_camera) < room_height {
	if mouse_wheel_down() {
		camera_set_view_size(view_camera, camera_get_view_width(view_camera) + 64, camera_get_view_height(view_camera) + 36)
	}
}