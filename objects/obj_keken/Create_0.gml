/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

collision_instance.sprite_index = spr_keken_collision;

spr_static = new ProfileSprite(spr_keken_static_l, spr_keken_static_r);
spr_move = new ProfileSprite(spr_keken_move_l, spr_keken_move_r);
spr_jump = undefined;
spr_jump_fall = undefined;
spr_jump_mid = undefined;
spr_cac_atk = new ProfileSprite(spr_keken_cac_atk_l, spr_keken_cac_atk_r);
spr_distance_atk = new ProfileSprite(spr_keken_distance_atk_l, spr_keken_distance_atk_r);
spr_special_atk = undefined;
spr_death = new ProfileSprite(spr_keken_death_l, spr_keken_death_r);
spr_root = "spr_keken_";
init_profile_sprites();

// detection
detection = {
	trans_vision: false,
	cac: {
		spotted: false,
		origin: 0,
		length: 50,
		width: 150,
	},
	distance: {
		spotted: false,
		origin: 0,
		length: 300,
		width: 150,
	}
}

// ### Spécifique ###
previous_hp = hp;
ready_to_cac = false;
cpt_ready_to_cac = 0;