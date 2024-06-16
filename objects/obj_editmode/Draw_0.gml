

if (display_objectpreview == true)
{
	draw_sprite_ext(
		object_get_sprite(selected_object), 0, 
		mouse_x_snap, 
		mouse_y_snap,
		1,1,0, c_white, objectpreview_alpha);
}