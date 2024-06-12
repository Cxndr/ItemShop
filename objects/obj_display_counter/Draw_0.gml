

// draw image

if (!tile_above and !tile_below and !tile_left and !tile_right)
{
	image_index = 0;
	draw_legs(legs_single);
}
else if (!tile_above and tile_below and !tile_left and !tile_right)
{
	image_index = 1;
}
else if (!tile_above and tile_below and !tile_left and tile_right and !tile_below_right)
{
	image_index = 2;
}
else if (tile_above and !tile_below and !tile_left and !tile_right)
{
	image_index = 3;
	draw_legs(legs_single);
}
else if (tile_above and tile_below and !tile_left and !tile_right)
{
	image_index = 4;
}
else if (!tile_above and tile_below and tile_left and !tile_right and !tile_below_left)
{
	image_index = 5;
}
else if (tile_above and !tile_below and !tile_left and tile_right and !tile_above_right)
{
	image_index = 6;
	draw_legs(legs_left);
}
else if (!tile_above and !tile_below and tile_left and tile_right)
{
	image_index = 7;
	draw_legs(legs_middle);
}
else if (tile_above and !tile_below and tile_left and !tile_right and !tile_above_left)
{
	image_index = 8;
	draw_legs(legs_right);
}
else if (!tile_above and !tile_below and !tile_left and tile_right)
{
	image_index = 9;
	draw_legs(legs_left);
}
else if (!tile_above and !tile_below and tile_left and !tile_right)
{
	image_index = 10;
	draw_legs(legs_right);
}
else if (!tile_above and tile_below and !tile_left and tile_right and tile_below_right)
{
	image_index = 11;
}
else if (!tile_above and tile_below and tile_left and tile_right)
{
	image_index = 12;
}
else if (!tile_above and tile_below and tile_left and !tile_right and tile_below_left)
{
	image_index = 13;
}
else if (tile_above and !tile_below and !tile_left and tile_right and tile_above_right)
{
	image_index = 14;
	draw_legs(legs_left);
}
else if (tile_above and !tile_below and tile_left and tile_right)
{
	image_index = 15;
	draw_legs(legs_middle);
}
else if (tile_above and !tile_below and tile_left and !tile_right and tile_above_left)
{
	image_index = 16;
	draw_legs(legs_right);
}
else if (tile_above and tile_below and !tile_left and tile_right)
{
	image_index = 17;
}
else if (tile_above and tile_below and tile_left and !tile_right)
{
	image_index = 18;
}
else if (tile_above and tile_below and tile_left and tile_right)
{
	image_index = 19;
}


draw_self();


