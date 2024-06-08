// animation
current_frame += anim_speed / game_get_speed(gamespeed_fps);
if (current_frame >= array_length(anim_frames)) current_frame = 0;
image_index = anim_frames[floor(current_frame)];


// final output
draw_self();

// draw path
//draw_set_alpha(1);
//draw_set_color(debug_path_draw_color);
//draw_path(path, x, y, 1);
//draw_set_alpha(1);
//draw_set_color(c_white);
