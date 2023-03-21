/// @description Draw Self

draw_self()

if obj_control.zoom >= 15 {
	image_xscale = 0.8
	image_yscale = 0.8
	draw_set_font(fnt_map_sm)
	image_alpha = 0.75
	draw_text(x-14, y-8, string(round(total_mp)))
	with obj_non_gui_button {
		if type == "ArmyMerge" || type == "ArmySplit" 
		|| type == "ArmyBuild" || type == "ArmyClose" {
			image_alpha = 0.75
			image_xscale = 0.81
			image_yscale = 0.81
			if x != start_x + 6 {
				x = start_x + 6	
			}
			
			if y != start_y + 8 {
				y = start_y	+ 8
			}
		}	
	}
	
	if quality > 0 {
		draw_sprite_stretched(spr_army, quality + 3, x - 28.7, y - 13.75, 57, 28)	
	}
	
} else if obj_control.zoom <= 5 {
	image_alpha = 0
	with obj_non_gui_button {
		if type == "ArmyMerge" || type == "ArmySplit" 
		|| type == "ArmyBuild" || type == "ArmyClose" {
			image_alpha = 0
			image_xscale = 1
			image_yscale = 1
			
			if x != start_x {
				x = start_x
			}
			
			if y != start_y {
				y = start_y	
			}
		}
	}
	
} else {
	image_alpha = 0.75
	image_xscale = 1
	image_yscale = 1
	draw_set_font(fnt_header)
	draw_text(x-24, y-12, string(round(total_mp)))
	with obj_non_gui_button {
		if type == "ArmyMerge" || type == "ArmySplit" 
		|| type == "ArmyBuild" || type == "ArmyClose" {
			image_alpha = 0.75
			image_xscale = 1
			image_yscale = 1
			
			if x != start_x {
				x = start_x
			}
			
			if y != start_y {
				y = start_y	
			}
		}	
	}
	
	if quality > 0 {
		draw_sprite(spr_army, quality + 3, x, y)	
	}
}


