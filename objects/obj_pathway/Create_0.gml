grid_size = 16;
grid = mp_grid_create(0, 0, room_width/grid_size, room_height/grid_size, grid_size, grid_size);
alarm[0] = 1;

function redraw_path()
{
	alarm[0] = 1;	
}