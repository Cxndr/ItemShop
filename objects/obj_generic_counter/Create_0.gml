event_inherited();

tile_size = sprite_height;
cx = x + sprite_width/2;
cy = y + sprite_height/2;

tile_above = false;
tile_below = false;
tile_left = false;
tile_right = false;
tile_above_left = false
tile_above_right = false;
tile_below_left = false;
tile_below_right = false;

// draw legs
legs_single = 25;
legs_left = 26;
legs_middle = 27;
legs_right = 28;

function draw_legs(_index)
{
	draw_sprite(sprite_index, _index, x, y+tile_size)	
}

instance_create_layer(x,y,"blocks",obj_block_counter);