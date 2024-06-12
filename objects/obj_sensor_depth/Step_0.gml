/* SCRAPPED ENTIRELY - TOO MUCH OVERHEAD AND COMPLEXITY FOR SUCH A SMALL PROBLEM
/* - USING OBJECTS INSTEAD OF TILES WHERE WE NEED DEPTH-Y STYLE DEPTH SORTING NOW.


//Checking if something is colliding with me
var _inst = instance_place(x, y, obj_all_chars);
//show_debug_message("_inst: " + string(_inst));
if(_inst == noone)
{
	//show_debug_message(string(irandom(9)) + " not colliding with anything");
	//with(obj_all_chars)
	//{
	//	depth_sensored = false;
	//} // this won't work with multiple obj_sensor_depth in the room
	exit;
}
else
{
	//show_debug_message("COLLIDING!");
	_inst.depth_sensored = true;
}

// set depth sensored variable


// (old method)
//Creating a list for the ones that are colliding
//var _lista = ds_list_create();
////Why a list? Imagine if your player and your NPC collided with the sensor, we want them to use the system simultaneously.

//Putting collided ones on the list 
//var _coli = instance_place_list(x, y, obj_all_chars, _lista, true);




ds_list_clear(colliding_instances);
// populate list (new method)
with (obj_all_chars)
{
	if (depth_sensored == true)
	{
		ds_list_add(other.colliding_instances, self);
	}
}


//show_debug_message(ds_list_size(colliding_instances));


//Starting a loop to access the ones that collided
for(var _i = 0; _i < ds_list_size(colliding_instances); _i++)
{	
	
	//Putting the same depth as the layer		//Why 99 ? when you create a new layer it adds +100 depth so i added 99 here to be able to do the next part.      
	colliding_instances[| _i].depth = layer_get_depth("counters") + 99 - colliding_instances[| _i].bbox_bottom/10;
														//Why this part ?
														//R:  Imagine again if your player and the NPC are together with the sensor, 
														//    well we want that if one of them is a little above it is at the bottom and the other at the top.
	//show_debug_message("------------");
	//show_debug_message(string(colliding_instances[|_i].name) + ": " + string(colliding_instances[|_i].depth));
}
//Destroying the temporary list
ds_list_clear(colliding_instances);

*/


// (old method)
//Creating a list for the ones that are colliding
var _lista = ds_list_create();
//Why a list? Imagine if your player and your NPC collided with the sensor, we want them to use the system simultaneously.

//Putting collided ones on the list 
var _coli = instance_place_list(x, y, obj_all_chars, _lista, true);

//Starting a loop to access the ones that collided
for(var _i = 0; _i < ds_list_size(_lista); _i++)
{	
//Putting the same depth as the layer		//Why 99 ? when you create a new layer it adds +100 depth so i added 99 here to be able to do the next part.      
	_lista[|_i].depth = layer_get_depth("counters") + 99 - _lista[|_i].bbox_bottom/10;
														//Why this part ?
														//R:  Imagine again if your player and the NPC are together with the sensor, 
														//    well we want that if one of them is a little above it is at the bottom and the other at the top.
}