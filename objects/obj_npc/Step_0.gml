event_inherited();



// run state machine
switch (state_current)
{
	case NPC_STATE.IDLE: state = state_idle; break;
	case NPC_STATE.ENTER_SHOP: state = state_entershop; break;
	case NPC_STATE.BROWSE: state = state_browse; break;
	case NPC_STATE.BUY_ITEM: state = state_buyitem; break;
	case NPC_STATE.LEAVE_SHOP: state = state_leaveshop; break;
}
state();

// set animation
face_dir = round_to_dir(direction);
if (speed > 0) or (path_position != 1) {moving = true}
else moving = false;

if (while_loop_limit_reached)
{
	moving = false;
	face_dir = last_face_dir;
}

if (moving == true and while_loop_limit_reached == false)
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

last_face_dir = face_dir;

//show_debug_message(name + " " + string(path));


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