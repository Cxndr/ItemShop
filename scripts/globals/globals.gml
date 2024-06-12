// settings
global.sprite_scale = 3;
global.game_width = 480;
global.game_height = 270;
global.shop_x = 48;
global.shop_y = 64;
global.shop_w = 160;
global.shop_h = 176;
global.shop_enter_pos_x = 136;
global.shop_enter_pos_y = 38;
global.shop_enter_pos_fin_x = 136;
global.shop_enter_pos_fin_y = 88;

// persistent (saved) variables
global.category_pos = 0;
global.inventory_pos = 0;

// game variables
global.player_money = 100;
global.sold_items = ds_list_create();
global.selling_cycle_done = false;

// enums
enum FACE_DIR
{
	DOWN = 270,
	LEFT = 180,
	UP = 90,
	RIGHT = 0
}