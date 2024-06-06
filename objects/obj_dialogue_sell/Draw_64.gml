// setup font
draw_set_font(font);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

// draw background
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, bg_alpha);

// draw text
var _c = text_color;
var _x = x + padding;
var _y = y + padding;
draw_text_ext(_x, _y, current_dialogue, lineheight, width - (padding*2) );