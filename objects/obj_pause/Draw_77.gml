// disable alpha blending (we only want rgb values, not transparent draws)
gpu_set_blendenable(false);

if (pause)
{
	surface_set_target(application_surface);
		if(surface_exists(pause_surf)) draw_surface(pause_surf,0,0);
		else // restore from buffer if we lost the surface
		{
			pause_surf = surface_create(res_w,res_h);
			buffer_set_surface(pause_surf_buffer,pause_surf,0);
		}
	surface_reset_target();
}

if (initiate_pause = true)
{
	initiate_pause = false;
	if (!pause) // pause now
	{
		
		pause = true;
		
		// deactivate everything except this instance and ignored objects
		instance_deactivate_all(true);
		for (var _i = 0; _i < array_length(ignore_objects); _i++;)
		{
			instance_activate_object(ignore_objects[_i]);
		}
	
		// NOTE: if you need to pause animations have to do that seperately :((((
	
		// capture this game moment (won't capture draw_gui contents!)
		pause_surf = surface_create(res_w, res_h);
		surface_set_target(pause_surf);
			draw_surface(application_surface,0,0)
		surface_reset_target();
	
		// back up this surface to a buffer in case we lose it (screen focus, etc)
		if (buffer_exists(pause_surf_buffer)) buffer_delete(pause_surf_buffer);
		pause_surf_buffer = buffer_create(res_w * res_h * 4, buffer_fixed, 1);
		buffer_get_surface(pause_surf_buffer, pause_surf,0);
	}
}
if (initiate_unpause = true)
{
	initiate_unpause = false;
	if (pause == true)
	{
		pause = false;
		instance_activate_all();
		if (surface_exists(pause_surf)) surface_free(pause_surf);
		if (buffer_exists(pause_surf_buffer)) buffer_delete(pause_surf_buffer);
	}
}

// enable alpha blending again
gpu_set_blendenable(true);