// make shopper data list
initiate_shoppers();

// mechanical
shopper_select = 0;
enter_shoppers_count = 0;
wait_timer = 0;
wait_timer_lower = 20;
wait_timer_upper = 50;
taken_browse_locations = ds_list_create()

// functions
function enter_shopper()
{
	if (ds_list_size(global.shopper_list) < 1) 
	{
		show_debug_message("no shoppers left in global list");
		return;
	}
	
	randomize();
	shopper_select = irandom(ds_list_size(global.shopper_list)-1);
	show_debug_message(global.shopper_list[|shopper_select]);
	var _npc = instance_create_layer(0,0,"player", obj_npc);
	with(_npc)
	{
		name = global.shopper_list[|other.shopper_select].name;
		move_speed = global.shopper_list[|other.shopper_select].move_speed;
		sprite_index = global.shopper_list[|other.shopper_select].sprite;
		in_store_shoppers_pos = ds_list_size(global.in_store_shoppers);
		in_store_shopper_objects_pos = ds_list_size(global.in_store_shopper_objects);
	}
	ds_list_add(global.in_store_shopper_objects,_npc);
	transfer_shopper(global.shopper_list[|shopper_select], global.shopper_list, global.in_store_shoppers);
	
}

function enter_shoppers(_count)
{
	enter_shoppers_count = _count;
}
