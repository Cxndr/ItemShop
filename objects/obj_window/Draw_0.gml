
if (!surface_exists(window_surf)) 
{
	window_surf = surface_create(view_get_wport(1), view_get_hport(1));
	view_surface_id[1] = window_surf;
}



// edit surface
surface_set_target(window_surf);
	
	// window pane
	draw_set_alpha(0.5);
	var _c = #5b6f73;
	draw_rectangle_color(0,0,view_get_wport(1),view_get_hport(1),_c,_c,_c,_c,false);
	
	// edge darkening
	draw_set_alpha(0.4);
	_c = c_black;
	draw_rectangle_color(1,1,view_get_wport(1)-2,view_get_hport(1)-2,_c,_c,_c,_c,true);
	
	draw_set_alpha(0.2);
	_c = c_black;
	draw_rectangle_color(2,2,view_get_wport(1)-3,view_get_hport(1)-3,_c,_c,_c,_c,true);
	
	draw_set_alpha(0.1);
	_c = c_black;
	draw_rectangle_color(3,3,view_get_wport(1)-4,view_get_hport(1)-4,_c,_c,_c,_c,true);
	
	// reset
	draw_set_alpha(1);

surface_reset_target();



if (view_current == 0 and surface_exists(window_surf))
{
	gpu_set_blendenable(false);
	draw_surface_stretched(
		window_surf,
		x,
		y,
		view_get_wport(1),
		view_get_hport(1)
		);
	gpu_set_blendenable(true);
}
