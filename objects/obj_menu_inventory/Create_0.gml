pause_all([self, obj_input, obj_editmode]);

// options
global.player_inventory_filtered.sort_name(true);
options_full = global.player_inventory_filtered.inventory_items;
option_full_len = ds_list_size(options_full);
options = ds_list_create();

// get categories
cat_list = [];
for (var _i=0; _i < option_full_len; _i++)
{
	if struct_exists(options_full[|_i], "category") array_push(cat_list,options_full[|_i].category);
}
cat_list = array_unique(cat_list);
array_sort(cat_list,true);
cat_pos = global.category_pos;
cat_len = array_length(cat_list);
show_debug_message(cat_pos);
show_debug_message(cat_len);
if (cat_pos >= cat_len) cat_pos = cat_len -1;
if (cat_len > 0) cat_selection = cat_list[cat_pos];
else cat_selection = 0;
function filter_options_cat()
{
	ds_list_clear(options);
	for (var _i = 0; _i < option_full_len; _i++)
	{
		if (struct_exists(options_full[|_i], "category") and options_full[|_i].category = cat_selection) ds_list_add(options,options_full[|_i]);
	}
	ds_list_insert(options, 0, {name:"Nothing"});
	option_len = ds_list_size(options);
	position = 0;
}
filter_options_cat();

// settings variables
list_size = 10;
width = 200;
height = 104;
border_size = 6;
margin = 16;
string_padding = 20;
draw_set_font(fnt_text); // need to set font here to get string height on create
lineheight = string_height(options[|0].name) + 2; // +2 to offset font choice - change if changing font later
desc_space = lineheight;
bg_alpha = 0.8;
description = "Which item to place?"
option_colour = c_white;
highlight_colour = #cc2745;
desc_colour = c_dkgray;
cat_colour = #997F3D;
icon_scale = 2;
icon_size = icon_scale * sprite_get_height(spr_icons);
icon_padding = 12;
icon_margin = 4;
price_margin = 30;
ui_margin = 100;
ui_margin_bot = 30;
bot_panel_padding = 24;
bot_panel_h = 150;
bot_panel_string_padding = 20;
draw_set_font(fnt_text_l);
bot_panel_lineheight = string_height(options[|1].description) + bot_panel_string_padding;
bot_panel_info_margin = 30;
bot_panel_info_padding = 4;
cat_panel_h = 60;
cat_panel_sides = 10;

// mechanical variables
option_len = ds_list_size(options);
up_key = 0;
down_key = 0;
left_key = 0;
right_key = 0;
select_key = 0;
position = global.inventory_pos;
if (position >= option_len) position = option_len -1;
display_counter = 0;
lower_pos = 0;
upper_pos = lower_pos + (list_size-1);
exit_function = -1;
