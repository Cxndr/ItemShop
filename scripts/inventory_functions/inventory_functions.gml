function create_menu_inventory()
{
	with instance_create_layer(x, y, "menus", obj_menu_inventory)
		{
			
			var _inv_list = global.player_inventory.inventory_items;
			var _filtered_list = ds_list_create();
			for (var _i=0; _i < ds_list_size(_inv_list); _i++)
			{
				for (var _j=0; _j < argument_count; _j++)
				{
					if (_inv_list[|_i].category == argument[_j])
					{
						ds_list_add(_filtered_list, _inv_list[_i]);	
					}
				}
			}
			options_full = _filtered_list;
			
			//display_counter = other.interacting_counter;
		}
}