grid_size = 16;
grid = mp_grid_create(0, 0, room_width/grid_size, room_height/grid_size, grid_size, grid_size);
mp_grid_add_instances(grid, obj_solid, false);
mp_grid_add_instances(grid, obj_restricted, false);

