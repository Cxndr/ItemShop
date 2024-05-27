// globals
global.npc_move_speed_mult = 1;
global.shopper_list = ds_list_create();
global.in_store_shoppers = ds_list_create();

// functions
function reset_shopper_list()
{
	ds_list_copy(global.shopper_list,global.shopper_data);
}

function transfer_shopper(_shopper_struct, _from, _to)
{
	ds_list_add(_to, _shopper_struct);
	_shopper_pos = ds_list_find_index(_from, _shopper_struct);
	ds_list_delete(_from,_shopper_pos);
}


// data
function NPC () constructor
{
	name = "";
	sprite = spr_npc_1;
	base_move_speed = 1;
	move_speed = base_move_speed * global.npc_move_speed_mult;
	
}
function Shopper () : NPC () constructor
{
		
}

function initiate_shoppers()
{
	global.shopper_data = ds_list_create();
	var _npc;
	
	_npc = new Shopper()
	with(_npc)
	{
		name = "Derek";
		sprite = spr_npc_1;
		move_speed = 0.6;
	}
	ds_list_add(global.shopper_data, _npc)


	_npc = new Shopper()
	with(_npc)
	{
		name = "Piko";
		sprite = spr_char_6;
		move_speed = 1.2;
	}
	ds_list_add(global.shopper_data, _npc)
	
	_npc = new Shopper()
	with(_npc)
	{
		name = "Labella";
		sprite = spr_char_5;
		move_speed = 1;
	}
	ds_list_add(global.shopper_data, _npc)
	
	_npc = new Shopper()
	with(_npc)
	{
		name = "Hugo";
		sprite = spr_char_12;
		move_speed = 0.8;
	}
	ds_list_add(global.shopper_data, _npc)
	
	_npc = new Shopper()
	with(_npc)
	{
		name = 	"Bora";
		sprite = spr_char_15;
		move_speed = 1;
	}
	ds_list_add(global.shopper_data, _npc)
	
	_npc = new Shopper()
	with(_npc)
	{
		name = "Kai";
		sprite = spr_char_14;
		move_speed = 1.1;
	}
	ds_list_add(global.shopper_data, _npc)
	
	_npc = new Shopper()
	with(_npc)
	{
		name = "Rin";
		sprite = spr_char_1;
		move_speed = 1.1;
	}
	ds_list_add(global.shopper_data, _npc)
	
	_npc = new Shopper()
	with(_npc)
	{
		name = "Ella";
		sprite = spr_char_30;
		move_speed = 0.7;
	}
	ds_list_add(global.shopper_data, _npc)
	
	_npc = new Shopper()
	with(_npc)
	{
		name = "Hoji";
		sprite = spr_char_22;
		move_speed = 1.1;
	}
	ds_list_add(global.shopper_data, _npc)
	
	_npc = new Shopper()
	with(_npc)
	{
		name = 	"Suke";
		sprite = spr_char_18;
		move_speed = 1.1;
	}
	ds_list_add(global.shopper_data, _npc)
	
	_npc = new Shopper()
	with(_npc)
	{
		name = "Joji";
		sprite = spr_char_26;
		move_speed = 1.5;
	}
	ds_list_add(global.shopper_data, _npc)
	
	_npc = new Shopper()
	with(_npc)
	{
		name = "Gibi";
		sprite = spr_char_40;
		move_speed = 0.9;
	}
	ds_list_add(global.shopper_data, _npc)



	reset_shopper_list();

}
