// get inputs
up_key = keyboard_check_pressed(ord("W"));
down_key = keyboard_check_pressed(ord("S"));
left_key = keyboard_check_pressed(ord("A"));
right_key = keyboard_check_pressed(ord("D"));
select_key = keyboard_check_pressed(vk_enter);

// move through menus
position += down_key - up_key;
if (down_key or up_key) global.inventory_pos = position;
if (position >= option_len) position = 0;
if (position < 0) position = option_len - 1;
cat_pos += right_key - left_key;
if (left_key or right_key) global.category_pos = cat_pos;
if (cat_pos >= cat_len) cat_pos = 0;
if (cat_pos < 0) cat_pos = cat_len - 1;

// scrolling menu
if (position > upper_pos) { lower_pos += 1; upper_pos += 1; }
if (position < lower_pos) { lower_pos -= 1; upper_pos -= 1; }

// category selection
cat_selection = cat_list[cat_pos];
if (left_key or right_key) filter_options_cat();


// execute selection
if select_key
{
	var _display_item = display_counter.contents.inventory_items[|0];
	
	if options[|position].name = "Nothing"
	{
		if !display_counter.contents.is_empty() // if no display item dont do anything
		{
			global.player_inventory.item_add(_display_item,1);
			display_counter.contents.clear();
		}
		ds_list_delete(options, 0); // delete "nothing" option.
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
		ds_list_delete(options, 0); // delete "nothing" option.
	}

	// on close
	global.inventory_pos = position;
	//if (option_len <= 1) global.inventory_pos = 0; // removed because going to pos 1 is actually good for spam placing across multiple categories
	global.category_pos = cat_pos;
	instance_destroy(self);
	unpause_all();
}