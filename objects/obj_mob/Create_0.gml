/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spr_static = undefined;
spr_move = undefined;
spr_jump = undefined;
spr_jump_fall = undefined;
spr_jump_mid = undefined;
spr_cac_atk = undefined;
spr_distance_atk = undefined;
spr_special_atk = undefined;
spr_root = ""

walkspd = 3;
previous_hspd = 0;
// pacifist
scr_start_random_movement(self, walkspd);
change_direction_timer_max = 60;
change_direction_timer = 0;
touch_timer_max = 100;
touch_timer = touch_timer_max;
// combat
pacifist_to_attack_timer_max = 50;
pacifist_to_attack_timer = 0;
attack_to_pacifist_timer_max = 80;
attack_to_pacifist_timer = 0;
// detection
detection = {
	trans_vision: false,
	cac: {
		spotted: false,
		origin: 0,
		length: 100,
		width: 50,
	},
	distance: {
		spotted: false,
		origin: 0,
		length: 300,
		width: 50,
	}
}
// ennemi
ennemi = undefined;
// mort
snd_death = undefined;
drop = {
	probability: 20
}
spr_death = undefined;
snd_death = undefined;
// gestion push dans obj_limit
push_limit = false;

can_shoot = false;

touchable = true;

// gestion cac situationnel
ready_to_cac = true;