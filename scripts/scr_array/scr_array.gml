///@param _array
///@param _id
function scr_array_contains_id(_array, _id){
	for (var _i = 0; _i < array_length(_array); _i++) {
		if (_array[_i].id == _id) {
			return true;	
		}
	}
	return false;
}

///@param _array
///@param _id
function scr_array_contains_instance_id(_array, _id){
	for (var _i = 0; _i < array_length(_array); _i++) {
		if (scr_instance_exist_custom( _array[_i]) && _array[_i].id == _id) {
			return true;	
		}
	}
	return false;
}