// Params hérités
event_inherited();
// déplacement
walkspd = 6; // vitesse de base en ligne droite
spd = walkspd;
diagspd = round(sqrt(2)/2 * spd);
dash_spd = 14;
nb_jump = 0;
nb_jump_max = 2;
jump_spd = -9;
// stats
hp_max = 100;
hp = hp_max;
// Frame d'invincibilite
tmp_invincibilty = false;
// instance de collision
collision_instance.sprite_index = spr_yobite_collision;
// gestion cac
bite_basic_atk = undefined;
bite_arrow_dash = undefined;
bite_360 = undefined;
bite_manon = undefined;
// indicateurs
hp_bar = instance_create_depth(x,y,obj_controller.depth,obj_hp_bar);
touchable = false;
// timer boost
boost_timer_max = 500;
boost_timer = boost_timer_max;
// timer dash
dash_timer_max = 20;
dash_timer = dash_timer_max;
// gestion mort
instance_dead = undefined;
snd_pain = snd_yobite_pain;
snd_death = snd_yobite_death;
// gestion sprite
spr_static = new ProfileSprite(spr_yobite_static_l, spr_yobite_static_r);
spr_move = new ProfileSprite(spr_yobite_move_l, spr_yobite_move_r);
spr_jump = new ProfileSprite(spr_yobite_jump_l, spr_yobite_jump_r);
spr_jump_fall = new ProfileSprite(spr_yobite_jump_fall_l, spr_yobite_jump_fall_r);
spr_jump_mid = new ProfileSprite(spr_yobite_jump_mid_l, spr_yobite_jump_mid_r);
spr_basic_atk = new ProfileSprite(spr_yobite_basic_atk_l, spr_yobite_basic_atk_r);
spr_dash_atk = new ProfileSprite(spr_yobite_arrow_l, spr_yobite_arrow_r);
spr_360 = new ProfileSprite(spr_yobite_360_l, spr_yobite_360_r);
spr_manon = new ProfileSprite(spr_yobite_manon_atk_l, spr_yobite_manon_atk_r);
spr_regen = new ProfileSprite(spr_yobite_regen_l, spr_yobite_regen_r);
spr_root = "spr_yobite_"
init_profile_sprites();
// gestion camp
player_side = true;
// gestion energy
energy_max = 100;
energy = energy_max;
energy_bar = instance_create_depth(x,y,obj_controller.depth,obj_energy_bar);
energy_timer_max = 80;
energy_timer = energy_timer_max;
// gestion foutre
foutre_max = 100;
foutre = 100;
foutre_bar = instance_create_depth(x,y,obj_controller.depth,obj_foutre_bar);
foutre_timer_max = 40;
foutre_timer = foutre_timer_max;
// gestion boost et regen
inventory = {
	regen: {
		stock: 1,
		stock_max: 3
	},
	boost: {
		stock: 1,
		stock_max: 3
	},
}
// Gestion particules
particle_system = part_system_create_layer(LAYER_YOBITE,0);
particle_type_hit = scr_particle_hit(spr_boost_particle,0.2,0.3,0,359,5,60);
particle_type_spark = scr_particle_spark(spr_boost_particle,0.5,1,30,60,0,180,1.5,2.5);
depth = layer_get_depth(LAYER_YOBITE) - 1;