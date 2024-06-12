/// @description Insert description here
// You can write your code in this editor

// gestion effets

if (boost_timer < boost_timer_max) {
	boost_timer++;
	if (timer_flash_alpha = timer_flash_alpha_max) {
		if (flash_alpha = 0.7) {
			flash_alpha = 0.5;	
		} else {
			flash_alpha = 0.7;	
		}
		timer_flash_alpha = 0;
	} else {
		timer_flash_alpha++;	
	}
} else {
	boost = 1;
	timer_flash_alpha = timer_flash_alpha_max;
	flash_alpha = 0.7;
}

if (array_length(slow_effects) > 0) {
	for (var _i = 0; _i < array_length(slow_effects); _i++) {
		if (slow_effects[_i].timer > 0) {
			slow_effects[_i].timer--;
		} else {
			slow = SLOW_FACTOR;
			array_delete(slow_effects, _i, 1);
		}
	}
} else {
	slow = 1;
}
if (effect_freeze_timer < effect_freeze_timer_max) {
	effect_freeze_timer++;
} else {
	freeze = false;	
}
if (effect_pacifist_timer < effect_pacifist_timer_max) {
	effect_pacifist_timer++;
} else {
	pacifist = false;	
}

// gestion push
if (push_timer_max > 0) {
	if (push_start_timer < push_start_timer_max) {
		push_start_timer++;
	} else {
		if (push_timer < push_timer_max) {
			push_timer++;
			hspd = lengthdir_x(push_power,push_direction);
			vspd = lengthdir_y(push_power,push_direction);
		} else {
			push_start_timer = 0;
			push_timer_max = 0;
			hspd = 0;
			vspd = 0;
		}
	}
}

/// brulure
if (!fireproof) {
	if (burning_timer < burning_timer_max) {
		burning_timer++;
		if (burn_damage_timer > 0) {
			burn_damage_timer--;
		} else {
			if (!is_undefined(snd_pain) && !audio_is_playing(snd_pain)) {
				audio_play_sound_at(snd_pain,x,y,0,global.fallof_ref_dist,global.fallof_max_dist, 1, false, 1);
			}
			burn_damage_timer = burn_damage_timer_max;
			hp -= burn_damage;
			if (hp < 0) hp = 0;
		}
	} else {
		burn_damage_timer = burn_damage_timer_max;
	}
}