// mechanical variables
wait_timer = 0;
buyer_cycle_count = 0;
buyer_cycles_active = false;
found_shopper = false;
selected_shopper = noone;
selected_shopper_obj = noone;
sell_menu_created = false;

// functions
function set_wait_timer()
{
	randomize();
	wait_timer = irandom_range(3*60, 6*60);
}


function end_sale_period()
{
	for (var _i=0; _i < ds_list_size(global.in_store_shopper_objects); _i++)
	{
		global.in_store_shopper_objects[|_i].leave_shop = true;	
	}
	obj_player.movement = true;
}


function activate_sale_period()
{
	show_debug_list(global.shopper_list);
	
	if (buyer_cycles_active) exit;
	
	obj_player.movement = false;
	//// play bell ring sound
	
	obj_npc_manager.enter_shoppers(5);
	
	// set buyer cycles
	buyer_cycle_count = irandom_range(4,7); // make this go up with selling level once implemented
	buyer_cycles_active = true;
	set_wait_timer();
	
}

