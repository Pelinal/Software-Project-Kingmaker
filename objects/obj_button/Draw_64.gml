/// @description Draw Self

draw_self()
draw_set_alpha(1)
draw_set_colour(c_grey)
draw_set_font(fnt_header)

draw_text(x + sprite_width/2, 804, type)
draw_sprite(spr_tall_button, 0, x, y)
