var _row = 0;
var _y;
var _x;
var _mod;

for (var _i=0; _i<sprite_count; _i++)
{
	
	_row = floor(_i/row_len);
	_mod = _i mod row_len;
	_y = _row * (sprite_size + padding);
	_x = _mod * (sprite_size + padding)
	
	draw_sprite(spr_pokemon, _i, x + _x, y + _y);
}