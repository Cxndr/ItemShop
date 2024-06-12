// animation
current_frame += anim_speed / game_get_speed(gamespeed_fps);
if (current_frame >= array_length(anim_frames)) current_frame = 0;
image_index = anim_frames[floor(current_frame)];




// final output
draw_self();

//draw_sprite(spr_dot,0,x,y);