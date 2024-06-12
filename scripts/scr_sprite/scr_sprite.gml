///@param _spr
///@param _spr_root
function scr_sprite_by_root(_spr, _spr_root) {
	var _spr_name = sprite_get_name(_spr);
	var _suffix = string_copy(_spr_name,string_length(_spr_name)-1,2);
	var _spr_return = asset_get_index(_spr_root + _suffix);
	if (sprite_exists(_spr_return)) {
		return _spr_return;	
	} else {
		return _spr;	
	}
}

///@param _spr
///@param _spr_root
///@param _hspd
function scr_sprite_by_root_and_hspd(_spr, _spr_root, _hspd) {
	var _suffix = _hspd > 0 ? "_R" : "_L";
	var _spr_return = asset_get_index(_spr_root + _suffix);
	if (sprite_exists(_spr_return)) {
		return _spr_return;	
	} else {
		var _spr_name = sprite_get_name(_spr);
		var _actual_spr_root = string_copy(sprite_get_name(_spr), 0, string_length(_spr_name)-2);
		return scr_sprite_by_root_and_hspd(_spr, _actual_spr_root, _hspd);
	}
}

///@param usePattern
///@param spritesPatterns1
///@param spritesPatterns2
///@param ...
function scr_is_this_sprites() {
	var _i, _arg;
	for (_i = 0; _i < argument_count; _i++;)
	{
		_arg[_i] = argument[_i];
	}

	if (_arg[0]) {
		var _z;
		for (_z = 1; _z < array_length(_arg); _z++;) {
			if (string_count(_arg[_z], sprite_get_name(sprite_index))) {
				return true;
			}
		}
	}

	return false;
}

function scr_is_sprite(_spr_profile) {
	return sprite_index == _spr_profile.left || sprite_index == _spr_profile.right;
}

///@param _spr
///@param _substr
function scr_match_sprite(_spr, _substr) {
	return string_count(_substr, sprite_get_name(_spr)) > 0;
}


function ProfileSprite(_spr_l, _spr_r) constructor
{
	left = _spr_l;
	right = _spr_r;
}

///@param _profile_spr ProfileSprite
function scr_get_profile_sprite(_profile_spr) {
	if (is_undefined(_profile_spr)) return sprite_index;
	return array_contains(spr_l, sprite_index) ? _profile_spr.left : _profile_spr.right;
}

///@param _profile_spr ProfileSprite
function scr_get_profile_sprite_by_hspd(_profile_spr, _hspd) {
	if (is_undefined(_profile_spr)) return sprite_index;
	return _hspd > 0 ? _profile_spr.right : _profile_spr.left;
}

function init_profile_sprites() {
	var _i = 0;
	while (sprite_exists(_i)) {
	if (scr_match_sprite(_i, spr_root)) {
		if (scr_match_sprite(_i, "_r")) {
			array_push(spr_r, _i);
		} else if (scr_match_sprite(_i, "_l")) {
			array_push(spr_l, _i);
		}
	}
	_i++;
}
}