/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spr_end = spr_fire_ball_explosion;
snd = snd_fire_ball_end;

effect = [EFFECT_BURN];

damage = 10;

// ### Specifique
burn_probability = 0.5;
flash_alpha = 0.5;
timer_flash_alpha_max = 8;
timer_flash_alpha = timer_flash_alpha_max;
image_blend = c_blue;