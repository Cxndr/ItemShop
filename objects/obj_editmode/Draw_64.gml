if (active == true)
{
	draw_set_halign(fa_center);
	draw_text_color(display_get_gui_width()/2, 100, "- EDIT SHOP -",c_red,c_red,c_red,c_red,1);
	var _instructions = "(left click to place objects, right click to delete them!)";
	draw_text_color(display_get_gui_width()/2, 150, _instructions, c_black,c_black,c_black,c_black,1);
}