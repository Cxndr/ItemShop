enum MENU_TYPE
{
	SELL_COUNTER,
	EDITMODE
}


function create_menu_inventory(_menutype) // create seperate functions for _except and _only ??
{	
	
	var _inv_list = global.player_inventory.inventory_items;
	var _filtered_list = global.player_inventory_filtered.inventory_items;
	global.player_inventory_filtered.clear();
	if (argument_count > 1)
	{
		for (var _i=0; _i < ds_list_size(_inv_list); _i++)
		{
			for (var _j=1; _j < argument_count; _j++)
			{
				if (_inv_list[|_i].category == argument[_j])
				{
					ds_list_add(_filtered_list, _inv_list[|_i]);	
				}
			}
		}
	}
	else
	{
		for (var _i=0; _i < ds_list_size(_inv_list); _i++)
		{
			ds_list_add(_filtered_list, _inv_list[|_i]);
		}
	}
	
	with instance_create_layer(x, y, "menus", obj_menu_inventory)
		{
			
			switch (_menutype)
			{
				case MENU_TYPE.SELL_COUNTER:
					exit_function = exit_display_counter;
					display_counter = obj_player.interacting_counter;
				break;
				
				case MENU_TYPE.EDITMODE:
					exit_function = exit_editmode;
			}

	//// PROBLEM: we are assigning the list to the menu object before it's create event.
	//				meaning everything that relies on the list in create event is wrong.
	// SOLUTIONS: edit create event to accomodate. or use a different global variable for a filtered list.

			//display_counter = other.interacting_counter;
		}
}

function exit_display_counter()
{
	var _display_item = display_counter.contents.inventory_items[|0];
	
	if options[|position].name = "Nothing"
	{
		if !display_counter.contents.is_empty() // if no display item dont do anything
		{
			global.player_inventory.item_add(_display_item,1);
			display_counter.contents.clear();
		}
	}
	else
	{
		if !display_counter.contents.is_empty()
		{
			global.player_inventory.item_add(_display_item,1);
			display_counter.contents.clear();
		}
		display_counter.contents.item_add(variable_clone(options[|position]),1);
		global.player_inventory.item_remove(options[|position],1);
	}
	
	global.player_inventory_filtered.clear();
}

function exit_editmode()
{
	if options[|position].name = "Nothing"
	{
		
	}
	else
	{
		obj_editmode.active = true;
		obj_editmode.selected_object = options[|position].object;
	}
	
	global.player_inventory_filtered.clear();
}