function scr_tile_depth_reset(){ // resets object depth back to original value
	var _inst = instance_place(x, y, obj_sensor_depth);
	if(!_inst) depth = layer_get_depth("counters_above") + 99 - self.bbox_bottom/10;
}