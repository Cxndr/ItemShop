// depth system
scr_tile_depth_reset();

// run state machine
state();


// set animation
face_dir = round_to_dir(direction);
if (speed > 0) or (path_position != 1) {moving = true}
else moving = false;
if (moving = true)
{
	if		(direction >= 270)	{ set_anim("down"); }
	else if (direction >= 180)	{ set_anim("left"); }
	else if (direction >= 90)	{ set_anim("up"); }
	else						{ set_anim("right"); }
}
else
{
	if		(face_dir >= 270)	{ set_anim("idle_down"); }
	else if (face_dir >= 180)	{ set_anim("idle_left"); }
	else if (face_dir >= 90)	{ set_anim("idle_up"); }
	else						{ set_anim("idle_right"); }
}


//show_debug_message("target_x: " + string(target_x) + " target_y: " + string(target_y));
//show_debug_message("browse_x: " + string(browse_pos_x) + " browse_y: " + string(browse_pos_y));
//show_debug_message("x: " + string(x) + " y: " + string(y));
//show_debug_message("xprev: " + string(xprevious) + " yprev: " + string(yprevious));

// debug
/*
var _debug_string = 
	string(state_current) + 
	" des: " + string(browse_pos_x) + "," + string(browse_pos_y) +
	" curr: " + string(x) + "," + string(y);

show_debug_message(_debug_string)
*/