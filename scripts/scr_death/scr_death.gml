///@param _obj_dead
///@param _spr_death
///@param _image_speed
function scr_death(_obj_dead, _spr_death, _image_speed, _snd) {
	
	var _dead = instance_create_depth(_obj_dead.x,_obj_dead.y,_obj_dead.depth,obj_end);
	_dead.image_xscale = _obj_dead.image_xscale;
	_dead.image_yscale = _obj_dead.image_yscale;
	if (!is_undefined(_spr_death)) {
		_dead.sprite_index = _spr_death;
		if (_dead.sprite_index = _obj_dead.sprite_index) {
			_dead.image_index = _obj_dead.image_index;
		}
	} else {
		_dead.sprite_index = _obj_dead.sprite_index;
	}
	_dead.image_speed = _image_speed;
	_dead.image_angle = _obj_dead.image_angle;
	_dead.image_alpha = _obj_dead.image_alpha;
	_dead.image_blend = _obj_dead.image_blend;
	_dead.fondu = true;
	
	if (!is_undefined(_snd) && audio_exists(_snd)) {
		audio_play_sound_at(_snd,x,y,0,global.fallof_ref_dist, global.fallof_max_dist, 1, false, 1);
	}
	/*var _drop = irandom_range(0, 100);
	if (_drop <= _obj_dead.drop.probability) {
		audio_play_sound_at(snd_boost_drop,x,y,0,global.fallof_ref_dist, global.fallof_max_dist, 1, false, 1);
	}*/
	instance_destroy(_obj_dead);
}
