// animation
image_index = 0;
image_speed = false;
function set_anim(_state) 
{
	new_anim = variable_struct_get(anims,_state);
	anim_frames = new_anim.frames;
}

anims = {
	left:		{ frames: [4,3,4,5] },
	right:		{ frames: [7,8,7,6] },
	up:			{ frames: [10,11,10,9] },
	down:		{ frames: [1,0,1,2] },
	idle_left:	{ frames: [4,4,4,4,4,4,4,4,4,4,4,4,14,15,14,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4,4] },
	idle_right:	{ frames: [7,7,7,7,7,7,7,7,7,7,7,7,16,17,16,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7,7] },
	idle_up:	{ frames: [10] },
	idle_down:	{ frames: [1,1,1,1,1,1,1,1,1,1,1,1,12,13,12,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1] },
};

set_anim("idle_down");

// settings variables
move_speed = 1.5;
diagonal_speed = 0.75;
image_xscale = 1;
image_yscale = 1;
anim_speed = 7;
corner_tolerance = 8;
interact_distance_h = 13;
interact_distance_v = 14; 


// mechanical variables
original_depth = depth; // needed for scr_tile_depth_reset();
xdir = 0;
ydir = 0;
face_dir = "down";
anim_frames = [0];
current_frame = 0;
passing_item = 0;
interacting_counter = 0;
draw_counter_sel = false;
interact_point_x = x;
interact_point_y = y;
counter_sel = noone;


// setup inventory
global.player_inventory = new Inventory();
global.player_inventory.item_add(new Banana(),20);
global.player_inventory.item_add(new HealthPotion(),20);
global.player_inventory.item_add(new WoodenShortsword(),20);
global.player_inventory.item_add(new WoodenLongsword(),20);
global.player_inventory.item_add(new Cookie(), 20);
global.player_inventory.item_add(new Strawb(), 20);
global.player_inventory.item_add(new Shortsword(), 20);
global.player_inventory.item_add(new Shortbow(), 20);
global.player_inventory.item_add(new Longbow(), 20);
global.player_inventory.item_add(new Longsword(), 20);
global.player_inventory.item_add(new WoodenStaff(), 20);
global.player_inventory.item_add(new Burg(), 20);
global.player_inventory.item_add(new DragonStaff(), 20); 