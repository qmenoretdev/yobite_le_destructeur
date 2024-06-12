/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

collision_instance.sprite_index = spr_spider_collision;

spr_static = new ProfileSprite(spr_spider_static_l, spr_spider_static_r);
spr_move = new ProfileSprite(spr_spider_move_l, spr_spider_move_r);
spr_jump = undefined;
spr_jump_fall = undefined;
spr_jump_mid = undefined;
spr_cac_atk = new ProfileSprite(spr_spider_cac_atk_l, spr_spider_cac_atk_r);
spr_distance_atk = new ProfileSprite(spr_spider_distance_atk_l, spr_spider_distance_atk_r);
spr_special_atk = new ProfileSprite(spr_spider_web_l, spr_spider_web_r);
spr_death = new ProfileSprite(spr_spider_death_l, spr_spider_death_r);
spr_root = "spr_spider_";
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
		width: 150,
	}
}

// ### Spécifique ###
atk_spd = walkspd * 1.5
web_capacity = 2;
timer_web_max = 658;
timer_web = timer_web_max;