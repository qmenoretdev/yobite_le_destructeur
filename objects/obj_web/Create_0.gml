/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

damage = 0;
effect = [EFFECT_SLOW];

spr_hit = undefined;

spr_death = spr_web_death;

push_power = 0;
push_timer_max = 0;
push_timer = push_timer_max;

ignore_on = [obj_spider];

invinc_time = slow_time - 1;