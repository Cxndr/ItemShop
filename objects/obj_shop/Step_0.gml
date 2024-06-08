// buyer cycles
if (buyer_cycles_active)
{	
	if (buyer_cycle_count > 0)
	{
		show_debug_message(wait_timer);
		// wait period
		if (wait_timer > 0) wait_timer--;
		else
		{
			if (found_shopper = false)
			{
				// find shopper
				var _shopper_count = ds_list_size(global.in_store_shoppers);
				randomize();
				var _selected_shopper_i = irandom(_shopper_count-1);
				selected_shopper = global.in_store_shoppers[|_selected_shopper_i];
				selected_shopper_obj = global.in_store_shopper_objects[|_selected_shopper_i];
				found_shopper = true;
			}
			if (found_shopper = true) // found shopper true
			{
				// walk to till and buy item
				if (selected_shopper_obj.state_current != NPC_STATE.BUY_ITEM)	
				{
					selected_shopper_obj.state_current = NPC_STATE.BUY_ITEM;
				}
				if (selected_shopper_obj.at_till == true) and (sell_menu_created = false)
				{
					if (!instance_exists(obj_menu_sell))
					{
						var _sell_item = instance_create_layer(100,800,"menus", obj_dialogue_sell);	
						with (_sell_item)
						{
							buyer = other.selected_shopper;
							buyer_obj = other.selected_shopper_obj;
						}
					}
					sell_menu_created = true;
				}
				if (global.selling_cycle_done == true)
				{
					//selected_shopper_obj.buy_item = false;
					selected_shopper_obj.state_current = NPC_STATE.BROWSE;
					selected_shopper_obj.state_enter = true;
					selected_shopper_obj.at_till = false;
					found_shopper = false;
					sell_menu_created = false;
					set_wait_timer();
					global.selling_cycle_done = false;
					buyer_cycle_count--;
					//show_message("sel_shopper: " + string(selected_shopper.name)
					//	+ "\nbuy_item: " + string(selected_shopper_obj.buy_item)
					//	+ "\nfound_shopper: " + string(found_shopper)
					//	+ "\nwait_timer: " + string(wait_timer)
					//);
					
				}
			} // found_shopper
		} // wait period
	}
	else
	{
		buyer_cycles_active = false;
		end_sale_period();
	}
}