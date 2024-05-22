// debug
show_debug_overlay(true);

// setup background
var _background = layer_background_get_id("Background");
layer_background_blend(_background, c_black);

// create persistent objects
instance_create_layer(0,0,"game_instances",obj_camera);
instance_create_layer(0,0,"game_instances",obj_pause); // layer needs to be visible!
instance_create_layer(0,0,"lighting",obj_light_surface);