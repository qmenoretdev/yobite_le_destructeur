if (!array_contains(ignore_on, other.object_index) && !scr_array_contains_id(invinc_list, other.id)) {
	scr_degat(self, other);
	array_push(invinc_list, { id: other.id, timer: invinc_time });
	other.push_timer = 0;
	other.push_timer_max = push_timer_max;
	other.push_power = push_power;
	other.push_direction = point_direction(x,y,other.x,other.y);
	if (!is_undefined(snd)) {
		audio_play_sound_at(snd,other.x,other.y,0,global.fallof_ref_dist,global.fallof_max_dist, 1, false, 1);
	}
	if (!is_undefined(spr_hit)) {
		var _projectile_end = instance_create_depth(other.x,other.y,other.depth - 1,obj_projectile_end);
		_projectile_end.sprite_index = spr_hit;
		_projectile_end.image_angle = point_direction(x,y,other.x,other.y);
	}
}