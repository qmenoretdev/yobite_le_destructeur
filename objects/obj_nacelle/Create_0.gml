/// @description Insert description here
// You can write your code in this editor
event_inherited();

delta_y = 200;
balloons = [
	instance_create_depth(x,y-delta_y,depth,obj_balloon)
]
canons = [
	instance_create_depth(x,y-delta_y/3,depth-1,obj_canon)
]

destroy = false;

timer_fall_max = 30;
timer_fall = timer_fall_max;

grav = 0;

vspd = 0;
vspd_max = 14;

phase = 0;

free = false;

numero = 1000;