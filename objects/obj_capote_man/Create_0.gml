/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

collision_instance.sprite_index = spr_capote_collision;

spr_static = new ProfileSprite(spr_capote_man_static_l, spr_capote_man_static_r);
spr_move = new ProfileSprite(spr_capote_man_move_l, spr_capote_man_move_r);
spr_jump = undefined;
spr_jump_fall = undefined;
spr_jump_mid = undefined;
spr_cac_atk = new ProfileSprite(spr_capote_man_cac_atk_l, spr_capote_man_cac_atk_r);
spr_distance_atk = new ProfileSprite(spr_capote_man_distance_atk_l, spr_capote_man_distance_atk_r);
spr_special_atk = new ProfileSprite(spr_capote_man_special_atk_l, spr_capote_man_special_atk_r);
spr_hide =  new ProfileSprite(spr_capote_man_hide_l, spr_capote_man_hide_r);
spr_show =  new ProfileSprite(spr_capote_man_show_l, spr_capote_man_show_r);
spr_distance_atk_draw = new ProfileSprite(spr_sterilet_distance_atk_l, spr_sterilet_distance_atk_r);
spr_death = new ProfileSprite(spr_capote_man_death_l, spr_capote_man_death_r);
spr_root = "spr_capote_man_";
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
		length: 350,
		width: 50,
	},
	projectile: {
		spotted: false,
		origin: 0,
		length: 200,
		width: 70,
	},
}

hp_max = 400;
hp = hp_max;

// ### Spécifique ###
// Gestion hide
timer_hide_max = 600;
timer_hide = scr_random_choice(100, 200, 300, 400, 500, timer_hide_max);
timer_hide_during_max = 200;
timer_hide_during = timer_hide_during_max;
// Gestion remplissage
fillingable = true;
filling_rate_max = 20;
filling_rate = 0;
fill_explosion = false;
// attaque speciale
timer_special_atk_max = 450;
timer_special_atk = timer_special_atk_max;
special_atk_step = 0;