///@param _variable
///@param _variable_value
///@param _object
function scr_get_instance_by_variable(_variable, _variable_value, _object) {
	if (variable_instance_exists(_object,_variable)) {
		with(_object) {
			if (variable_instance_get(id, _variable) = _variable_value) {
				return self;
			}
		}
	}
	return undefined;
}

///@param _variable_value
///@param _object
function scr_get_instance_by_name(_variable_value, _object) {
	return scr_get_instance_by_variable("name", _variable_value, _object);
}

///@param _variable_value
///@param _object
function scr_get_instance_by_numero(_variable_value, _object) {
	return scr_get_instance_by_variable("numero", _variable_value, _object);
}