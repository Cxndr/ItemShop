
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