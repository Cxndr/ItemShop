function bound(_index, _bounds) 
{
	if(_index < _bounds[0] or _index > _bounds[1] + 0.99)
	{
		return _bounds[0];
	}
	return _index;
}

