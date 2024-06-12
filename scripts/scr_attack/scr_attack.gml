///@param _obj_projectile
///@param _x_create
///@param _y_create
///@param _x_scale
///@param _y_scale
///@param _projectile_direction
///@param _projectile_speed
///@param _snd
function scr_shoot(_obj_projectile,_x_create,_y_create,_x_scale,_y_scale,_projectile_direction,_projectile_speed,_snd) {
	var _projectile = instance_create_depth(_x_create,_y_create,depth,_obj_projectile);
	_projectile.direction = _projectile_direction;
	_projectile.image_angle = _projectile.direction;
	_projectile.speed = _projectile_speed;
	_projectile.image_xscale = _x_scale;
	_projectile.image_yscale = _y_scale;
	_projectile.player_side = player_side;
	_projectile.sender = self;
	if (!is_undefined(_snd)) {
		audio_play_sound_at(_snd,x,y,0,global.fallof_ref_dist,global.fallof_max_dist,1,false,1);
	}
	return _projectile;
}

///@param _obj_projectile
///@param _x_create
///@param _y_create
///@param _x_scale
///@param _y_scale
///@param _projectile_hspd
///@param _projectile_vspd
///@param _snd
function scr_balistic_shoot(_obj_projectile,_x_create,_y_create,_x_scale,_y_scale,_projectile_hspd,_projectile_vspd,_snd) {
	var _projectile = instance_create_depth(_x_create,_y_create,depth,_obj_projectile);
	_projectile.hspd = _projectile_hspd;
	_projectile.vspd = _projectile_vspd;
	_projectile.image_xscale = _x_scale;
	_projectile.image_yscale = _y_scale;
	_projectile.player_side = player_side;
	_projectile.sender = self;
	if (!is_undefined(_snd)) {
		audio_play_sound_at(_snd,x,y,0,global.fallof_ref_dist,global.fallof_max_dist,1,false,1);
	}
	return _projectile;
}

///@param _instance_degat
///@param _target
function scr_degat(_instance_degat,_target) {
	if (scr_instance_exist_custom(_target) && !_target.invinc) {
		if (!is_undefined(_target.snd_pain) && !audio_is_playing(_target.snd_pain) && damage > 0) {
			audio_play_sound_at(_target.snd_pain,_target.x,_target.y,0,global.fallof_ref_dist,global.fallof_max_dist, 1, false, 1);
		}
		apply_effect(_instance_degat, _target);
		_target.hp -= damage;
		if (_instance_degat.object_index != obj_web && instance_exists(obj_yobite) 
			&&_target.touchable && !_target.id != obj_yobite.id 
			&& _target.action == ACTION_PACIFIST && _target.hp > 0) {
			_target.action = ACTION_TOUCH;
		}
		if (!is_undefined(snd)) {
			audio_play_sound_at(snd,other.x,other.y,0,global.fallof_ref_dist,global.fallof_max_dist, 1, false, 1);
		}
	}
}

///@param _instance_degat
///@param _target
function apply_effect(_instance_degat, _target) {
	if (scr_instance_exist_custom(_target)) {
		if (!is_undefined(_instance_degat.effect)) {
			for (var _i = 0; _i < array_length(_instance_degat.effect); _i++) {
				switch(_instance_degat.effect[_i]) {
					case EFFECT_SLOW:
						_target.slow = SLOW_FACTOR;
						array_push(_target.slow_effects, {
							object_index: _instance_degat.object_index,
							x: _instance_degat.x - _target.x,
							y: _target.y - _instance_degat.y,
							image_angle: _instance_degat.image_angle,
							timer: _instance_degat.slow_time,
						});
						break;
					case EFFECT_FREEZE:
						_target.freeze = true;
						_target.effect_freeze_timer = 0;
						break;
					case EFFECT_FILLING:
						if (_target.fillingable && _target.filling_rate < _target.filling_rate_max) {
							_target.filling_rate++;
						}
						break;
					case EFFECT_EXPLOSION_FULL:
						if (_target.fillingable && _target.filling_rate >= _target.filling_rate_max) {
							_target.fill_explosion = true;
						}
						break;
					case EFFECT_ENERGY:
						if (_instance_degat.sender.energy + 10 > _instance_degat.sender.energy_max) {
							_instance_degat.sender.energy =  _instance_degat.sender.energy_max;
						} else {
							_instance_degat.sender.energy += 10;
						}
						break;
					case EFFECT_FOAMING:
						if (variable_instance_exists(_target.id, "cpt_ready_to_cac")) {
							_target.cpt_ready_to_cac++;
						}
						break;
					case EFFECT_VIDE_COUILLE:
						if (_target.object_index == obj_yobite) {
							var _total_foutre = _target.foutre - 20;
							_target.foutre = _total_foutre < 0 ? 0 : _total_foutre;
						}
						break;
					case EFFECT_BURN:
						if (!_target.fireproof && _instance_degat.burn_probability >= random_range(0, 1)) {
							_target.burning_timer = 0;
						}
				}
			}
		}
	}
}

///@param _sender
///@param _obj_cac
function scr_cac(_sender, _obj_cac) {
	var _cac = instance_create_depth(_sender.x,_sender.y,_sender.depth-1,_obj_cac);
	_cac.sender = _sender;
	_cac.player_side = _sender.player_side;
	if (!is_undefined(_cac.snd_create)) {
		audio_play_sound_at(_cac.snd_create,_sender.x,_sender.y,0,global.fallof_ref_dist, global.fallof_max_dist, 1, false, 1);
	}
	return _cac;
}

function scr_in_attack() {
	return scr_is_this_sprites(true, "_atk_");
}