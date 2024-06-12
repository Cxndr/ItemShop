
function string_proper(_str)
{
	_str = string_lower(_str);
    var _out = string_upper(string_char_at(_str, 1));
    _out += string_copy(_str, 2, string_length(_str) - 1);
    return _out;
}

function round_to_dir(_value)
{
	return round(_value/90)*90;
}

function snap_to_grid(_value)
{
	return ((floor(_value / obj_pathway.grid_size)) * obj_pathway.grid_size) + (obj_pathway.grid_size/2);
}

function show_debug_list(_list)
{
	show_debug_message("---------------------------");
	for (var _i=0; _i < ds_list_size(_list); _i++)
	{
		show_debug_message(_list[|_i]);	
	}
	show_debug_message("---------------------------");
}

function find_list_pos_name(_list, _name)
{
	for (var _i=0; _i<ds_list_size(_list); _i++)
	{
		if struct_exists(_list[|_i],"name") // don't double 1-liner this! - 2 ifs on 1 line doesnt work
		{
			if (_list[|_i].name = _name) return _i;
		}
		else return -2; // name variable doesn't exist
	}
	return -1;
}