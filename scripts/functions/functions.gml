
function string_proper(_str)
{
	_str = string_lower(_str);
    var _out = string_upper(string_char_at(_str, 1));
    _out += string_copy(_str, 2, string_length(_str) - 1);
    return _out;
}