// get inputs
up_key = global.key_up_pressed;
down_key = global.key_down_pressed;
left_key = global.key_left_pressed;
right_key = global.key_right_pressed;
select_key = global.key_enter_pressed;

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
	unpause_all();
	exit_function();
	ds_list_delete(options, 0); // delete "nothing" option.

	// on close
	global.inventory_pos = position;
	//if (option_len <= 1) global.inventory_pos = 0; // removed because going to pos 1 is actually good for spam placing across multiple categories
	global.category_pos = cat_pos;
	instance_destroy(self);

}