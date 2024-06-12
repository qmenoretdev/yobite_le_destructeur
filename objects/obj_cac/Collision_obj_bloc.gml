if (other.destructible && !other.invinc && player_side != other.player_side && !array_contains(invinc_list, other.id)) {
	scr_degat(self,other);
	array_push(invinc_list, other.id);
	if (!is_undefined(snd)) {
		audio_play_sound_at(snd,other.x,other.y,0,global.fallof_ref_dist,global.fallof_max_dist, 1, false, 1);
	}
	if (!is_undefined(spr_hit)) {
		var _x;
		var _y;
		if (scr_is_this_sprites(true, "_l")) {
			_x = bbox_left;
			_y = y;
		} else {
			_x = bbox_right;
			_y = y;
		}
		if (!collision_point(_x,_y,other,true,false)) {
			_x = other.x;
		}
		var _hit_animation = instance_create_depth(_x,_y,layer_get_depth(LAYER_FRONT),obj_end);
		_hit_animation.sprite_index = spr_hit;
	}
}