/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

function scr_local_shoot_fire_ball() {
	for (var _i = 0; _i < 5; _i++) {
		var _hspd = irandom_range(fire_ball_spd - 1, fire_ball_spd + 1) * scr_random_choice(-1, 1);
		var _vspd = -irandom_range(fire_ball_spd - 1, fire_ball_spd + 1);
		var _projectile = scr_balistic_shoot(obj_slip_fire_ball, x, y - 35, 1, 1, _hspd, _vspd, undefined);
		_projectile.image_angle = 0;
		_projectile.damage = _projectile.damage * boost;
	}
	can_shoot = false;
	audio_play_sound_at(snd_fire_ball,x,y,0,global.fallof_ref_dist, global.fallof_max_dist, 1, false, 1);
}

switch (action) {
	case ACTION_CAC_ATTACK:
		if (!scr_instance_exist_custom(cac)) {
			cac = instance_create_depth(x,y,depth+1,obj_cac_flame);
			cac.sprite_index = scr_get_profile_sprite(cac.spr_atk);
			cac.damage = cac.damage * boost;
			cac.player_side = player_side;
			cac.image_speed = 0;
			cac.image_index = 0;
			audio_play_sound_at(snd_flame,x,y,0,global.fallof_ref_dist, global.fallof_max_dist, 1, false, 1);
		}
		break;
	case ACTION_DISTANCE_ATTACK:
		if (image_index > sprite_get_number(sprite_index) - 9 && can_shoot) {
			scr_local_shoot_fire_ball();
		}
		break;
}

if (scr_instance_exist_custom(cac)) {
	cac.x = x;	
	cac.y = y;
	cac.image_index = image_index;
}

if (scr_instance_exist_custom(instance_draw)) {
	instance_draw.x = x;
	instance_draw.y = y;
	instance_draw.sprite_index = scr_get_profile_sprite(spr_instance_draw);
}

if (hp <= 0) {
	scr_death(self, scr_get_profile_sprite(spr_death), 1, snd_slip_death);
}