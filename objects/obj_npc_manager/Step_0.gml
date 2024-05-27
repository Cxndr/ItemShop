if (keyboard_check_pressed(ord("P"))) and (ds_list_size(global.shopper_list) > 0)
{

	randomize();
	shopper_select = irandom(ds_list_size(global.shopper_list)-1);
	var _npc = instance_create_layer(0,0,"player", obj_npc);
	with(_npc)
	{
		name = 	global.shopper_list[|other.shopper_select].name;
		move_speed = global.shopper_list[|other.shopper_select].move_speed;
		sprite_index = global.shopper_list[|other.shopper_select].sprite;
	}
	transfer_shopper(global.shopper_list[|shopper_select], global.shopper_list, global.in_store_shoppers);
	
}