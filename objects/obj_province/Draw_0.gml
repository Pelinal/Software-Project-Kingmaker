/// @description Draw self

//draw_self()
if position_meeting(device_mouse_x(0), device_mouse_y(0), id) {
	depth = -1
	draw_outline(2, c_black, 1)
} else {
	depth = 0
	draw_outline(1, image_colour - make_color_rgb(20,20,20), 1)
}

draw_sprite_ext(sprite_index, 0, x, y, image_xscale, image_yscale, 0, image_colour, image_alpha)