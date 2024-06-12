//var _m = "curr_dia: " + string(current_dialogue) + "\nselect_price: " + string(select_price) + "\nevaluate_price: " + string(evaluate_price);
//show_debug_message(_m)


// get input
key_select = global.key_enter_pressed;

// intro
if (chosen_price) < 1 and (current_dialogue == intro)
{
	current_dialogue = intro;
	
	// exit
	if (key_select)
	{
		current_dialogue = choosing_price;
		select_price = true;
		evaluate_price = false;
	}
}

// choosing price
if (current_dialogue == choosing_price)
{
	if sell_menu_created == false
	{
		var _sell_menu = instance_create_layer(sell_menu_x,sell_menu_y,"menus",obj_menu_sell);
		with (_sell_menu)
		{
			if (other.chosen_price > 0) 
			{
				base_value = other.chosen_price;
				//show_debug_message("using chosen price");
			}
			else
			{
				base_value = other.item.base_price;
				//show_debug_message("using base price");
			}

			// other stuff to pass in future
		}
		sell_menu_created = true;
	}

	// exit
	if (select_price = false)
	{
		evaluate_price = true;
		sell_menu_created = false;
	}
}
	
// evaluate price chosen
if (evaluate_price == true)
{
	if (chosen_price > item.base_price*very_high_perc) current_dialogue = very_high;
	else if (chosen_price > item.base_price*too_high_perc) current_dialogue = too_high;
	else if (chosen_price < item.base_price*very_low_perc) current_dialogue = very_low;
	else current_dialogue = good;
	evaluate_price = false;
}
	
// too high
if (current_dialogue == too_high) 
{	
	if (enter_key)
	{
		if patience > 0
		{
			current_dialogue = choosing_price;
			patience -= 1;
			select_price = true;
			evaluate_price = false;
		}
		else 
		{
			current_dialogue = out_of_patience;
		}
	}
}

// very high
if (current_dialogue == very_high) 
{
		
	if (key_select)
	{
		if patience > 0
		{
			current_dialogue = choosing_price;
			select_price = true;
			evaluate_price = false;
			if (patience > 4) patience -= 2;
			else patience = 0;
		}
		else current_dialogue = out_of_patience;
	}
}

// good or very low
if (current_dialogue == good) or (current_dialogue == very_low)
{
	if (key_select)
	{
		global.player_money += chosen_price;
		item.sold_price = chosen_price;
		ds_list_add(global.sold_items,item);
		// TODO - delete item from counter
		item = noone;
		current_dialogue = sold_item;
	}
}
	
// sold item
if (current_dialogue == sold_item) and (key_select)
{
	unpause_all();
	show_emote(obj_player,EMOTE.LOVE);
	show_emote(buyer_obj,EMOTE.LOVE);
	global.selling_cycle_done = true; // we have to use a global because due to pause_all we can't see any objects at this point
	instance_destroy();
}
	
// out of patience
if (current_dialogue == out_of_patience)
{
	unpause_all();
	show_emote(obj_player,EMOTE.SAD);
	global.selling_cycle_done = true;
	if (key_select)	instance_destroy();
	
}
