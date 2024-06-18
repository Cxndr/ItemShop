var _activate_key = keyboard_check_pressed(ord("U"));
if (_activate_key)
{
	create_menu_inventory(MENU_TYPE.EDITMODE,ITEM_CATEGORY.INTERIORS);
}

// need to switch to a struct based system instead of having selected_object be an object.
// - causes problems when we need to refer to variables it has (like doublesprite) and no instance exists.

if (active == true)
{
	if (global.key_esc_pressed) 
	{
		active = false;
		display_objectpreview = false;
	}
	
	sprite_h = sprite_get_height(object_get_sprite(selected_object));
	sprite_w = sprite_get_width(object_get_sprite(selected_object));
	mouse_x_snap = snap_to_grid_topleft(mouse_x);
	mouse_y_snap = snap_to_grid_topleft(mouse_y);
	
	// draw object sprite at mouse location
	display_objectpreview = true;
	
	// if left click, place object
	var _hovered_object = collision_rectangle(
								mouse_x_snap, mouse_y_snap,
								mouse_x_snap + sprite_w, mouse_y_snap + sprite_h,
								obj_interior,false,true);
	if (global.mouse_left and !_hovered_object)
	{
		instance_create_layer(mouse_x_snap, mouse_y_snap,"player", selected_object);
		obj_pathway.redraw_path();
	}
	
	// if right click, delete object
	if (global.mouse_right)
	{
		display_delete = true;
		var _hovered_counter = instance_position(mouse_x,mouse_y,obj_counter);
		var _hovered_block = collision_rectangle(
								mouse_x_snap, mouse_y_snap,
								mouse_x_snap + sprite_w, mouse_y_snap + sprite_h,
								obj_block_interiors,false,true);
		if (_hovered_object)
		{
			instance_destroy(_hovered_object);
			instance_destroy(_hovered_counter);
			instance_destroy(_hovered_block);
			obj_pathway.redraw_path();
		}
	}
	
}