

function scr_tile_depth_reset(){ // resets object depth back to original value
	var _inst = instance_place(x, y, obj_sensor_depth);
	if(!_inst) 
	{
		set_variable_depth();
	}
}

function set_variable_depth()
{
	depth = layer_get_depth(base_layer) + 99 - self.bbox_bottom/5;
}
