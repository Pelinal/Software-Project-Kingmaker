/// @description Draw Self

draw_self()

if obj_control.zoom >= 15 {
	image_xscale = 0.5
	image_yscale = 0.5
	draw_set_font(fnt_map_sm)
	image_alpha = 0.75
	draw_text(x-14, y-8, string(round(total_mp)))
	with obj_non_gui_button {
		if type == "ArmyMerge" || type == "ArmySplit" 
		|| type == "ArmyBuild" || type == "ArmyClose" {
			image_alpha = 0.75
			image_xscale = 0.5
			image_yscale = 0.5
		}	
	}
} else if obj_control.zoom <= 5 {
	image_alpha = 0
	with obj_non_gui_button {
		if type == "ArmyMerge" || type == "ArmySplit" 
		|| type == "ArmyBuild" || type == "ArmyClose" {
			image_alpha = 0
			image_xscale = 1
			image_yscale = 1
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
		}	
	}
}

