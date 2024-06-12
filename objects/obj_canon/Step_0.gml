/// @description Insert description here
// You can write your code in this editor

ennemi = scr_nearest_object_visible(obj_yobite);
if (scr_instance_exist_custom(ennemi)) {
	detection.distance.spotted = distance_to_object(ennemi) < detection.distance.length
} else {
	detection.distance.spotted = false;
}

if (detection.distance.spotted && scr_instance_exist_custom(ennemi)) {
	scr_follow_point(ennemi.x, ennemi.y, self, 2, 3);
	if (timer_shoot == timer_shoot_max) {
		sprite_index = spr_canon_shoot;
	}
}

if (timer_shoot < timer_shoot_max) {
	timer_shoot++;
}

if (sprite_index = spr_canon_shoot && image_index >= sprite_get_number(sprite_index) - 0.5) {
	sprite_index = spr_canon;
	var _x = lengthdir_x(30, image_angle);
	var _y = lengthdir_y(30, image_angle);
	scr_shoot(obj_fire_ball, x + _x, y + _y, image_xscale, image_yscale, image_angle, 8, snd_fire_ball);
	timer_shoot = 0;
}

if (hp <= 0) {
	scr_death(self, spr_explosion, image_speed, snd_explosion);	
}