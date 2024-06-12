/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

collision_instance.sprite_index = spr_slip_collision;

spr_static = new ProfileSprite(spr_slip_static_l, spr_slip_static_r);
spr_move = new ProfileSprite(spr_slip_move_l, spr_slip_move_r);
spr_jump = undefined;
spr_jump_fall = undefined;
spr_jump_mid = undefined;
spr_cac_atk = new ProfileSprite(spr_slip_cac_atk_l, spr_slip_cac_atk_r);
spr_distance_atk = new ProfileSprite(spr_slip_distance_atk_l, spr_slip_distance_atk_r);
spr_special_atk = undefined;
spr_death = new ProfileSprite(spr_slip_death_l, spr_slip_death_r);
spr_root = "spr_slip_";
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
fireproof = true;
// ### Spécifique ###
instance_draw = instance_create_depth(x, y, depth + 2, obj_draw);
spr_instance_draw = new ProfileSprite(spr_slip_shadow_l, spr_slip_shadow_r);
fire_ball_spd = 3.6;