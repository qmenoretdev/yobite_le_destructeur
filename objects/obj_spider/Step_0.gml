/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (action) {
	case ACTION_CAC_ATTACK:
		if (push_timer_max == 0) {
			hspd = 0;
		}
		if (!scr_instance_exist_custom(cac)) {
			cac = instance_create_depth(x,y,depth-1,obj_dard);
			cac.sprite_index = scr_get_profile_sprite(cac.spr_atk);
			cac.damage = cac.damage * boost;
			cac.player_side = player_side;
			cac.image_speed = 0;
			cac.image_index = 0;
		}
		break;
	case ACTION_DISTANCE_ATTACK:
		if (detection.cac.spotted) {
			action = ACTION_CAC_ATTACK;
		} else if (scr_instance_exist_custom(ennemi)) {
			if (push_timer_max == 0) {
				var _direction = scr_direction_by_target_position(ennemi);
				hspd = _direction == 0 ? atk_spd : -atk_spd;
			}
		} else {
			if (attack_to_pacifist_timer < attack_to_pacifist_timer) {
				attack_to_pacifist_timer++;
			} else {
				attack_to_pacifist_timer = attack_to_pacifist_timer_max;
				action = ACTION_PACIFIST;	
			}
		}
		if (hspd == 0) {
			sprite_index = scr_get_profile_sprite(spr_static);
		} else if (push_timer_max == 0) {
			sprite_index = scr_get_profile_sprite_by_hspd(spr_distance_atk, hspd);
		}
		break;
	case ACTION_SPECIAL_ATTACK:
		hspd = 0;
	    if (!scr_is_sprite(spr_special_atk)) {
			sprite_index = scr_get_profile_sprite(spr_special_atk);
		} else if (image_index > sprite_get_number(sprite_index) - 0.5) {
			action = ACTION_PACIFIST;
			instance_create_depth(x, y + 20, layer_get_depth(LAYER_BACK), obj_web);
			web_capacity--;
		}
		break;
}

if (scr_instance_exist_custom(cac)) {
	cac.x = x;	
	cac.y = y;
	cac.image_index = image_index;
}

if (action == ACTION_PACIFIST && web_capacity > 0) {
	if (timer_web > 0) {
		timer_web--;	
	} else {
		timer_web = timer_web_max;
		action = ACTION_SPECIAL_ATTACK;
	}
}

if (hp <= 0) {
	scr_death(self, scr_get_profile_sprite(spr_death), 1, snd_death_spider);	
}