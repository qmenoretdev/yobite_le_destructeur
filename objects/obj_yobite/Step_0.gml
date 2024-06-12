event_inherited();

var _press_right = keyboard_check(vk_right); // aller à droite
var _press_left = keyboard_check(vk_left); // aller à gauche
//var _press_down = keyboard_check(vk_down); // se baisser
//var _press_up = keyboard_check(vk_up); // se relever
var _press_jump = keyboard_check_pressed(vk_space); // sauter
var _press_z = keyboard_check_pressed(ord("Z")); // georgette
var _press_e = keyboard_check(ord("E")); // 
var _press_d = keyboard_check_pressed(ord("D")); // dash bite en avant
var _press_r = keyboard_check(ord("R")); // tir de sperme
var _press_c = keyboard_check_pressed(ord("C")); // regen
var _press_v = keyboard_check_pressed(ord("V")); // boost

if (action == PLAYER_REGEN || action ==  PLAYER_BOOST) {
	_press_left = 0;
	_press_right = 0;
}

var _move = _press_right - _press_left;

// mouvement

if (nb_jump == 0 && vspd > 0) {
	nb_jump = 1;
}

var _jump_spd = jump_spd;
var _grav = grav;

if (action != PLAYER_DICK_ARROW) {
	vspd = vspd + _grav;
	invinc = false;
} else {
	invinc = true;	
}

if (_press_jump && nb_jump < nb_jump_max && action != PLAYER_DICK_ARROW) {
	vspd = _jump_spd;
	nb_jump++;
	var _jump_animation = instance_create_depth(x,y,depth-1,obj_end);
	_jump_animation.sprite_index = spr_jump_effect;
	_jump_animation.image_xscale = 0.5;
	_jump_animation.image_yscale = 0.5;
}

var _floor_collision = false;
with (collision_instance) {
	_floor_collision = place_meeting(x, y + 1, obj_collision);
}

hspd = action != PLAYER_DICK_ARROW ? (_move * walkspd * acceleration) : (dash_spd * (array_contains(spr_l, sprite_index) ? -1 : 1));
if (hspd == 0) {
	acceleration = acceleration_min;
} else if (_floor_collision) {
	if (acceleration < acceleration_max) {
		if (acceleration * acceleration_spd > acceleration_max) {
			acceleration = acceleration_max;
		} else {
			acceleration *= acceleration_spd;
		}
	}
} else if (!_floor_collision) {
	acceleration = acceleration_max;
}

// Gestion actions

with (collision_instance) {
	scr_move();
}

switch (action) {
	case ACTION_PACIFIST:
		if (hspd == 0 && vspd == 0) {
			sprite_index = scr_get_profile_sprite(spr_static);
		} else if (hspd != 0) {
			if (_floor_collision) {
				sprite_index = hspd > 0 ? spr_move.right : spr_move.left;
			} else {
				if (vspd > 0) {
					if (vspd < 2) {
						sprite_index = hspd > 0 ? spr_jump_mid.right : spr_jump_mid.left;
						image_index = 1;
					} else {
						sprite_index = hspd > 0 ? spr_jump_fall.right : spr_jump_fall.left;
					}
				} else {
					if (vspd > -2) {
						sprite_index =  hspd > 0 ? spr_jump_mid.right : spr_jump_mid.left;
						image_index = 0;
					} else {
						sprite_index = hspd > 0 ? spr_jump.right : spr_jump.left;
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
		if (_press_c && inventory.regen.stock > 0 && hp < hp_max) {
			action = PLAYER_REGEN;
			inventory.regen.stock--;
		}
		if (_press_v && inventory.boost.stock > 0 && boost == 1) {
			action = PLAYER_BOOST;
			inventory.boost.stock--;
		}
		if (_press_z) {
			if (!scr_instance_exist_custom(bite_basic_atk)) {
				action = PLAYER_BASIC_GEORGETTE;
				bite_basic_atk = scr_cac(self, obj_bite_basic_atk);
				bite_basic_atk.sprite_index = scr_get_profile_sprite(bite_basic_atk.spr_atk);
				bite_basic_atk.image_angle = image_angle;
				bite_basic_atk.damage = bite_basic_atk.damage * boost;
				sprite_index = scr_get_profile_sprite(spr_basic_atk);
				image_index = 0;
			}
		}
		if (_press_d) {
			if (!scr_instance_exist_custom(bite_arrow_dash) && energy >= 20) {
				energy -= 30;
				action = PLAYER_DICK_ARROW;
				bite_arrow_dash = scr_cac(self, obj_bite_arrow_dash);
				bite_arrow_dash.sprite_index = scr_get_profile_sprite(bite_arrow_dash.spr_atk);
				bite_arrow_dash.image_angle = image_angle;
				bite_arrow_dash.damage = bite_arrow_dash.damage * boost;
				sprite_index = scr_get_profile_sprite(spr_dash_atk);
				image_index = 0;
				vspd = 0;
				dash_timer = 0;
				var _jump_animation = instance_create_depth(x,y,depth-1,obj_end);
				_jump_animation.sprite_index = spr_jump_effect;
				_jump_animation.image_xscale = 0.5;
				_jump_animation.image_yscale = 0.5;
			}
		}
		if (_press_e) {
			if (!scr_instance_exist_custom(bite_360) && energy >= 10) {
				energy -= 20;
				action = PLAYER_360_GEORGETTE;
				bite_360 = scr_cac(self, obj_bite_360_atk);
				bite_360.sprite_index = scr_get_profile_sprite(bite_360.spr_atk);
				bite_360.image_angle = image_angle;
				bite_360.damage = bite_360.damage * boost;
				bite_360.bite_back_draw.sprite_index = bite_360.sprite_index == bite_360.spr_atk.left ? spr_bite_360_atk_back_l : spr_bite_360_atk_back_r;
				bite_360.bite_front_draw.sprite_index = bite_360.sprite_index == bite_360.spr_atk.left ? spr_bite_360_atk_front_l : spr_bite_360_atk_front_r;
				sprite_index = scr_get_profile_sprite(spr_360);
				image_index = 0;
			}
		}
		if (_press_r && foutre >= 10) {
			foutre -= 10;
			action = PLAYER_MANON_NO_JUTSU;
			bite_manon = instance_create_depth(x,y,depth-1,obj_bite_shoot);
			bite_manon.sprite_index = scr_get_profile_sprite(bite_manon.spr_atk);
			bite_manon.image_angle = image_angle;
			bite_manon.damage = bite_manon.damage * boost;
			sprite_index = scr_get_profile_sprite(spr_manon);
			image_index = 0;
		}
		break;
	case PLAYER_BASIC_GEORGETTE:
		if (image_index > sprite_get_number(sprite_index) - 1) {
			action = ACTION_PACIFIST;
			instance_destroy(bite_basic_atk);
		}
		break;
	case PLAYER_DICK_ARROW:
		vspd = 0;
		if (dash_timer == dash_timer_max) {
			action = ACTION_PACIFIST;
			instance_destroy(bite_arrow_dash);
		} else {
			dash_timer++;
		}
		break;
	case PLAYER_360_GEORGETTE:
		if (image_index > sprite_get_number(sprite_index) - 1) {
			action = ACTION_PACIFIST;
			instance_destroy(bite_360);
		}
		break;
	case PLAYER_MANON_NO_JUTSU:
		if (image_index > sprite_get_number(sprite_index) - 1) {
			action = ACTION_PACIFIST;
		}
		break;
	case PLAYER_BOOST:
		action = ACTION_PACIFIST;
		boost = 2;
		boost_timer = 0;
		break;
	case PLAYER_REGEN:
		if (!scr_is_sprite(spr_regen)) {
			sprite_index = scr_get_profile_sprite(spr_regen);
			image_index = 0;
		} else {
			if (image_index >= sprite_get_number(sprite_index) - 1) {
				action = ACTION_PACIFIST;
				if (hp < hp_max) {
					if (hp + 30 > hp_max) {
						hp = hp_max;
					} else {
						hp += 30;	
					}
				}
			}
		}
		break;
}

if (scr_instance_exist_custom(bite_basic_atk)) {
	bite_basic_atk.x = x;
	bite_basic_atk.y = y;
	if (action != PLAYER_BASIC_GEORGETTE) {
		instance_destroy(bite_basic_atk);	
	}
}

if (scr_instance_exist_custom(bite_arrow_dash)) {
	bite_arrow_dash.x = x;
	bite_arrow_dash.y = y;
	if (action != PLAYER_DICK_ARROW) {
		instance_destroy(bite_arrow_dash);	
	}
}

if (scr_instance_exist_custom(bite_360)) {
	bite_360.x = x;
	bite_360.y = y;
	if (scr_instance_exist_custom(bite_360.bite_front_draw)) {
		bite_360.bite_front_draw.x = x;	
		bite_360.bite_front_draw.y = y;
	}

	if (scr_instance_exist_custom(bite_360.bite_back_draw)) {
		bite_360.bite_back_draw.x = x;	
		bite_360.bite_back_draw.y = y;
	}
	if (action != PLAYER_360_GEORGETTE) {
		instance_destroy(bite_360);	
	}
}

if (scr_instance_exist_custom(bite_manon)) {
	bite_manon.x = x;
	bite_manon.y = y;
	if (action != PLAYER_MANON_NO_JUTSU) {
		instance_destroy(bite_manon);	
	}
}

if (instance_exists(obj_camera)) {
	obj_camera.x = x;
	obj_camera.y = y;
}

// gestion objets liés
if scr_instance_exist_custom(hp_bar) {
	hp_bar.x = x-(global.port_width/2)+(sprite_get_height(hp_bar.sprite_index));
	hp_bar.y = y-(global.port_height/2)+(sprite_get_height(hp_bar.sprite_index));
}

if scr_instance_exist_custom(energy_bar) {
	energy_bar.x = x-(global.port_width/2)+(sprite_get_height(energy_bar.sprite_index));
	energy_bar.y = y-(global.port_height/2)+(sprite_get_height(energy_bar.sprite_index)*2.5);
}

if scr_instance_exist_custom(foutre_bar) {
	foutre_bar.x = x-(global.port_width/2)+(sprite_get_height(foutre_bar.sprite_index));
	foutre_bar.y = y-(global.port_height/2)+(sprite_get_height(foutre_bar.sprite_index)*4);
}

if (foutre < foutre_max && burning_timer == burning_timer_max) {
	if (foutre_timer > 0) {
		foutre_timer--;
	} else {
		foutre_timer = foutre_timer_max;
		foutre += boost;
		if (foutre > foutre_max) {
			foutre = foutre_max;	
		}
	}
}

if (energy < energy_max) {
	if (energy_timer > 0) {
		energy_timer--;
	} else {
		energy_timer = energy_timer_max;
		energy += boost;
		if (energy > energy_max) {
			energy = energy_max;	
		}
	}
}

if (boost_timer < boost_timer_max) {
	part_particles_create_color(particle_system,x,y,particle_type_hit,c_white,1);
	part_particles_create_color(particle_system,x,y,particle_type_spark,c_white,6);
}

if (hp <= 0) {
	instance_dead = instance_create_depth(x,y,depth,obj_end_yobite);
	instance_dead.image_xscale = image_xscale;
	instance_dead.image_yscale = image_yscale;
	instance_dead.sprite_index = sprite_index;
	instance_dead.image_speed = image_speed;
	instance_dead.image_angle = image_angle;
	instance_dead.image_blend = image_blend;
	instance_dead.fondu = true;
	audio_play_sound(snd_death, 1, false);
	instance_destroy();
}