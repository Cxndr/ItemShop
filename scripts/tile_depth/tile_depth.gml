function scr_tile_depth(){
	var _inst = instance_place(x, y, obj_sensor_depth);
	if(!_inst) depth = -bbox_bottom; 	
}