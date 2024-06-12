/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

collision_instance.sprite_index = spr_capote_collision;

spr_static = new ProfileSprite(spr_capote_static_l, spr_capote_static_r);
spr_move = new ProfileSprite(spr_capote_move_l, spr_capote_move_r);
spr_jump = undefined;
spr_jump_fall = undefined;
spr_jump_mid = undefined;
spr_cac_atk = new ProfileSprite(spr_capote_cac_atk_l, spr_capote_cac_atk_r);
spr_distance_atk = new ProfileSprite(spr_capote_distance_atk_l, spr_capote_distance_atk_r);
spr_special_atk = undefined;
spr_hide =  new ProfileSprite(spr_capote_hide_l, spr_capote_hide_r);
spr_show =  new ProfileSprite(spr_capote_show_l, spr_capote_show_r);
spr_distance_atk_draw = new ProfileSprite(spr_sterilet_distance_atk_l, spr_sterilet_distance_atk_r);
spr_death_explosion = new ProfileSprite(spr_capote_death_explosion_l, spr_capote_death_explosion_r);
spr_death_explosion_empty = new ProfileSprite(spr_capote_death_explosion_empty_l, spr_capote_death_explosion_empty_r);
spr_root = "spr_capote_";
init_profile_sprites();

// detection
detection = {
	trans_vision: false,
	cac: {
		spotted: false,
		origin: 0,
		length: 50,
		width: 50,
	},
	distance: {
		spotted: false,
		origin: 0,
		length: 300,
		width: 50,
	}
}

// ### Spécifique ###
// Gestion hide
timer_hide_max = 600;
timer_hide = scr_random_choice(100, 200, 300, 400, 500, timer_hide_max);
timer_hide_during_max = 200;
timer_hide_during = timer_hide_during_max;
// Gestion remplissage
fillingable = true;
filling_rate_max = 1;
filling_rate = 0;
fill_explosion = false;