event_inherited();

counter_depth = (layer_get_depth(base_layer) + 99 - self.bbox_bottom/5) - 1;
instance_create_depth(x,y+1,counter_depth,obj_counter);