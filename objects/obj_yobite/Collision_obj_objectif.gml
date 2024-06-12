/// @description Insert description here
// You can write your code in this editor
if (room == rm_level_4) {
	instance_create_depth(1440,1632,layer_get_depth(LAYER_BACK),obj_iron_door);
	with(obj_draw) {
		if (sprite_index == spr_iron_door_open) {
			instance_destroy();	
		}
	}
	instance_destroy(other);
}