///@param _instance
function scr_instance_exist_custom(_instance){
	return !is_undefined(_instance) && instance_exists(_instance);
}

///@param _obj
///@param _variable
function scr_variable_exist_custom(_obj, _variable) {
	return variable_instance_exists(_obj.id, _variable) && !is_undefined(variable_instance_get(_obj.id, _variable));
}