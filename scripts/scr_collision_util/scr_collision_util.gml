function scr_move() {
	if (other.freeze) {
		other.hspd = 0;	
	}
	var _hspd = (other.hspd/other.slow) + other.conveyor_hspd;
	if place_meeting(x + _hspd, y, obj_collision)
	{
		while (!place_meeting(x + sign(_hspd), y , obj_collision))
		{
			x = x + sign(_hspd);
		}
		_hspd = 0;
		other.hspd = 0;
	}

	var _vspd = other.vspd/other.slow;
	if place_meeting(x, y + _vspd, obj_collision)
	{
		while (!place_meeting(x, y + sign(_vspd) , obj_collision))
		{
			y = y + sign(_vspd);
		}
		if (other.vspd > 0) {
			other.nb_jump = 0;	
		}
		_vspd = 0;
		other.vspd = 0;
	}
	x = x + _hspd;
	y = y + _vspd;
	other.x = x;
	other.y = y;
}

function scr_move_ia() {
	if (other.freeze) {
		other.hspd = 0;	
	}
	var _hspd = (other.hspd/other.slow) + other.conveyor_hspd;
	if place_meeting(x + _hspd, y, obj_collision) || (!other.push_limit && place_meeting(x + _hspd, y , obj_limit))
	{
		while (!place_meeting(x + sign(_hspd), y , obj_collision) && !place_meeting(x + sign(_hspd), y , obj_limit))
		{
			x = x + sign(_hspd);
		}
		_hspd = 0;
		other.hspd = 0;
	}

	var _vspd = other.vspd/other.slow;
	if place_meeting(x, y + _vspd, obj_collision)
	{
		while (!place_meeting(x, y + sign(_vspd) , obj_collision))
		{
			y = y + sign(_vspd);
		}
		if (other.vspd > 0) {
			other.nb_jump = 0;	
		}
		_vspd = 0;
		other.vspd = 0;
	}
	x = x + _hspd;
	y = y + _vspd;
	other.x = x;
	other.y = y;
}

/*
function scr_move_ia() {
	if (freeze) {
		hspd = 0;
	}
	
	var _hspd = (hspd/slow) + conveyor_hspd;
	if place_meeting(x +_hspd, y , obj_collision) || (!push_limit && place_meeting(x + _hspd, y , obj_limit))
	{
		while (!place_meeting(x + sign(_hspd), y , obj_collision) && !place_meeting(x + sign(_hspd), y , obj_limit))
		{
			x = x + sign(_hspd);
		}
		previous_hspd = _hspd;
		hspd = 0;
		_hspd = 0;
	}
	
	if place_meeting(x, y + vspd , obj_collision)
	{
		while (!place_meeting(x , y + sign(vspd) , obj_collision) && !place_meeting(x , y + sign(vspd) , obj_limit))
		{
			y = y + sign(vspd);
		}
		vspd = 0;
	}
	
	x = x + _hspd;
	y = y + vspd/slow;
	x = x;
	y = y;
}*/