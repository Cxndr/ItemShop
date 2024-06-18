
if (!surface_exists(window_surf)) 
{
	window_surf = surface_create(72, 40);
	view_surface_id[1] = window_surf;
}



// edit surface
surface_set_target(window_surf);

	draw_set_alpha(0.4);
	var _c = #5b6f73;
	draw_rectangle_color(0,0,view_get_wport(1),view_get_hport(1),_c,_c,_c,_c,false);
	
	draw_set_alpha(0.7);
	_c = c_white;
	draw_line_color(24,4,9,24,_c,_c);
	draw_line_color(54,4,39,24,_c,_c);
	
	draw_set_alpha(1);
surface_reset_target();


if (view_current == 0 and surface_exists(window_surf))
{
	draw_set_alpha(1);
	draw_surface_stretched(
		window_surf,
		x,
		y,
		view_get_wport(1),
		view_get_hport(1)
		);
}