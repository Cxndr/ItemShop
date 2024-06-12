if (keyboard_check_pressed(ord("P"))) enter_shopper();


// enter_shoppers() function execution
if (enter_shoppers_count > 0)
{
	if (wait_timer > 0) wait_timer--;
	else
	{
		enter_shopper();
		enter_shoppers_count--;
		wait_timer = irandom_range(wait_timer_lower, wait_timer_upper);
	}
}