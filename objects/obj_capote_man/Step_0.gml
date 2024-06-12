/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (timer_special_atk > 0) {
	timer_special_atk--;
}

var _orientation = scr_get_orientation();
var _projectile_ennemi = scr_nearest_object_visible(obj_spermatozoide);
if (scr_instance_exist_custom(_projectile_ennemi)) {
	detection.projectile.spotted = scr_rectangle_detection(self, _orientation, detection.projectile.length, detection.projectile.width, _projectile_ennemi, detection.trans_vision);
} else {
	detection.projectile.spotted = false;
}

if (!scr_is_sprite(spr_hide)) {
	image_speed = 1;
}

function local_show() {
	timer_hide_during = timer_hide_during_max;	
	sprite_index = scr_get_profile_sprite(spr_show);
	image_index = 0;
	action = ACTION_SHOW;
	image_speed = 1;
}

if (!detection.cac.spotted && !detection.distance.spotted) {
	if (action == ACTION_PACIFIST) {
		if (timer_hide > 0) {
			timer_hide--;	
		} else {
			timer_hide = timer_hide_max;	
			sprite_index = scr_get_profile_sprite(spr_hide);
			image_index = 0;
			action = ACTION_HIDE;
			hspd = 0;
		}
	} else if (action == ACTION_HIDE) {
		if (timer_hide_during > 0) {
			timer_hide_during--;	
		} else {
			local_show();
		}
	}
} else if (action == ACTION_HIDE && !detection.projectile.spotted) {
	local_show();
}

switch (action) {
	case ACTION_SPECIAL_ATTACK:
		if (!scr_is_sprite(spr_special_atk)) {
			sprite_index = scr_get_profile_sprite(spr_special_atk);	
		}
		if (image_index > sprite_get_number(sprite_index) - 1) {
			if (special_atk_step == 0) {
				special_atk_step = 1;
				for (var _i = 0; _i < 8; _i++) {
					scr_shoot(obj_magic_fire_ball,x,y-10,image_xscale,image_yscale,_i*45,6,snd_fire_ball);
				}
			} else {
				special_atk_step = 0;
				for (var _i = 0; _i < 12; _i++) {
					scr_shoot(obj_magic_fire_ball,x,y-10,image_xscale,image_yscale,_i*30,6,snd_fire_ball);
				}
			}
			timer_special_atk = timer_special_atk_max;
			action = ACTION_PACIFIST;
		}
		break;
	case ACTION_PACIFIST:
		if (detection.projectile.spotted) {
			action = ACTION_HIDE;
			image_index = 0;
		} else if (timer_special_atk == 0) {
			action = ACTION_SPECIAL_ATTACK;
			image_index = 0;
		}
		break;
	case ACTION_HIDE:
		if (image_index > sprite_get_number(sprite_index) - 1) {
			image_speed = 0;
			image_index = sprite_get_number(sprite_index) - 1;
		}
		break;
	case ACTION_SHOW:
		if (image_index > sprite_get_number(sprite_index) - 1) {
			sprite_index = scr_get_profile_sprite(spr_static);
			action = ACTION_PACIFIST;
		}
		break;
	case ACTION_CAC_ATTACK:
		if (!scr_instance_exist_custom(cac)) {
			cac = instance_create_depth(x,y,depth-1,obj_sterilet_cac);
			cac.sprite_index = scr_get_profile_sprite(cac.spr_atk);
			cac.damage = cac.damage * boost;
			cac.player_side = player_side;
			cac.image_speed = 0;
			cac.image_index = 0;
		}
		if (image_index > sprite_get_number(sprite_index) - 0.5 && detection.projectile.spotted) {
			action = ACTION_HIDE;
			image_index = 0;
		}
		break;
	case ACTION_DISTANCE_ATTACK:
		if (image_index > sprite_get_number(sprite_index) - 0.5 && can_shoot) {
			var _projectile = scr_shoot(obj_sterilet_distance, x + lengthdir_x(6, _orientation), y - 6, 1, 1, _orientation, 6, undefined);
			_projectile.image_angle = 0;
			_projectile.sprite_index = spr_sterilet_distance_atk;
			_projectile.damage = _projectile.damage * boost;
			can_shoot = false;
			if (detection.projectile.spotted) {
				action = ACTION_HIDE;
				image_index = 0;
			}
		}
		break;
}

invinc = action == ACTION_HIDE && image_index >= sprite_get_number(sprite_index) - 4;

if (scr_instance_exist_custom(cac)) {
	cac.x = x;	
	cac.y = y;
	cac.image_index = image_index;
}

if (fill_explosion) {
	scr_death(self, scr_get_profile_sprite(spr_death_explosion), 1, snd_balloon_pop);
}
if (hp <= 0) {
	scr_death(self, scr_get_profile_sprite(spr_death), 1, snd_balloon_pop);	
}