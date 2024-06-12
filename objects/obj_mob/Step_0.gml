var _orientation = scr_get_orientation();
ennemi = scr_nearest_object_visible(obj_yobite);
if (scr_instance_exist_custom(ennemi)) {
	detection.cac.spotted = scr_rectangle_detection(self, _orientation, detection.cac.length, detection.cac.width, ennemi, detection.trans_vision);
	detection.distance.spotted = scr_rectangle_detection(self, _orientation, detection.distance.length, detection.distance.width, ennemi, detection.trans_vision);
} else {
	detection.cac.spotted = false;
	detection.distance.spotted = false;
}
// Move
vspd = vspd + grav;

with(collision_instance) {
	scr_move_ia();
}

var _floor_collision = false;
with (collision_instance) {
	_floor_collision = place_meeting(x, y + 1, obj_collision);
}

// animation
switch (action)
{
	case ACTION_PACIFIST:
		if (hspd == 0 && vspd == 0) {
			sprite_index = scr_get_profile_sprite(spr_static);
		} else if (hspd != 0) {
			if (_floor_collision) {
				sprite_index = scr_get_profile_sprite_by_hspd(spr_move, hspd);
			} else {
				if (vspd > 0) {
					if (vspd < 2) {
						sprite_index = scr_get_profile_sprite_by_hspd(spr_jump_mid, hspd);
						image_index = 1;
					} else {
						sprite_index = scr_get_profile_sprite_by_hspd(spr_jump_fall, hspd);
					}
				} else {
					if (vspd > -2) {
						sprite_index = scr_get_profile_sprite_by_hspd(spr_jump_mid, hspd);
						image_index = 0;
					} else {
						sprite_index = scr_get_profile_sprite_by_hspd(spr_jump, hspd);
					}
				}
			}
		} else if (vspd != 0) {
			if (vspd > 0) {
				if (vspd < 2) {
					sprite_index = scr_get_profile_sprite(spr_jump_mid);
					image_index = 1;
				} else {
					sprite_index = scr_get_profile_sprite(spr_jump_fall);
				}
			} else {
				if (vspd > -2) {
					sprite_index = scr_get_profile_sprite(spr_jump_mid);
					image_index = 0;
				} else {
					sprite_index = scr_get_profile_sprite(spr_jump);
				}
			}
		}
		if (detection.cac.spotted || detection.distance.spotted) {
			hspd = 0;
			if (pacifist_to_attack_timer < pacifist_to_attack_timer_max) {
				pacifist_to_attack_timer++;	
			} else {
				pacifist_to_attack_timer = 0;
				if (detection.cac.spotted && ready_to_cac) {
					action = ACTION_CAC_ATTACK;
				} else {
					action = ACTION_DISTANCE_ATTACK;
				}
			}
		} else {
			if (hspd == 0 && vspd == 0) {
				if (change_direction_timer < change_direction_timer_max) {
					change_direction_timer++;
				} else {
					change_direction_timer = 0;
					if (previous_hspd > 0) {
						hspd = -walkspd;
					} else if (previous_hspd < 0) {
						hspd = walkspd;
					} else {
						hspd = scr_start_random_movement(self, walkspd);
					}
				}
			}
		}
		break;

	case ACTION_CAC_ATTACK:
		if (!scr_is_sprite(spr_cac_atk)) {
			sprite_index = scr_get_profile_sprite(spr_cac_atk);
			image_index = 0;
		} else if (image_index > sprite_get_number(sprite_index) - 1) {
			action = ACTION_PACIFIST;
			if (scr_instance_exist_custom(cac)) {
				instance_destroy(cac);
			}
		}
		break;
		
	case ACTION_DISTANCE_ATTACK:
		if (!scr_is_sprite(spr_distance_atk)) {
			sprite_index = scr_get_profile_sprite(spr_distance_atk);
			image_index = 0;
		} else {
			if (detection.cac.spotted && image_index > sprite_get_number(sprite_index) - 0.5 && ready_to_cac) {
				action = ACTION_CAC_ATTACK;
				image_index = 0;
			} else if (!detection.distance.spotted && image_index > sprite_get_number(sprite_index) - 0.5) {
				action = ACTION_PACIFIST;
			}
		}
		if (!can_shoot) {
			can_shoot = image_index >= 0 && image_index < 1;
		}
		break;
		
	case ACTION_TOUCH:
		hspd = 0;
		if (detection.cac.spotted && ready_to_cac) {
			action = ACTION_CAC_ATTACK;
		} else if (detection.distance.spotted) {
			action = ACTION_DISTANCE_ATTACK;
		} else {
			var _nearest_ennemi = scr_nearest_ennemi(obj_yobite);
			if (scr_instance_exist_custom(_nearest_ennemi)) {
				sprite_index = scr_sprite_by_target_position(_nearest_ennemi, spr_static);
			}
			if (touch_timer > 0) {
				touch_timer--;
			} else {
				touch_timer = touch_timer_max;
				action = ACTION_PACIFIST;
			}
		}
		break;
}

// gestion push
if (push_limit && push_timer_max = 0
		&& !collision_rectangle(collision_instance.bbox_left, collision_instance.bbox_top,
		collision_instance.bbox_right, collision_instance.bbox_bottom, obj_limit, true, false)) {
	push_limit = false;
}

// Inherit the parent event
event_inherited();