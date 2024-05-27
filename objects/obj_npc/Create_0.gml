// settings
move_speed = 1;
diagonal_speed = 0.75;
anim_speed = 7;
wait_time_min = 2 * 60;
wait_time_max = 8 * 60;

// mechanical
original_depth = depth; // needed for scr_tile_depth_reset();
anim_frames = [0];
current_frame = 0;
state_enter = true;
image_speed = 0;
browse_pos_x = 0;
browse_pos_y = 0;
face_dir = FACE_DIR.DOWN;
counter_choice = -1;
counter_choice_x = 0;
counter_choice_y = 0;
face_counter = false;
moving = false;

// animation
image_index = 0;
image_speed = false;
function set_anim(_state)
{
	new_anim = variable_struct_get(anims,_state);
	anim_frames = new_anim.frames;
}
anims = {
	left:		{ frames: [4,3,4,5] },
	right:		{ frames: [7,8,7,6] },
	up:			{ frames: [10,11,10,9] },
	down:		{ frames: [1,0,1,2] },
	idle_left:	{ frames: [4,4,4,4,4,4,4,4,4,4,4,4,14,15,14,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4] },
	idle_right:	{ frames: [7,7,7,7,7,7,7,7,7,7,7,7,16,17,16,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7] },
	idle_up:	{ frames: [10] },
	idle_down:	{ frames: [1,1,1,1,1,1,1,1,1,1,1,1,12,13,12,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1] },
};
set_anim("idle_down");

// pathing
path = path_add();
target_x = 0;
target_y = 0;
alarm[0] = 1;


// states
enum STATE
{
	IDLE,
	ENTER_SHOP,
	BROWSE,
	BUY_ITEM,
	LEAVE_SHOP	
}
state_current = STATE.IDLE;



state_entershop = function()
{
	// enter state
	state_current = STATE.ENTER_SHOP;
	if state_enter = true
	{
		x = global.shop_enter_pos_x;
		y = global.shop_enter_pos_y;
		state_enter = false;
	}
	
	// state
	if (point_distance(x,y,global.shop_enter_pos_fin_x, global.shop_enter_pos_fin_y) > move_speed)
	{
		move_towards_point(global.shop_enter_pos_fin_x, global.shop_enter_pos_fin_y, move_speed)
		//show_debug_message(global.shop_enter_pos_fin_y);
	}
	else
	{
		x = global.shop_enter_pos_fin_x;
		y = global.shop_enter_pos_fin_y;
		speed = 0;
	}
	
	// leave state
	if (x == global.shop_enter_pos_fin_x and y == global.shop_enter_pos_fin_y)
	{
		state_enter = true;
		state = state_browse;
	}
}



state_browse = function()
{
	get_browse_pos = function()
	{
		randomize();
		
		// choose either go to counter or go to random
		var _browse_choice = irandom(2)
		
		// counter choice
		if (_browse_choice > 0)
		{
			var _counter_list = [];
			for (var _i=0; _i < instance_number(obj_counter); _i++)
			{
				_counter_list[_i] = instance_find(obj_counter,_i);	
			}
			
			var _found = false;
			while(_found = false)
			{
				counter_choice = _counter_list[irandom(array_length(_counter_list)-1)];
				counter_choice_x = counter_choice.x + (obj_counter.sprite_width/2);
				counter_choice_y = counter_choice.y + (obj_counter.sprite_height/2);
				var _choose_dir = irandom(3);
				switch(_choose_dir)
				{
					case 0: // right
						browse_pos_x = counter_choice_x + obj_pathway.grid_size;
						browse_pos_y = counter_choice_y;
					break;
					case 1: // down
						browse_pos_x = counter_choice_x;
						browse_pos_y = counter_choice_y + obj_pathway.grid_size;
					break;
					case 2: // left
						browse_pos_x = counter_choice_x - obj_pathway.grid_size;
						browse_pos_y = counter_choice_y;
					break;
					case 3: // up
						browse_pos_x = counter_choice_x;
						browse_pos_y = counter_choice_y - obj_pathway.grid_size;
					break;
				}
				browse_pos_x = snap_to_grid(browse_pos_x);
				browse_pos_y = snap_to_grid(browse_pos_y);
				if instance_place(browse_pos_x,browse_pos_y,obj_solid)
				or instance_place(browse_pos_x,browse_pos_y,obj_restricted)
				// or instance_place(browse_pos_x,browse_pos_y,obj_all_chars) // causes random freeze ???
				{
					_found = false;
				}
				else _found = true;
				face_counter = true;
			}
		}
		
		// random choice
		else
		{
			var _found = false;
			while( _found = false)
			{
				browse_pos_x = irandom_range(global.shop_x - 10, global.shop_x + global.shop_w);
				browse_pos_y = irandom_range(global.shop_y, global.shop_y + global.shop_h + 10);
				browse_pos_x = snap_to_grid(browse_pos_x);
				browse_pos_y = snap_to_grid(browse_pos_y);
				if instance_place(browse_pos_x,browse_pos_y,obj_solid)
				or instance_place(browse_pos_x,browse_pos_y,obj_restricted)
				// or instance_place(browse_pos_x,browse_pos_y,obj_all_chars) // causes random freeze ???
				{
					_found = false;
				}
				else _found = true;
			}
		}
	}
	
	// enter state
	state_current = STATE.BROWSE;
	if state_enter = true
	{
		state_enter = false;
		get_browse_pos();
		target_x = browse_pos_x;
		target_y = browse_pos_y;
		if (mp_grid_path(obj_pathway.grid, path, x, y, target_x, target_y, false))
		{
			path_start(path, move_speed, path_action_stop, true);	
		}
	}
	
	// state
	if(point_distance(x, y, browse_pos_x, browse_pos_y) > move_speed)
	{
		target_x = browse_pos_x;
		target_y = browse_pos_y;
	}
	else
	{
		x = browse_pos_x;
		y = browse_pos_y;
		if (irandom(3) == 0) direction = irandom(3)*90;
		if (face_counter == true) 
		{
			direction = round_to_dir(point_direction(x,y,counter_choice_x,counter_choice_y));
			face_counter = false;
		}
		get_browse_pos();
		alarm_set(0,irandom_range(wait_time_min, wait_time_max));
	}
	
	// leave state
}

state = state_entershop;