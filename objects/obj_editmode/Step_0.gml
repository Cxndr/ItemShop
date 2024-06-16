var _activate_key = keyboard_check_pressed(ord("U"));
if (_activate_key)
{
	create_menu_inventory(MENU_TYPE.EDITMODE,ITEM_CATEGORY.INTERIORS);
}

//if (_activate_key) active = !active;


if (active == true)
{
	if (global.key_esc_pressed) active = false;
	
	//var _sprite_h = selected_object.sprite_height;
	var _sprite_h = sprite_get_height(object_get_sprite(selected_object));
	//var _sprite_w = selected_object.sprite_width;
	var _sprite_w = sprite_get_width(object_get_sprite(selected_object));
	mouse_x_snap = snap_to_grid_topleft(mouse_x);
	mouse_y_snap = snap_to_grid_topleft(mouse_y);
	
	// draw object sprite at mouse location
	display_objectpreview = true;
	
	// if left click, place object
	var _hovered_object = collision_rectangle(
								mouse_x_snap, mouse_y_snap,
								mouse_x_snap + _sprite_w, mouse_y_snap + _sprite_h,
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
								mouse_x_snap + _sprite_w, mouse_y_snap + _sprite_h,
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