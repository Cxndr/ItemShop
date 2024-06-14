function Inventory() constructor
{
	
	inventory_items = ds_list_create();
	
	function item_find(_item_struct) // ONLY FINDS EXACT INSTANCE! - use item_find_name instead.
	{
		var _item_position = ds_list_find_index(inventory_items,_item_struct);
		return _item_position >= 0 ? _item_position : -1;
	}
	
	function item_find_name(_name) // returns id of name searched
	{
		for (var _i = 0; _i < ds_list_size(inventory_items); _i++)
		{
			if (_name == inventory_items[|_i].name) return _i;
		}
		return -1;
	}
	
	function is_empty()
	{
		return ds_list_empty(inventory_items) ? true : false;
	}
	
	function item_add(_item_struct,_quantity)
	{
		var _item_struct_name = _item_struct.name;
		var _item_position = self.item_find_name(_item_struct_name);
		if (_item_position >= 0)
		{
			inventory_items[|_item_position].quantity += _quantity;
		}
		else
		{
			ds_list_add(inventory_items,_item_struct);
			_item_position = self.item_find_name(_item_struct.name);
			inventory_items[|_item_position].quantity = _quantity;
		}
	}
	
	function item_remove(_item_struct,_quantity)
	{
		
		var _item_position = self.item_find_name(_item_struct.name);
		if (_item_position >= 0) // if item exists
		{
			inventory_items[|_item_position].quantity -= _quantity;
		}

		if (inventory_items[|_item_position].quantity <= 0)
		{
			ds_list_delete(inventory_items,_item_position);
		}
	}
	
	function item_remove_id(_id, _quantity)
	{
		inventory_items[|_id].quantity -= _quantity;
		if (inventory_items[|_id].quantity <= 0) ds_list_delete(inventory_items, _id);
	}
	
	function clear()
	{
		ds_list_clear(inventory_items);
	}
	
	function sort_name(_ascending) // ds grid method
		{
			var _grid = ds_grid_create(2,ds_list_size(inventory_items));
			
			// add all structs to a ds grid with the name in 2nd row
			for (var _i=0; _i < ds_list_size(inventory_items); _i++)
			{
				ds_grid_add(_grid,0,_i,inventory_items[|_i]);
				ds_grid_add(_grid,1,_i,inventory_items[|_i].name);
			}
			
			// sort grid and clear list
			ds_grid_sort(_grid,1,_ascending);
			ds_list_clear(inventory_items);
			
			// add structs back to list in order
			for (var _i=0; _i < ds_grid_height(_grid); _i++)
			{
				ds_list_add(inventory_items, _grid[# 0,_i]);
			}
			ds_grid_destroy(_grid);
		}
	
	
}
