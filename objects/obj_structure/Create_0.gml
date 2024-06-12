/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

delta_y = 160;
delta_x = 150;
balloons = [
	instance_create_depth(x+delta_x,y-delta_y,depth,obj_balloon),
	instance_create_depth(x-delta_x,y-delta_y,depth,obj_balloon)
]
canons = [
	instance_create_depth(x+delta_x+20,y,depth-1,obj_canon),
	instance_create_depth(x-delta_x-20,y,depth-1,obj_canon)
]

destroy = false;

timer_fall_max = 30;
timer_fall = timer_fall_max;

grav = 0.5;

vspd = 0;
vspd_max = 14;

phase = 0;