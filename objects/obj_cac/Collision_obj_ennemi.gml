if (player_side != other.player_side && !other.invinc && !array_contains(invinc_list, other.id)) {
	scr_degat(self,other);
	array_push(invinc_list, other.id);
	other.push_timer = 0;
	other.push_timer_max = push_timer_max;
	other.push_power = push_power;
	other.push_direction = point_direction(x,y,other.x,other.y);
	other.push_limit = true;
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