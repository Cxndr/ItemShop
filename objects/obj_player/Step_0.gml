// depth system
scr_tile_depth_reset();

// get input
var _pressed_left = keyboard_check(ord("A"));
var _pressed_right = keyboard_check(ord("D"));
var _pressed_up = keyboard_check(ord("W"));
var _pressed_down = keyboard_check(ord("S"));
var _interact_key = keyboard_check_pressed(vk_enter);

// get movement
xdir = _pressed_right - _pressed_left;
ydir = _pressed_down - _pressed_up;
var _move_speed = move_speed;

// set animation
if		(xdir == -1)			{ set_anim("left"); face_dir = "left"; }
else if (xdir == 1)				{ set_anim("right"); face_dir = "right"; }
else if (ydir == -1)			{ set_anim("up"); face_dir = "up"; }
else if (ydir == 1)				{ set_anim("down"); face_dir = "down"; }
else if (face_dir == "left")	set_anim("idle_left");
else if (face_dir == "right")	set_anim("idle_right");
else if (face_dir == "up")		set_anim("idle_up");
else if (face_dir == "down")	set_anim("idle_down");
else							set_anim("idle_down");

// COLLISIONS
if place_meeting(x + (xdir * _move_speed), y, obj_solid)
{
	// corner sliding
	var _y_offset = 1;
	var _gap_found = false;
	
	while (_y_offset <= corner_tolerance)
	{
		if !place_meeting(x + (xdir*_move_speed), y + _y_offset, obj_solid) // gap above
		{
			ydir = 1;
			_gap_found = true;
			break;
		}
		else if !place_meeting(x + (xdir*_move_speed), y - _y_offset, obj_solid) // gap below
		{
			ydir = -1;
			_gap_found = true;
			break;
		}
		else // no gap found
		{
			_y_offset++;
		}
	}
	xdir = 0; // stop x movement
}

if place_meeting(x, y + (ydir * _move_speed), obj_solid)
{
	// corner sliding
	var _x_offset = 1;
	var _gap_found = false;
	
	while (_x_offset <= corner_tolerance)
	{
		if !place_meeting(x + _x_offset, y + (ydir*_move_speed), obj_solid) // gap right
		{
			xdir = 1;
			_gap_found = true;
			break;
		}
		else if !place_meeting(x - _x_offset, y + (ydir*_move_speed), obj_solid) // gap left
		{
			xdir = -1;
			_gap_found = true;
			break;
		}
		else // no gap found
		{
			_x_offset++;
		}
	}
	ydir = 0; // stop y movement
}

// execute movement
if (movement = true)
{
	if (xdir != 0 && ydir != 0) _move_speed = move_speed * diagonal_speed;
	x = x + (xdir * _move_speed)
	y = y + (ydir * _move_speed);
}



// INTERACTION COLLISIONS

// get interact position to check and interacting object
var _interact_point_x = x;
var _interact_point_y = y;
switch (face_dir)
{
	case "left":
		interact_point_x = x - interact_distance_h;
		interact_point_y = y;
		break;
	case "right":
		interact_point_x = x + interact_distance_h;
		interact_point_y = y;
		break;
	case "up":
		interact_point_x = x;
		interact_point_y = y - interact_distance_v;
		break;
	case "down":
		interact_point_x = x;
		interact_point_y = y + interact_distance_v;
		break;
}


// counter interact
interacting_counter = instance_position(interact_point_x, interact_point_y, obj_counter)
if (interacting_counter != noone and interacting_counter.object_index == obj_counter)
{
	draw_counter_sel = true;
	instance_destroy(counter_sel);
	counter_sel = instance_create_layer(interacting_counter.x, interacting_counter.y, interacting_counter.layer, obj_counter_sel);
	with (counter_sel) depth = depth-1
	if (_interact_key)
	{
		with instance_create_layer(x, y, "menus", obj_menu_inventory)
		{
			display_counter = other.interacting_counter;
		}
	}
}
else 
{
	draw_counter_sel = false;
	instance_destroy(counter_sel);
}

// shop activate interact
interacting_shop_activate = instance_position(interact_point_x, interact_point_y, obj_shop)
if (interacting_shop_activate)
{
	if (_interact_key)
	{
		obj_shop.activate_sale_period();
	}
}
