/// @description pathing

if (path_position == 1)
{
	path_delete(path);
	path = path_add();
	if (mp_grid_path(obj_pathway.grid, path, x, y, target_x, target_y, false))
	{
		path_start(path, move_speed, path_action_stop, true);
	}
}



// loop

