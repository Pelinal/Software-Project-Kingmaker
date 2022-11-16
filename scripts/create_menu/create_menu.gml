// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_menu(x_coord, y_coord, x_size, y_size){
	for (i = 0; i < y_size; i ++) {
		x_margin = x_coord
		y_margin = y_coord + (32 * i)
		for (j = 0; j < x_size; j ++) {
			x_margin = x_coord + (32 * j)
			
			if y_margin == y_coord {
				// Check for top row
				if x_margin == x_coord {
					spr_index = 0
				} else if x_margin == x_coord + (32 * x_size) - 32 {
					spr_index = 2
				} else {
					spr_index = 1
				}
			} else if y_margin == y_coord + (32 * y_size) - 32 {
				// Check for bottom row
				if x_margin == x_coord {
					spr_index = 6
				} else if x_margin == x_coord + (32 * x_size) - 32 {
					spr_index = 8
				} else {
					spr_index = 7
				}
			} else {
				if x_margin == x_coord {
					spr_index = 3
				} else if x_margin == x_coord + (32 * x_size) - 32 {
					spr_index = 5
				} else {
					spr_index = 4
				}
			}
			
			draw_sprite(spr_ui_box, spr_index, x_margin, y_margin)
		}
	}
}

function draw_header(x_coord, y_coord, length, text) {
	draw_set_colour(c_grey)
	draw_sprite_stretched(spr_ui_box, 4, x_coord, y_coord, length, 32)
	draw_set_alpha(1)
	draw_set_font(fnt_header)
	draw_set_halign(fa_center)
	draw_text(x_coord + (length / 2), y_coord + 7, text)
	draw_set_halign(fa_left)
}