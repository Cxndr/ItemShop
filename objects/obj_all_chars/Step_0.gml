set_variable_depth();
scr_tile_depth_reset()


/* SCRAPPED ENTIRELY - TOO MUCH OVERHEAD AND COMPLEXITY FOR SUCH A SMALL PROBLEM
/* - USING OBJECTS INSTEAD OF TILES WHERE WE NEED DEPTH-Y STYLE DEPTH SORTING NOW.
// depth system
scr_tile_depth_reset();

if instance_exists(obj_sensor_depth)
{
	//ds_list_clear(char_colliding_list);
	//collision_rectangle_list(x-11,y-18,x+11,y+11,obj_all_chars,false,true,char_colliding_list,false);
	// note - this input is only checking vs other chars mask (does not include head)
	// so while we are using rectangle to check, it won't work for vertical stacking downward.
	// atm we aren't using any objects that need this, would need to use rectangle_in_rectangle if we do.
	
	var _original_list = char_colliding_list;
	with(obj_all_chars)
	{
		if (id != other.id)
		{
			// magic numbers for mask that includes head (sprite masks do not).
			if (rectangle_in_rectangle(x-11,y-18,x+11,y+11,other.x-11,other.y-18,other.x+11,other.y+11))
			{
				if (!is_undefined(ds_list_find_index(_original_list, self)))
				{
					ds_list_add(_original_list, self);
				}
				//show_debug_message(string(name) + ": ------- LIST IN LIST ------")
				//show_debug_list(char_colliding_list);
				with(char_colliding_list)
				{
					if (!is_undefined(ds_list_find_index(_original_list, self)))
					{
						ds_list_add(_original_list, self);
					}
				}
			}
		}
	}
	show_debug_message("-------- " + string(name) + "s list" + " --------");
	show_debug_list(_original_list);
	
	
	// reset
	if (depth_sensored == true)
	{
		var _coll_ds = false;
		for (var _i=0; _i < ds_list_size(char_colliding_list); _i++)
		{
			if (char_colliding_list[|_i].depth_sensored == true) _coll_ds = true;
		}
		if (instance_place(x,y,obj_sensor_depth) == noone and _coll_ds == false)
		{
			depth_sensored = false;
		}
	}

	// spread false
	if (depth_sensored == false)
	{
		for (var _i=0; _i < ds_list_size(char_colliding_list); _i++)
		{
			with char_colliding_list[|_i]
			{
				if (instance_place(x, y, obj_sensor_depth) == false) depth_sensored = false;
			}
		}
	}
	
	// spread true
	if (ds_list_empty(char_colliding_list) == false and depth_sensored == true)
	{
		for (var _i=0; _i < ds_list_size(char_colliding_list); _i++)
		{
			char_colliding_list[|_i].depth_sensored = true;
		}
	}

	//ds_list_clear(char_colliding_list);
}

*/