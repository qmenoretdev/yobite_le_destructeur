///@param _obj
function scr_nearest_object_visible(_obj) {
	var _inst_num = instance_number(_obj);
	var _nearest_dist = undefined;
	var _obj_return = undefined;
	for (var _i = 0; _i < _inst_num; _i++) {
		var _obj_return_in = instance_find(_obj, _i);
		if (player_side != _obj_return_in.player_side) && ((is_undefined(_nearest_dist) || point_distance(x,y,_obj_return_in.x,_obj_return_in.y) < _nearest_dist) 
				&& (!collision_line(x,y,_obj_return_in.x,_obj_return_in.y,obj_wall,true,false) || detection.trans_vision)) {
			_nearest_dist = point_distance(x,y,_obj_return_in.x,_obj_return_in.y);
			_obj_return = _obj_return_in;
		}
	}
	return _obj_return;
}

function scr_nearest_capote_fill_visible() {
	var _inst_num = instance_number(obj_capote);
	var _nearest_dist = undefined;
	var _obj_return = undefined;
	for (var _i = 0; _i < _inst_num; _i++) {
		var _obj_return_in = instance_find(obj_capote, _i);
		if _obj_return_in.filling_rate > 0
				&& ((is_undefined(_nearest_dist) || point_distance(x,y,_obj_return_in.x,_obj_return_in.y) < _nearest_dist) 
				&& !collision_line(x,y,_obj_return_in.x,_obj_return_in.y,obj_wall,true,false)) {
			_nearest_dist = point_distance(x,y,_obj_return_in.x,_obj_return_in.y);
			_obj_return = _obj_return_in;
		}
	}
	return _obj_return;
}

///@param _obj
function scr_nearest_ennemi(_obj) {
	var _inst_num = instance_number(_obj);
	var _nearest_dist = undefined;
	var _obj_return = undefined;
	for (var _i = 0; _i < _inst_num; _i++) {
		var _obj_return_in = instance_find(_obj, _i);
		if (player_side != _obj_return_in.player_side
			&& ((is_undefined(_nearest_dist) || point_distance(x,y,_obj_return_in.x,_obj_return_in.y) < _nearest_dist))) {
			_nearest_dist = point_distance(x,y,_obj_return_in.x,_obj_return_in.y);
			_obj_return = _obj_return_in;
		}
	}
	return _obj_return;
}

/*///@param xCer (int)
///@param yCer (int)
///@param rayCer (int)
///@param _object_to_see (object) 
///@param trans_vision (boolean)
function scr_circle_detection(xCer,yCer,rayCer,_object_to_see,trans_vision) {
	if (scr_instance_exist_custom(_object_to_see)) {
		if (!collision_line(x,y,_object_to_see.x,_object_to_see.y,o_mur_carre,false,false) || trans_vision) {
			return point_in_circle(_object_to_see.x,_object_to_see.y,xCer,yCer,rayCer);
		} else {
			return false;	
		}
	} else {
		return false;	
	}
}*/

///@param _obj (object)
///@param _orientation (int)
///@param _length (int)
///@param _width (int)
///@param _object_to_see (object) 
///@param _trans_vision
function scr_rectangle_detection(_obj,_orientation,_length,_width,_object_to_see,_trans_vision) {
	if (scr_instance_exist_custom(_object_to_see)) {
		if (!collision_line(_obj.x,_obj.y,_object_to_see.x,_object_to_see.y,obj_wall,false,false) || _trans_vision) {
			switch(_orientation) {
				case 0:
					return point_in_rectangle(_object_to_see.x,_object_to_see.y,
							_obj.x,
							_obj.y+lengthdir_y(_width,_orientation+90),
							_obj.x+lengthdir_x(_length,_orientation),
							_obj.y+lengthdir_y(_length,_orientation)+lengthdir_y(_width,_orientation-90));
					
				case 180:
					return point_in_rectangle(_object_to_see.x,_object_to_see.y,
							_obj.x+lengthdir_x(_length,_orientation),
							_obj.y+lengthdir_y(_length,_orientation)+lengthdir_y(_width,_orientation-90),
							_obj.x,
							_obj.y+lengthdir_y(_width,_orientation+90));
			}
		} else {
			return false;	
		}
	} else {
		return false;	
	}
}

///@param _target (object)
function scr_direction_by_target_position(_target) {
	var _direction = 0;
	if (scr_instance_exist_custom(_target)) {
		var _ennemi_direction = point_direction(x,y,_target.x,_target.y);
		var _ecart_right;
		if (_ennemi_direction > 270) {
			_ecart_right = scr_absolute_value(360 - _ennemi_direction);
		} else {
			_ecart_right = scr_absolute_value(0 - _ennemi_direction);
		}
		var _ecart_left = scr_absolute_value(180 - _ennemi_direction);
		var _nearest_ecart = min(_ecart_right, _ecart_left);
		switch(_nearest_ecart) {
			case _ecart_right:
				_direction = 0;
				break;
			case _ecart_left:
				_direction = 180;
				break;
		}
	}
	return _direction;
}

///@param _target (object)
///@param _spr_root (string)
function scr_sprite_by_target_position(_target, _spr_root) {
	var _spr_return = undefined;
	if (scr_instance_exist_custom(_target)) {
		var _ennemi_direction = point_direction(x,y,_target.x,_target.y);
		var _ecart_right;
		if (_ennemi_direction > 270) {
			_ecart_right = scr_absolute_value(360 - _ennemi_direction);
		} else {
			_ecart_right = scr_absolute_value(0 - _ennemi_direction);
		}
		var _ecart_left = scr_absolute_value(180 - _ennemi_direction);
		var _nearest_ecart = min(_ecart_right, _ecart_left);
		switch(_nearest_ecart) {
			case _ecart_right:
				_spr_return = _spr_root.right;
				break;
			case _ecart_left:
				_spr_return = _spr_root.left;
				break;
		}
	}
	if (sprite_exists(_spr_return)) {
		return _spr_return;
	} else {
		return sprite_index;	
	}
}

///@param obj
///@param objCible
///@param notme
function scr_get_nearest_object(obj,objCible,notme) {
	if (notme) {
		var dist = distance_to_object(objCible);
		return collision_circle(obj.x, obj.y, dist, objCible, true, true);
	} else {
		return instance_nearest(obj.x,obj.y,objCible);
	}
}

///@param listObject
///@param instanceToExclude
function scr_get_nearest_object_in_list(listObject,instanceToExclude) {
	var nearestObject = undefined;
	for(var i = 0; i < array_length(listObject); i++) {
		if (is_undefined(nearestObject) || distance_to_object(listObject[i]) < distance_to_object(nearestObject)) {
			if (!scr_instance_exist_custom(instanceToExclude) || listObject[i].id != instanceToExclude.id) {
				nearestObject = listObject[i];
			}
		}
	}
	return nearestObject;
}

///@param objOrigine
///@param len
///@param xCible
///@param yCible
///@param objCollision
function scr_collision_line_custom(objOrigine,len,xCible,yCible,objCollision) {
	var lenDirX1 = lengthdir_x(len,objOrigine.image_angle-90);
	var lenDirY1 = lengthdir_y(len,objOrigine.image_angle-90);
	var lenDirX2 = lengthdir_x(len,objOrigine.image_angle+90);
	var lenDirY2 = lengthdir_y(len,objOrigine.image_angle+90);
	
	return collision_line(objOrigine.x,objOrigine.y,xCible,yCible,objCollision,true,false) 
		|| collision_line(objOrigine.x+lenDirX1,objOrigine.y+lenDirY1,xCible+lenDirX1,yCible+lenDirY1,objCollision,true,false)
		|| collision_line(objOrigine.x+lenDirX2,objOrigine.y+lenDirY2,xCible+lenDirX2,yCible+lenDirY2,objCollision,true,false);
}

///@param objOrigine
///@param len
///@param objCible
function scr_collision_line_mur_obj(objOrigine,len,objCible) {
	return scr_collision_line_mur_point(objOrigine,len,objCible.x,objCible.y);
}

///@param objOrigine
///@param len
///@param objCible
function scr_collision_line_otherCollision(objOrigine,len,objCible) {
	return scr_collision_line_otherCollision_point(objOrigine,len,objCible.x,objCible.y);
}

///@param objOrigine
///@param len
///@param xCible
///@param yCible
function scr_collision_line_mur_point(objOrigine,len,xCible,yCible) {
	return scr_collision_line_custom(objOrigine,len,xCible,yCible,o_mur_carre);
}

///@param objOrigine
///@param len
///@param xCible
///@param yCible
function scr_collision_line_otherCollision_point(objOrigine,len,xCible,yCible) {
	if (scr_collision_line_custom(objOrigine,len,xCible,yCible,o_collision)) {
		return scr_collision_line_custom_excludeObject(objOrigine,len,xCible,yCible,o_collision,instanceCollision.id);
	} else {
		return false;	
	}
}

///@param objOrigine
///@paramlen
///@param xCible
///@param yCible
///@param objToAvoid
///@param idInstanceNotAvoid
function scr_collision_line_custom_excludeObject(objOrigine,len,xCible,yCible,objToAvoid,idInstanceNotAvoid) {
	var listCollisions = ds_list_create();
	var _num = collision_line_list(objOrigine.x,objOrigine.y,xCible,yCible,objToAvoid,true,true,listCollisions,true);
	if (_num > 0) {
		for (var i = 0; i < _num; ++i;) {
			if (listCollisions[| i].id != idInstanceNotAvoid) {
				return true;
			}
		}
	}
	return false;
}

///@param object
function scr_is_object_in_view(object) {
	var x1 = camera_get_view_x(view_camera[0]);
	var y1 = camera_get_view_y(view_camera[0]);
	var x2 = camera_get_view_x(view_camera[0])+global.portWidth;
	var y2 = camera_get_view_y(view_camera[0])+global.portHeight;
	return point_in_rectangle(object.x,object.y,x1,y1,x2,y2);
}