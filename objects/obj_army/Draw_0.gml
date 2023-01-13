/// @description Draw Self

draw_self()

if obj_control.zoom >= 15 {
	image_xscale = 0.5
	image_yscale = 0.5
	draw_set_font(fnt_map_sm)
	image_alpha = 0.75
	draw_text(x-14, y-8, string(global.army[tag_id][army_id]))
} else if obj_control.zoom <= 5 {
	image_alpha = 0
} else {
	image_alpha = 0.75
	image_xscale = 1
	image_yscale = 1
	draw_set_font(fnt_header)
	draw_text(x-24, y-12, string(global.army[tag_id][army_id]))
}

