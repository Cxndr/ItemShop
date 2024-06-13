event_inherited();

cx = x + sprite_width/2;
cy = y + sprite_height/2;

// check position
tile_above = position_meeting(cx, cy-tile_size, obj_generic_counter);
tile_below = position_meeting(cx, cy+tile_size, obj_generic_counter);
tile_left = position_meeting(cx-tile_size, cy, obj_generic_counter);
tile_right = position_meeting(cx+tile_size, cy, obj_generic_counter);
tile_above_left = position_meeting(cx-tile_size, cy-tile_size, obj_generic_counter);
tile_above_right = position_meeting(cx+tile_size, cy-tile_size, obj_generic_counter);
tile_below_left = position_meeting(cx-tile_size, cy+tile_size, obj_generic_counter);
tile_below_right = position_meeting(cx+tile_size, cy+tile_size, obj_generic_counter);