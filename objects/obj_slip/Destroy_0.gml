/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (scr_instance_exist_custom(instance_draw)) {
	instance_destroy(instance_draw);
}