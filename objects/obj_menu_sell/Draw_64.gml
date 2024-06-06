// setup font
draw_set_font(font);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

// draw background
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, bg_alpha);

// draw value
var _c = price_color;
draw_text_color(x + margin, y + margin, price,_c,_c,_c,_c,1);

// draw sel_pos
var _sel_char = string_char_at(string(price), sel_pos);
var _c_width = string_width(_sel_char);
var _string_pre = string_copy(string(price), 1, sel_pos-1);
var _x = x + margin + string_width(_string_pre);
var _y = y + margin + string_height(string(price));
draw_line_color(_x, _y + sel_gap, _x + _c_width, _y + sel_gap, sel_color, sel_color);

/*
show_debug_message("sel_pos: " + string(sel_pos));
show_debug_message("sel_char: " + string(_sel_char));
show_debug_message("string_pre: " + string(_string_pre));
show_debug_message("_x: " + string(_x));
*/