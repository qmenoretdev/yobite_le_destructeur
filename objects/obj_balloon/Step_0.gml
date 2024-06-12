/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (hp <= 0) {
	scr_death(self, spr_balloon_death, image_speed, snd_balloon_pop);	
}