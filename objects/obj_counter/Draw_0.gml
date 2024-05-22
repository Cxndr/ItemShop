if contents.is_empty()
{
	sprite_index = spr_counter;
	image_alpha = 0;
}
else
{
	sprite_index = spr_icons;
	image_index = contents.inventory_items[|0].icon;
	image_alpha = 1;
}

draw_self();