/// @description Insert description here
// You can write your code in this editor
event_inherited();

part_particles_create_color(particle_system,x,y,particle_type_hit,c_white,1);
part_particles_create_color(particle_system,x,y,particle_type_spark,c_white,6);

image_angle += 1;

if (capacity > 0) {
	if (timer_spawn > 0) {
		timer_spawn--;
	} else if (instance_number(obj_ennemi) < global.spawn_limit) {
		timer_spawn = timer_spawn_max;
		instance_create_depth(x, y, layer_get_depth(LAYER_MOB), units[capacity - 1]);
		var _anim_pet = instance_create_depth(x, y, layer_get_depth(LAYER_MOB), obj_end);
		_anim_pet.image_xscale = 0.3;
		_anim_pet.image_yscale = 0.3;
		_anim_pet.sprite_index = spr_pet;
		_anim_pet.fondu = true;
		var _snd = scr_random_choice(snd_pet1, snd_pet2, snd_pet3, snd_pet4, snd_pet5);
		audio_play_sound_at(_snd,x,y,0,global.fallof_ref_dist, global.fallof_max_dist, 1, false, 1);
		capacity--;
	}
}

if (capacity == 0) {
	image_xscale -= 0.01;
	image_yscale -= 0.01;
	if (image_xscale <= 0) {
		instance_destroy();	
	}
}