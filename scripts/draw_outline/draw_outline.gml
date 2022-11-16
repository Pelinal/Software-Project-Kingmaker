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