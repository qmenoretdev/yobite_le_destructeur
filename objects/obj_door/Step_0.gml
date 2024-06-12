/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (open) {
	var _instance_draw = instance_create_depth(x, y, depth, obj_draw);
	_instance_draw.sprite_index = sprite_index;
	_instance_draw.image_angle = image_angle;
	_instance_draw.image_index = image_index;
	instance_destroy();
}