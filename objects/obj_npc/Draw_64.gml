/* - USING DEBUG MESSAGES INSTEAD
// state_gui
draw_set_font(fnt_text);
draw_set_alpha(1);
draw_set_halign(fa_left);
draw_set_valign(fa_top);

var _draw_string = 
	string(state_current) + 
	" d:" + string(browse_pos_x) + "," + string(browse_pos_y) +
	" c:" + string(x) + "," + string(y);

draw_set_color(c_black);
draw_rectangle
(
	(x-string_width(_draw_string)/2)*global.sprite_scale,
	(y-string_height(_draw_string)/2)*global.sprite_scale,
	(x+string_width(_draw_string)/2)*global.sprite_scale,
	(y+string_height(_draw_string)/2)*global.sprite_scale,
	false
)

draw_set_color(c_white);
draw_text(x*global.sprite_scale,(y + (sprite_height/2) + 20) * global.sprite_scale, _draw_string);
*/

// draw debug floating text
var _x = x * global.sprite_scale;
var _y = y * global.sprite_scale;
draw_set_font(fnt_debug);
draw_set_color(c_white);
draw_set_alpha(1);
draw_set_halign(fa_center);
draw_set_valign(fa_top);
var _debug_string = "state: " + string(state_current) + " | buy_item: " + string(buy_item);
draw_text(_x, _y-60, _debug_string);
