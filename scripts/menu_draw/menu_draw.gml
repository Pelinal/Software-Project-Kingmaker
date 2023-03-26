// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_menu(x_coord, y_coord, x_size, y_size){
	instance_create_depth(x_coord, y_coord, -1000, obj_prevent_clickthrough)
	obj_prevent_clickthrough.image_xscale = x_size * 32
	obj_prevent_clickthrough.image_yscale = y_size * 32
	
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

function draw_tooltip(x_coord, y_coord, length, height, text, desc=noone) {
	draw_set_colour(c_white)
	draw_sprite_stretched_ext(spr_ui_box, 4, x_coord, y_coord, length, 32, c_black, 0.7)
	draw_set_alpha(1)
	draw_set_font(fnt_header)
	draw_set_halign(fa_center)
	draw_text(x_coord + (length / 2), y_coord + 7, text)
	draw_set_halign(fa_left)
	
	if desc != noone {
		draw_set_font(fnt_tooltip)
		draw_sprite_stretched_ext(spr_ui_box, 4, x_coord, y_coord + 32, length, height, c_dkgrey, 0.7)
		draw_text(x_coord + 4, y_coord + 32, desc)
	}
}

function get_opinion_name(opinion_value) {
	/// Takes an opinion integer as input and returns the corresponding string
	
	if opinion_value < -50 {
		return "Hostile"
	} else if opinion_value >= -50 && opinion_value < 0 {
		return "Suspicious"
	} else if opinion_value == 0 {
		return "Neutral"
	} else if opinion_value > 0 && opinion_value < 50 {
		return "Cordial"
	} else if opinion_value > 50 {
		return "Friendly"
	} else {
		return "Neutral"
	}
}