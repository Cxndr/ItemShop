// setup font
draw_set_font(fnt_text_l);
draw_set_valign(fa_top);
draw_set_halign(fa_left);

// get height, width & position of menu
var _new_w = string_width(description);
for (var _i = 0; _i < option_full_len; _i++)
{
	var _op_w = 0;
	var _option_string = options_full[|_i].name;
	if struct_exists(options_full[|_i], "quantity") _option_string += (" x" + string(options_full[|_i].quantity));
	if struct_exists(options_full[|_i], "icon") _op_w += icon_size + icon_padding;
	if struct_exists(options_full[|_i], "price") _option_string += (string(options_full[|_i].price)); _op_w += icon_size + price_margin;
	_op_w += string_width(_option_string);
	_new_w = max(_new_w, _op_w);
}
width = _new_w + (border_size*2) + (margin*2);
height =
	(border_size*2) +
	(margin*4) + 
	desc_space +
	cat_panel_h +
	(min(list_size, option_len) * lineheight) +
	(string_padding * (option_len-1));
x = display_get_gui_width() - (width + ui_margin);
y = 0 + ui_margin;

// draw background
draw_sprite_ext(sprite_index, image_index, x, y, width/sprite_width, height/sprite_height, 0, c_white, bg_alpha);

//draw description
var _dc = desc_colour;
draw_set_valign(fa_top);
draw_set_halign(fa_left);
draw_text_color(x + border_size + margin, y + border_size + margin, description,_dc,_dc,_dc,_dc,1);

// draw category panel
var _cc = cat_colour;
draw_sprite_ext(
	sprite_index, image_index, 
	x - cat_panel_sides, 
	y + border_size + (margin*2) + desc_space,
	(width + (cat_panel_sides*2))/sprite_width, 
	cat_panel_h/sprite_height,
	0,c_white,bg_alpha);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);
draw_text_ext_color(
	x + (width/2),
	y + border_size + (margin*2) + desc_space + (cat_panel_h/2), 
	global.item_category[cat_selection], 
	lineheight+2, width, _cc,_cc,_cc,_cc,1);

// draw menu items
draw_set_valign(fa_top);
for (var _i = 0; _i < min(list_size,option_len); _i++)
{
	var _p = _i + lower_pos;
	draw_set_halign(fa_left);
	var _option_string = options[|_p].name;
	if struct_exists(options[|_p], "quantity") _option_string += (" x" + string(options[|_p].quantity));
	var _oc = option_colour;
	var _x_pos = x + border_size + margin;
	var _y_pos = y + border_size + (margin*3) + desc_space + cat_panel_h + (lineheight*_i) + (string_padding*_i);
	if (position == _p) _oc = highlight_colour;
	if struct_exists(options[|_p], "icon") 
	{
		_x_pos = x + icon_margin;
		draw_sprite_ext(
			spr_icons, real(options[|_p].icon),
			_x_pos + icon_padding, 
			(_y_pos - (icon_size/2)) + (string_padding/2), 
			icon_scale, icon_scale, 
			0, c_white, 1);
		_x_pos += icon_size + (icon_padding*2);
	}
	draw_text_color(_x_pos, _y_pos, _option_string,_oc,_oc,_oc,_oc,1);
	if struct_exists(options[|_p], "price")
	{
		draw_set_halign(fa_right);
		_x_pos = x + width - icon_padding - icon_margin - icon_size;
		draw_text_color(_x_pos - (icon_padding/2), _y_pos, options[|_p].price, _oc,_oc,_oc,_oc,1);
		draw_sprite_ext(
			spr_icons, 10, 
			_x_pos, 
			(_y_pos - (icon_size/2)) + (string_padding/2), 
			icon_scale, icon_scale,
			0,c_white,1);
	}
}

// draw bottom panel
if struct_exists(options[|position], "price")
{
	var _bot_x = 0 + ui_margin;
	var _bot_y = display_get_gui_height() - (bot_panel_h + ui_margin_bot);
	var _bot_w = display_get_gui_width() - (ui_margin * 2);
	var _bot_h = bot_panel_h;
	draw_set_halign(fa_left);
	draw_set_font(fnt_text_l);
	draw_sprite_ext(sprite_index,image_index, _bot_x, _bot_y, _bot_w/sprite_width, _bot_h/sprite_height,0,c_white,bg_alpha);
	var _item_details = struct_exists(options[|position],"description") ? options[|position].description : "";
	draw_text_ext_color(
		_bot_x + bot_panel_padding, 
		_bot_y + bot_panel_padding, 
		_item_details, 
		bot_panel_lineheight, 
		_bot_w - (bot_panel_padding*2), 
		_dc,_dc,_dc,_dc,1);
	draw_text_color(
		_bot_x + bot_panel_padding + bot_panel_info_margin,
		_bot_y + (bot_panel_padding) + (bot_panel_lineheight*2) + bot_panel_info_padding,
		"Base Price: " + string(options[|position].price),
		_dc,_dc,_dc,_dc,1);
	draw_sprite_ext(
		spr_icons,10,
		_bot_x + bot_panel_padding + bot_panel_info_margin + string_width("Base Price: " + string(options[|position].price)),
		_bot_y + (bot_panel_padding) + (bot_panel_lineheight*2) + bot_panel_info_padding - (icon_size/4),
		icon_scale, icon_scale,
		0,c_white,1);
}