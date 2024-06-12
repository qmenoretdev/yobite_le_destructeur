/// @description Insert description here
// You can write your code in this editor

if (!has_slap && image_index > sprite_get_number(sprite_index)/2) {
	has_slap = true;
	audio_play_sound_at(snd_slap,x,y,0,global.fallof_ref_dist,global.fallof_max_dist, 1, false, 1);	
}