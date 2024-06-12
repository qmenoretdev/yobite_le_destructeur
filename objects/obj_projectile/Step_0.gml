if (destroy) {
	if (!is_undefined(spr_end)) {
		var _projectile_end = instance_create_depth(x,y,depth,obj_projectile_end);
		_projectile_end.sprite_index = spr_end;
		_projectile_end.image_angle = image_angle;
	}
	if (!is_undefined(snd)) {
		audio_play_sound_at(snd,other.x,other.y,0,global.fallof_ref_dist, global.fallof_max_dist, 1, false, 1);
	}
	instance_destroy(self);	
}