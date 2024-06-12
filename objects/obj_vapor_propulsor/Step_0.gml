/// @description Insert description here
// You can write your code in this editor

if (timer_inactive < timer_inactive_max) {
	sprite_index = spr_vapor_propulsor_inactive;
	image_speed = 0;
	image_index = sprite_get_number(sprite_index) * timer_inactive/timer_inactive_max
	timer_inactive++;
} else {
	if (sprite_index != spr_vapor) {
		image_speed = 1;
		image_index = 0;
		sprite_index = spr_vapor;
	}
	if (image_index >= sprite_get_number(sprite_index) - 0.5) {
		timer_inactive = 0;
	}
}

// Inherit the parent event
event_inherited();

