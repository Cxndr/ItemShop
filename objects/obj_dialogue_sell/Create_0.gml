pause_all([self, obj_input]);

// settings variables
margin = 50;
padding = 20;
width = display_get_gui_width() - (margin*2);
height = 200;
x = 0 + margin;
y = display_get_gui_height() - margin - height;
sell_menu_x = x + 400;
sell_menu_y = y - margin;
lineheight = 20;
bg_alpha = 0.8;
text_color = c_white;
font = fnt_text_l;

// mechanical variables
select_price = false;
key_select = 0;
chosen_price = 0;
evaluate_price = false;
item = new Banana();
patience = 1;
sell_menu_created = false;
buyer = noone;
buyer_obj = noone;

// dialogue variables
intro = "Hey, i'd like to buy this please.";
choosing_price = "What price should we sell for?";
good = "Seems about right";
very_high = "That's way too much!";
very_high_perc = 1.5;
too_high = "Can't you bring the price down just a little";
too_high_perc = 1.35;
very_low = "Wow really!? That price is amazing!";
very_low_perc = 1.15;
out_of_patience = "We're gettin nowhere";
sold_item = "I sold a " + string(item.name) + " for " + string(chosen_price) + "!";

current_dialogue = intro;