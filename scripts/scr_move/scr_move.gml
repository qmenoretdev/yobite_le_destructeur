 ///@param _obj_to_start
///@param _spd
function scr_start_random_movement(_obj_to_start, _spd) {
	if (_obj_to_start.push_timer_max = 0) {
		var _hspd_choice = scr_set_random_direction();
		_obj_to_start.hspd = _hspd_choice * _spd;
	}
	return _obj_to_start.hspd;
}

function scr_set_random_direction() {
	return scr_random_choice(-1, 1);
}

function scr_get_orientation(){
	if (scr_is_this_sprites(true,"_l")) {
		return 180;
	} else {
		return 0;
	}
}