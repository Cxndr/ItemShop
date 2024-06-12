event_inherited();

// settings
move_speed = 1;
diagonal_speed = 0.75;
anim_speed = 7;
wait_time_min = 2 * 60;
wait_time_max = 8 * 60;
browse_chance = 10; // 1 in this chance to browse instead of go to counter
debug_path_draw_color = choose(
	c_red, c_green, c_blue, c_fuchsia, c_lime, c_maroon, c_orange, c_purple, c_teal
);
buy_item_failsafe = 60 * 10;
buy_item_failsafe_timer = buy_item_failsafe;

// mechanical

anim_frames = [0];
current_frame = 0;
state_enter = true;
image_speed = 0;
browse_pos_x = 0;
browse_pos_y = 0;
face_dir = FACE_DIR.DOWN;
last_face_dir = FACE_DIR.DOWN;
counter_choice = -1;
counter_choice_x = 0;
counter_choice_y = 0;
face_counter = false;
moving = false;
buy_item = false;
at_till = false;
leave_shop = false;
in_store_shoppers_pos = -1;
in_store_shopper_objects_pos = -1;
while_loop_limit = 200;
while_loop_limit_reached = false;
clash_with_taken_location = false;


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
//alarm[0] = 1;

function redraw_path()
{
	path_delete(path);
	path = path_add();
	if (mp_grid_path(obj_pathway.grid, path, x, y, target_x, target_y, false))
	{
		path_start(path, move_speed, path_action_stop, true);
	}
}

function set_taken_location()
{
	ds_list_add(obj_npc_manager.taken_browse_locations, [name,target_x,target_y]);
}
function clear_taken_locations()
{
	for (var _i=0; _i<ds_list_size(obj_npc_manager.taken_browse_locations); _i++)
	{
		if (obj_npc_manager.taken_browse_locations[|_i][0] == name)
		{
			ds_list_delete(obj_npc_manager.taken_browse_locations,_i);
		}
	}
}


state_entershop = function()
{
	// enter state
	if state_enter = true
	{
		x = global.shop_enter_pos_x;
		y = global.shop_enter_pos_y;
		target_x = global.shop_enter_pos_fin_x;
		target_y = global.shop_enter_pos_fin_y;
		redraw_path();
		state_enter = false;
	}
	
	// state
	if (point_distance(x,y,global.shop_enter_pos_fin_x, global.shop_enter_pos_fin_y) > move_speed)
	{
		target_x = global.shop_enter_pos_fin_x;
		target_y = global.shop_enter_pos_fin_y;
		//move_towards_point(global.shop_enter_pos_fin_x, global.shop_enter_pos_fin_y, move_speed)
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
		state_current = NPC_STATE.BROWSE;
	}
}



state_browse = function()
{
	get_browse_pos = function()
	{
		var _while_limit = while_loop_limit;
		while_loop_limit_reached = false;
		randomize();
		
		// choose either go to counter or go to random
		var _browse_choice = irandom(browse_chance-1)
		_browse_choice = 1;
		
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
				randomize();
				counter_choice = _counter_list[irandom(array_length(_counter_list)-1)];
				counter_choice_x = counter_choice.x + (obj_counter.sprite_width/2);
				counter_choice_y = counter_choice.y + (obj_counter.sprite_height/2);
				randomize();
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
				//instance_create_layer(browse_pos_x, browse_pos_y, "game_instances", obj_dot);
				
				// check if position viable
				clash_with_taken_location = false;
				for (var _i=0; _i < ds_list_size(obj_npc_manager.taken_browse_locations); _i++)
				{
					var _x = obj_npc_manager.taken_browse_locations[|_i][1];
					var _y = obj_npc_manager.taken_browse_locations[|_i][2];
					if (browse_pos_x == _x and browse_pos_y == _y)
					{
						clash_with_taken_location = true;
					}
				}
				if 
				(
					place_meeting(browse_pos_x,browse_pos_y,obj_solid)
					or instance_position(browse_pos_x,browse_pos_y,obj_restricted)
					or instance_position(browse_pos_x,browse_pos_y,obj_shop_till)
					or instance_position(browse_pos_x,browse_pos_y,obj_all_chars)
					or clash_with_taken_location == true
				)
				{
					_found = false;
					_while_limit--;
					if (_while_limit = 0)
					{
						show_debug_message(string(name) + ": reached while loop limit trying to find position")
						while_loop_limit_reached = true;
						browse_pos_x = x;
						browse_pos_y = y;
						_found = true;
					}
				}
				else 
				{
					_found = true;
				}
				face_counter = true;
			}
		}
		
		// random choice
		else
		{
			var _found = false;
			while( _found = false)
			{
				randomize();
				browse_pos_x = irandom_range(global.shop_x - 10, global.shop_x + global.shop_w);
				browse_pos_y = irandom_range(global.shop_y, global.shop_y + global.shop_h + 10);
				browse_pos_x = snap_to_grid(browse_pos_x);
				browse_pos_y = snap_to_grid(browse_pos_y);
				
				// check if position viable
				clash_with_taken_location = false;
				for (var _i=0; _i < ds_list_size(obj_npc_manager.taken_browse_locations); _i++)
				{
					var _x = obj_npc_manager.taken_browse_locations[|_i][1];
					var _y = obj_npc_manager.taken_browse_locations[|_i][2];
					if (browse_pos_x == _x and browse_pos_y == _y)
					{
						clash_with_taken_location = true;
					}
				}
				if 
				(
					place_meeting(browse_pos_x,browse_pos_y,obj_solid)
					or instance_position(browse_pos_x,browse_pos_y,obj_restricted)
					or instance_position(browse_pos_x,browse_pos_y,obj_shop_till)
					or instance_position(browse_pos_x,browse_pos_y,obj_all_chars)
					or clash_with_taken_location == true
				)
				{
					_found = false;
					_while_limit--;
					if (_while_limit = 0)
					{
						while_loop_limit_reached = true;
						show_debug_message(string(name) + ": reached while loop limit trying to find position")
						browse_pos_x = x;
						browse_pos_y = y;
						_found = true;
					}
				}
				else 
				{
					_found = true;
				}
			}
		}
		
		target_x = browse_pos_x;
		target_y = browse_pos_y;
		set_taken_location();
	}
	
	// enter state
	if state_enter = true
	{
		state_enter = false;
		get_browse_pos();
		redraw_path();
	}
	
	// state
	if(point_distance(x, y, target_x, target_y) < move_speed)
	{
		x = target_x;
		y = target_y;
		clear_taken_locations();
		if (irandom(3) == 0) direction = irandom(3)*90;
		if (face_counter == true and while_loop_limit_reached == false) 
		{
			direction = round_to_dir(point_direction(x,y,counter_choice_x,counter_choice_y));
			face_counter = false;
		}
		get_browse_pos();
		alarm_set(0,irandom_range(wait_time_min, wait_time_max));
	}
	
	// leave state
	if (buy_item = true)
	{
		state_current = NPC_STATE.BUY_ITEM;
		state_enter = true;
	}
	if (leave_shop = true)
	{
		state_current = NPC_STATE.LEAVE_SHOP;
		state_enter = true;
	}
}


state_buyitem = function()
{
	var _till_x = obj_shop_till.x + (obj_shop_till.sprite_width/2);
	var _till_y = obj_shop_till.y + (obj_shop_till.sprite_height/2);
	
	
	
	// enter state
	if (state_enter == true)
	{
		// finish previous path before doing anything
		if (path_position != 1) exit;
		
		clear_taken_locations();
		state_enter = false;
		at_till = false;
		target_x = _till_x;
		target_y = _till_y;
		target_x = snap_to_grid(target_x);
		target_y = snap_to_grid(target_y);
		redraw_path();
	}
	
	// state
	if (point_distance(x,y,_till_x,_till_y) < move_speed)
	{
		at_till = true;
		x = _till_x;
		y = _till_y;
		direction = round_to_dir(point_direction(x,y,obj_shop_till.x,obj_shop_till.y));
		clear_taken_locations();
	}
	else
	{
		at_till = false;
		buy_item_failsafe_timer--;
	}
	
	if (at_till == false)
	{
		target_x = _till_x;
		target_y = _till_y;
		target_x = snap_to_grid(target_x);
		target_y = snap_to_grid(target_y);
	}
	else direction = round_to_dir(point_direction(x,y,obj_player.x, obj_player.y));
	
	// if npc hasn't reached til by this time something went wrong and teleport them to prevent broken game state.
	if buy_item_failsafe_timer < 1
	{
		x = _till_x;
		y = _till_y;
	}
	
	// leave state
	if (leave_shop == true)
	{
		state_current = NPC_STATE.LEAVE_SHOP;
		state_enter = true;
	}
}


state_leaveshop = function()
{
	// enter state
	if state_enter == true
	{
		clear_taken_locations();
		state_enter = false;
		target_x = global.shop_enter_pos_x;
		target_y = global.shop_enter_pos_y;
		target_x = snap_to_grid(target_x);
		target_y = snap_to_grid(target_y);
		redraw_path();
	}
	
	// state
	target_x = global.shop_enter_pos_x;
	target_y = global.shop_enter_pos_y;
	target_x = snap_to_grid(target_x);
	target_y = snap_to_grid(target_y);
	
	// leave state
	if (point_distance(x,y,target_x, target_y) < move_speed)
	{
		in_store_shoppers_pos = find_list_pos_name(global.in_store_shoppers,name);
		in_store_shopper_objects_pos = find_list_pos_name(global.in_store_shopper_objects, name);
		 show_debug_message(string(name) + " shopper pos: " + string(in_store_shoppers_pos));
		 show_debug_message(string(name) + " find_list_pos: " + string(find_list_pos_name(global.in_store_shoppers,name)));
		 show_debug_message(string(name) + " shopper obj pos: " + string(in_store_shopper_objects_pos));
		 show_debug_list(global.in_store_shoppers);
		ds_list_delete(global.in_store_shopper_objects, in_store_shopper_objects_pos);
		transfer_shopper(global.in_store_shoppers[|in_store_shoppers_pos], global.in_store_shoppers, global.shopper_list);
		instance_destroy();
	}
}

// initialize state
state_current = NPC_STATE.ENTER_SHOP;
state = state_entershop;