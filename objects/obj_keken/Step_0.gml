/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

switch (action) {
	case ACTION_CAC_ATTACK:
		if (!scr_instance_exist_custom(cac)) {
			cac = instance_create_depth(x,y,depth-1,obj_mousse);
			cac.sprite_index = scr_get_profile_sprite(cac.spr_atk);
			cac.damage = cac.damage * boost;
			cac.player_side = player_side;
			cac.image_speed = 0;
			cac.image_index = 0;
		}
		break;
	case ACTION_DISTANCE_ATTACK:
		if (image_index > sprite_get_number(sprite_index) - 0.5 && can_shoot) {
			var _orientation = scr_instance_exist_custom(ennemi) 
				? point_direction(x, y, ennemi.x, ennemi.y + 15)
				: scr_get_orientation();
			var _projectile = scr_shoot(obj_capsule, x, y - 30, 1, 1, _orientation, 6, undefined);
			_projectile.image_angle = 0;
			_projectile.damage = _projectile.damage * boost;
			can_shoot = false;
		}
		break;
}

if (scr_is_sprite(spr_move)) {
	var _rotation_speed = 10;
	var _rotation = scr_get_orientation() == 0 ? -_rotation_speed : _rotation_speed;
	image_angle += _rotation;
} else {
	image_angle = 0;	
}

if (cpt_ready_to_cac > 2) {
	ready_to_cac = true;	
}

if (scr_instance_exist_custom(cac)) {
	cac.x = x;	
	cac.y = y;
	cac.image_index = image_index;
}

if (hp <= 0) {
	scr_death(self, scr_get_profile_sprite(spr_death), 1, snd_keken_death);	
}