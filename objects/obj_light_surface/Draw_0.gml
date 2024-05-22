if (surface_exists(light_surf))
{
	
	// grow and shrink size effect
	if (osc_growing == true)
	{
		osc_value += osc_size/osc_time;
		if (osc_value >= osc_size) osc_growing = false;
	}
	else // shrinking
	{
		osc_value -= osc_size/osc_time;
		if (osc_value <= 0-osc_size) osc_growing = true;
	}
	
	var _cw = camera_get_view_width(view_camera[0]);
	var _ch = camera_get_view_height(view_camera[0]);
	var _cx = camera_get_view_x(view_camera[0]);
	var _cy = camera_get_view_y(view_camera[0]);
	var _spr_scale_x = osc_value + 0.55;
	var _spr_scale_y = osc_value + 0.65;
	var _spr_w = sprite_get_width(vig_spr) * _spr_scale_x;
	var _spr_h = sprite_get_height(vig_spr) * _spr_scale_y;

	surface_set_target(light_surf);
	draw_set_color(c_black);
	draw_set_alpha(0.9);
	draw_rectangle(0,0,_cw,_ch,0);
	
	gpu_set_blendmode(bm_subtract);
	

	
	with(obj_light_vignette)
	{
		draw_sprite_ext(other.vig_spr, 0, x-_cx-(_spr_w/2), y-_cy-(_spr_h/2), _spr_scale_x, _spr_scale_y, 0, c_white, 1);
		draw_sprite_ext(other.vig_spr, 0, x-_cx-(_spr_w/2), y-_cy-(_spr_h/2), _spr_scale_x+0.1, _spr_scale_y+0.1, 0, c_white, 0.5);
		draw_sprite_ext(spr_vignette_med, 0, x-_cx-(_spr_w/2), y-_cy-(_spr_h/2), _spr_scale_x, _spr_scale_y, 0, c_white, 1);
		draw_sprite_ext(spr_vignette_med, 0, x-_cx-(_spr_w/2), y-_cy-(_spr_h/2), _spr_scale_x, _spr_scale_y, 0, c_white, 1);
		draw_sprite_ext(spr_vignette_med, 0, x-_cx-(_spr_w/2), y-_cy-(_spr_h/2), _spr_scale_x, _spr_scale_y, 0, c_white, 1);
		draw_sprite_ext(spr_vignette_med, 0, x-_cx-(_spr_w/2), y-_cy-(_spr_h/2), _spr_scale_x, _spr_scale_y, 0, c_white, 1);
		
		//orange glow
		//gpu_set_blendmode(bm_add);
		//draw_sprite_ext(spr_vignette_softer, 0, x-_cx-(_spr_w/2), y-_cy-(_spr_h/2), _spr_scale_x, _spr_scale_y, 0, c_orange, 1);
		
		gpu_set_blendmode(bm_subtract);
		//draw_sprite_ext(spr_vignette_med, 0, x-_cx-(_spr_w/2), y-_cy-(_spr_h/2), _spr_scale_x, _spr_scale_y, 0, c_white, 1);

		
	}
	// reset
	gpu_set_blendmode(bm_normal);
	draw_set_alpha(1);
	surface_reset_target();
	draw_surface(light_surf, _cx, _cy);
	
}
if (!surface_exists(light_surf))
{
	var _cw = camera_get_view_width(view_camera[0]);
	var _ch = camera_get_view_height(view_camera[0]);
	
	light_surf = surface_create(_cw,_ch);
	
	surface_set_target(light_surf);
	draw_set_color(c_black);
	draw_set_alpha(0.6);
	draw_rectangle(0,0,_cw,_ch,0);
	surface_reset_target();
	
}
