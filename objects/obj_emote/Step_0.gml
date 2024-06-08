timer -= 1;
if timer < 1
{
	instance_destroy();	
}

if (instance_exists(speaker))
{
	x = speaker.x - 12;
	y = speaker.y - (speaker.sprite_height-5);
}