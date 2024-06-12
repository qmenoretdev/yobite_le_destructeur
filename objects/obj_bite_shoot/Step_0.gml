/// @description Insert description here
// You can write your code in this editor

if (image_index > sprite_get_number(sprite_index) - 3 && !has_shoot) {
	var _orientation = scr_get_orientation();
	var _projectile = scr_shoot(obj_spermatozoide, x, y + 6, 0.25, 0.25, _orientation, 7, snd_sperm_shot);
	_projectile.image_angle = 0;
	_projectile.sprite_index = _orientation == 0 ? spr_sperm_r : spr_sperm_l;
	_projectile.spr_end = _orientation == 0 ? spr_sperm_end_r : spr_sperm_end_l;
	_projectile.damage = damage;
	has_shoot = true;
}

if (image_index > sprite_get_number(sprite_index) - 1) {
	instance_destroy();
}