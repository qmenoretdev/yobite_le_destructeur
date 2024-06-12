/// @description Insert description here
// You can write your code in this editor
event_inherited();
// Gestion particules
particle_system = part_system_create_layer(LAYER_BACK,0);
particle_type_hit = scr_particle_hit(spr_skin_particle,0.2,0.3,0,359,5,8);
particle_type_spark = scr_particle_spark(spr_skin_particle,0.5,1,800,800,0,359,3,3.5);
depth = layer_get_depth(LAYER_BACK) - 1;

capacity = 3;
units = []
for (var _i = 0; _i < capacity; _i++) {
	units[_i] = scr_random_choice(obj_capote, obj_keken, obj_spider, obj_mangecouille);
}

timer_spawn_max = 300;
timer_spawn = scr_random_choice(timer_spawn_max, 400, 600);

doors_to_open = [];