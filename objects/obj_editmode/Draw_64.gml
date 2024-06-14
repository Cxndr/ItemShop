if (active == true)
{
	draw_set_font(fnt_text);
	draw_set_halign(fa_center);
	var _c = c_red;
	draw_text_color(display_get_gui_width()/2, 100, "- EDIT SHOP -",_c,_c,_c,_c,1);
	var _instructions = "(left click to place objects, right click to delete them!)";
	_c = c_white;
	draw_text_color(display_get_gui_width()/2, 150, _instructions,_c,_c,_c,_c,1);
}

