// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function draw_outline(thickness, colour, alpha){
	draw_sprite_ext(sprite_index,				//sprite
					0,							//sub img
					x + thickness,		//x pos
					y - thickness,		//y pos
					image_xscale, image_yscale,	//scale
					image_angle,				//angle
					colour,					//col
					alpha);				//alpha
				
	draw_sprite_ext(sprite_index,				//sprite
					0,							//sub img
					x + thickness ,		//x pos
					y + thickness,		//y pos
					image_xscale, image_yscale,	//scale
					image_angle,				//angle
					colour,					//col
					alpha);				//alpha
				
	draw_sprite_ext(sprite_index,				//sprite
					0,							//sub img
					x - thickness,		//x pos
					y + thickness,		//y pos
					image_xscale, image_yscale,	//scale
					image_angle,				//angle
					colour,					//col
					alpha);				//alpha
				
	draw_sprite_ext(sprite_index,				//sprite
					0,							//sub img
					x - thickness,		//x pos
					y - thickness,		//y pos
					image_xscale, image_yscale,	//scale
					image_angle,				//angle
					colour,					//col
					alpha);				//alpha
				
				
	draw_sprite_ext(sprite_index,				//sprite
					0,							//sub img
					x + thickness,		//x pos
					y,		//y pos
					image_xscale, image_yscale,	//scale
					image_angle,				//angle
					colour,					//col
					alpha);				//alpha
				
	draw_sprite_ext(sprite_index,				//sprite
					0,							//sub img
					x,		//x pos
					y + thickness,		//y pos
					image_xscale, image_yscale,	//scale
					image_angle,				//angle
					colour,					//col
					alpha);				//alpha
				
	draw_sprite_ext(sprite_index,				//sprite
					0,							//sub img
					x - thickness,		//x pos
					y,		//y pos
					image_xscale, image_yscale,	//scale
					image_angle,				//angle
					colour,					//col
					alpha);				//alpha
				
	draw_sprite_ext(sprite_index,				//sprite
					0,							//sub img
					x,		//x pos
					y - thickness,		//y pos
					image_xscale, image_yscale,	//scale
					image_angle,				//angle
					colour,					//col
					alpha);				//alpha
}

function draw_map_text(zoom){
	// Goes through every tag, finds all its provinces and draws map text
	
	if zoom >= 15 {
		// Draw Province Names
		
		draw_set_color(c_white)
		draw_set_alpha(1)
		
		for (i = 0; i < instance_number(obj_province); i ++) {
			
			draw_set_halign(fa_center)
			draw_set_font(fnt_map_sm)
			draw_text_transformed(instance_find(obj_province, i).x + instance_find(obj_province, i).x_offset, instance_find(obj_province, i).y + instance_find(obj_province, i).y_offset, global.provinces[instance_find(obj_province, i).prov_id][0], 1, 1, instance_find(obj_province, i).angle)
			draw_set_halign(fa_left)
		}
	} else {
		// Draw Country Names
		leftmost_x = 0
		leftmost_y = 0
		rightmost_x = 0
		rightmost_y = 0
		
		draw_set_font(fnt_map_lg)
		draw_set_color(c_white)
		draw_set_alpha(1)
		
		for (i = 0; i < array_length(global.tags); i ++) {
			leftmost_x = 0
			rightmost_x = 0
			upmost_y = 0
			downmost_y = 0
			
			upmost_x = 0
			downmost_x = 0
			prov_count = 0
			prov_current = 0
			
			for (j = 0; j < instance_number(obj_province); j ++) {
				if instance_find(obj_province, j).tag == global.tags[i][0] {
					current_x = instance_find(obj_province, j).x
					current_y = instance_find(obj_province, j).y
					prov_count ++
					prov_current = j
					
					// Find east/west points
					if leftmost_x == 0 {
						leftmost_x = current_x - (instance_find(obj_province, j).sprite_width/2)
						rightmost_x = current_x + (instance_find(obj_province, j).sprite_width/2)
					} if current_x - (instance_find(obj_province, j).sprite_width/2) < leftmost_x {
						leftmost_x = current_x - (instance_find(obj_province, j).sprite_width/2)
					} if current_x + (instance_find(obj_province, j).sprite_width/2) > rightmost_x {
						rightmost_x = current_x + (instance_find(obj_province, j).sprite_width/2)
					}
					
					// Find north/south points
					if upmost_y == 0 {
						upmost_y = current_y - (instance_find(obj_province, j).sprite_height/2)
						downmost_y = current_y + (instance_find(obj_province, j).sprite_height/2)
						upmost_x = current_x
						downmost_x = current_x
					} if current_y - (instance_find(obj_province, j).sprite_height/2) < upmost_y {
						upmost_y = current_y - (instance_find(obj_province, j).sprite_height/2)
						upmost_x = current_x
					} if current_y + (instance_find(obj_province, j).sprite_height/2) > downmost_y {
						downmost_y = current_y + (instance_find(obj_province, j).sprite_height/2)
						downmost_x = current_x
					}
				}
			}
			
			x_offset = 0
			y_offset = 0
			width = rightmost_x - leftmost_x
			height = downmost_y - upmost_y
			mid_x = leftmost_x + (width / 2)
			mid_y = upmost_y + (height / 2)
			
			if prov_count > 1 {
				angle = (arctan((downmost_y - upmost_y) / (downmost_x - upmost_x))) * -(45/pi)
				draw_set_font(fnt_map_lg)
			} else {
				angle = instance_find(obj_province, prov_current).angle
				x_offset = instance_find(obj_province, prov_current).x_offset
				y_offset = instance_find(obj_province, prov_current).y_offset
				mid_x = instance_find(obj_province, prov_current).x
				mid_y = instance_find(obj_province, prov_current).y
				draw_set_font(fnt_header)
			}
			
			if prov_count == 2 && global.tags[i][0] == "POI" {
				angle = instance_find(obj_province, prov_current).angle
				x_offset = instance_find(obj_province, prov_current).x_offset
				y_offset = instance_find(obj_province, prov_current).y_offset
				//mid_x = instance_find(obj_province, prov_current).x
				mid_y = instance_find(obj_province, prov_current).y
				draw_set_font(fnt_map_lg)
			}
			if prov_count == 3 && global.tags[i][0] == "BUR" {
				angle = -45
				x_offset = instance_find(obj_province, prov_current-1).x_offset + 30
				y_offset = instance_find(obj_province, prov_current-1).y_offset
				mid_x = instance_find(obj_province, prov_current).x
				mid_y = instance_find(obj_province, prov_current-1).y
				draw_set_font(fnt_map_lg)
			}
			if prov_count == 4 && global.tags[i][0] == "BUR" {
				angle = -60
				x_offset = instance_find(obj_province, prov_current-1).x_offset + 40
				y_offset = instance_find(obj_province, prov_current-1).y_offset - 60
				mid_x = instance_find(obj_province, prov_current).x
				mid_y = instance_find(obj_province, prov_current-1).y
				draw_set_font(fnt_map_lg)
			}
			//if upmost_x > downmost_x {
			//	diag_length = sqrt(((downmost_y - upmost_y)^2) + ((upmost_x - downmost_x)^2))
			//} else {
			//	diag_length = sqrt(((downmost_y - upmost_y)^2) + ((downmost_x - upmost_x)^2))
			//}
			//if upmost_x > downmost_x {
			//	// Bottom Left --> To --> Top Right
			//	angle = (arctan((downmost_y - upmost_y) / (leftmost_x - upmost_x))) * -(90/pi)
			//} else { 
			//	// Top Left --> To --> Bottom Right
			//	angle = (arctan((downmost_y - upmost_y) / (rightmost_x - downmost_x))) * (90/pi)
			//}
			
			//show_debug_message(global.tags[i][0] + ": " + string(angle))
			
			if prov_count > 0 {
				draw_set_halign(fa_center)
				draw_text_transformed(mid_x + x_offset, mid_y + y_offset, global.tags[i][obj_control.lang_setting], 1, 1, angle)
				draw_set_halign(fa_left)
			} 
			//draw_text(leftmost_x, leftmost_y, global.tags[i][1])
		}
	}
}


			//var x_coords = []
			//var y_coords = []
			
			//for (j = 0; j < instance_number(obj_province); j ++) {
			//	if instance_find(obj_province, j).tag == global.tags[i][0] {
			//		array_push(x_coords, instance_find(obj_province, j).x)
			//		array_push(y_coords, instance_find(obj_province, j).y)
			//	}
			//}
			
			//x_coord = median(x_coords)
			//_coord = median(x_coords)
			//draw_text(leftmost_y, leftmost_x, global.tags[i][1])