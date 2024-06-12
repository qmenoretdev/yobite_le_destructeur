/// @description Insert description here
// You can write your code in this editor

if (timer_shoot > 0) {
	timer_shoot--;	
} else {
	timer_shoot = timer_shoot_max;
	for (var _i = 0; _i < projectile_number; _i++) {
		var _hspd = irandom_range(projectile_spd - 1, projectile_spd + 1) * scr_random_choice(-1, 1);
		var _vspd = -irandom_range(projectile_spd - 1, projectile_spd + 1);
		var _projectile = scr_balistic_shoot(projectile_object, x + x_creation_delta, y + y_creation_delta, 1, 1, _hspd, _vspd, undefined);
	}
	if (!is_undefined(snd_shoot)) {
		audio_play_sound_at(snd_shoot,x,y,0,global.fallof_ref_dist, global.fallof_max_dist, 1, false, 1);
	}
}