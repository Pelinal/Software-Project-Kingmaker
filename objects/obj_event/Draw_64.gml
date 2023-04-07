/// @description draw self + text 

draw_self()

draw_set_halign(fa_center)
draw_set_color(c_grey)
draw_set_font(fnt_header)
draw_text(x, y - 292, title)
draw_set_halign(fa_left)
draw_sprite(spr_evt_pics, pic, x, y - 256)
draw_set_font(fnt_map_sm)
draw_text(x - 234 , y + 4, string_wordwrap_width(body, 470, "\n"))