function pause_all(_ignore_objects=[])
{
	array_insert(_ignore_objects,0,obj_bootstrapper,obj_camera);
	obj_pause.ignore_objects = _ignore_objects;
	obj_pause.initiate_pause = true;
}
function unpause_all()
{
	obj_pause.initiate_unpause = true;
}