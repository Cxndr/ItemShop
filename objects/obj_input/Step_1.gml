global.key_left = keyboard_check(ord("A")) or keyboard_check(vk_left);
global.key_right = keyboard_check(ord("D")) or keyboard_check(vk_right);
global.key_up = keyboard_check(ord("W")) or keyboard_check(vk_up);
global.key_down = keyboard_check(ord("S")) or keyboard_check(vk_down);
global.key_enter = keyboard_check(vk_enter);


global.key_left_pressed = keyboard_check_pressed(ord("A")) or keyboard_check_pressed(vk_left);
global.key_right_pressed = keyboard_check_pressed(ord("D")) or keyboard_check_pressed(vk_right);
global.key_up_pressed = keyboard_check_pressed(ord("W")) or keyboard_check_pressed(vk_up);
global.key_down_pressed = keyboard_check_pressed(ord("S")) or keyboard_check_pressed(vk_down);
global.key_enter_pressed = keyboard_check_pressed(vk_enter);
