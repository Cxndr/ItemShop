enum EMOTE
{
	SILENT = 26,
	SURPRISE = 27,
	CONFUSED = 28,
	LOVE = 29,
	HAPPY = 30,
	SAD = 31,
	SLEEP = 218,
	ANNOYED = 219
}

function show_emote(_instance, _emote_enum)
{
	var _sprite = instance_create_layer(0, 0, "speech", obj_emote); // x and y set in object step
	with (_sprite)
	{
		type = _emote_enum;
		speaker = _instance;
	}
}