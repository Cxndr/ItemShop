if (keyboard_check_pressed(ord("K")))
{
	instance_create_layer(sell_menu_x, sell_menu_y,"menus", obj_menu_sell);
}

if (keyboard_check_pressed(ord("L")) or (sell_item_active))
{
	var _sell_item = instance_create_layer(100,800,"menus", obj_dialogue_sell);	
	with (_sell_item)
	{
		
	}
}
if (keyboard_check_pressed(ord("Z"))) show_emote(obj_player,EMOTE.ANNOYED);
if (keyboard_check_pressed(ord("X"))) show_emote(obj_player,EMOTE.CONFUSED);
if (keyboard_check_pressed(ord("C"))) show_emote(obj_player,EMOTE.HAPPY);
if (keyboard_check_pressed(ord("V"))) show_emote(obj_player,EMOTE.LOVE);
if (keyboard_check_pressed(ord("B"))) show_emote(obj_player,EMOTE.SAD);
if (keyboard_check_pressed(ord("N"))) show_emote(obj_player,EMOTE.SILENT);
if (keyboard_check_pressed(ord("M"))) show_emote(obj_player,EMOTE.SLEEP);
if (keyboard_check_pressed(ord("F"))) show_emote(obj_player,EMOTE.SURPRISE);