// get input
key_left = global.key_left_pressed;
key_right = global.key_right_pressed;
key_up = global.key_up_pressed;
key_down = global.key_down_pressed;
key_select = global.key_enter_pressed;

// get string length
price_string_size = string_length(string(price));

// select position
if (key_right)	sel_pos += 1;
else if (key_left) sel_pos -= 1;

// loop sel_pos based on max/min
if (sel_pos > price_string_size) sel_pos = 1;
else if (sel_pos < 1) sel_pos = price_string_size;

// change value
if (key_up or key_down) 
{
	var _string_post = string_copy(string(price), sel_pos, string_length(string(price)) );
	var _place_value = place_value(string_length(_string_post));
	if (key_up)	price += _place_value;
	if (key_down) price -= _place_value;
}

if (key_select)
{
	obj_dialogue_sell.select_price = false;
	obj_dialogue_sell.chosen_price = price;
	instance_destroy();
}