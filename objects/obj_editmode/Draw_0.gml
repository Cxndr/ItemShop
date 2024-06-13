

if (display_objectpreview == true)
{
	draw_sprite_ext(
		selected_object.sprite_index, 0, 
		mouse_x_snap, 
		mouse_y_snap,
		1,1,0, c_white, objectpreview_alpha);
}