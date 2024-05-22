// settings
camera_show_width = global.game_width;
camera_show_height = global.game_height;

scale_factor = global.sprite_scale;

/*
camera_show_width = 960;
camera_show_height = 540;

scale_factor = 1;
*/

tracking_object = 0;


// process
window_set_size(camera_show_width*scale_factor,camera_show_height*scale_factor);
surface_resize(application_surface,camera_show_width*scale_factor,camera_show_height*scale_factor)

alarm[0] = 1;

camera_set_view_size(view_camera[0], camera_show_width, camera_show_height);


// set to second monitor for development
window_set_position( -1500, window_get_y());