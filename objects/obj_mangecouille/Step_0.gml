/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

var _orientation = scr_get_orientation();
sperm = scr_nearest_object_visible(obj_spermatozoide);
if (scr_instance_exist_custom(sperm)) {
	detection.sperm.spotted = scr_rectangle_detection(self, _orientation, detection.sperm.length, detection.sperm.width, sperm, detection.trans_vision);
} else {
	detection.sperm.spotted = false;
}
capote = scr_nearest_capote_fill_visible();
if (scr_instance_exist_custom(capote)) {
	detection.capote.spotted = scr_rectangle_detection(self, _orientation, detection.capote.length, detection.capote.width, capote, detection.trans_vision);
}else {
	detection.capote.spotted = false;
}
switch (action) {
	case ACTION_PACIFIST:
		if (detection.sperm.spotted || detection.capote.spotted ) {
			action = ACTION_SPECIAL_ATTACK;
		}
		break;
	case ACTION_CAC_ATTACK:
		if (push_timer_max == 0) {
			hspd = 0;
		}
		if (!scr_instance_exist_custom(cac)) {
			cac = instance_create_depth(x,y,depth-1,obj_mangecouille_bite);
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
		} else if (detection.sperm.spotted) {
			action = ACTION_SPECIAL_ATTACK;
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
			mange_sperm = instance_create_depth(x, y, depth, obj_mange_sperm);
			mange_sperm.sprite_index = scr_get_profile_sprite(mange_sperm.spr_atk)
			mange_sperm.sender = self;
		} else if (image_index > sprite_get_number(sprite_index) - 1) {
			if (detection.sperm.spotted || detection.capote.spotted ) {
				image_speed = 0;
				image_index = sprite_get_number(sprite_index) - 1;
			} else {
				image_index = 0;
				sprite_index = scr_get_profile_sprite(spr_static);
				action = ACTION_PACIFIST;
			}
		}
		break;
}

if (action != ACTION_SPECIAL_ATTACK) {
	if (scr_instance_exist_custom(mange_sperm)) {
		instance_destroy(mange_sperm);
	}
	image_speed = 1;
}

if (scr_instance_exist_custom(mange_sperm)) {
	mange_sperm.x = x;	
	mange_sperm.y = y;
}

if (scr_instance_exist_custom(cac)) {
	cac.x = x;	
	cac.y = y;
	cac.image_index = image_index;
}

if (hp <= 0) {
	scr_death(self, scr_get_profile_sprite(spr_death), 1, snd_mangecouille_death);	
}