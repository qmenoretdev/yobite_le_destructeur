///@param _var_x
///@param _var_y
function scr_menu_pause(_var_x, _var_y) {
	scr_pause(_var_x, _var_y);
	var _menu = instance_create_depth(_var_x, _var_y , depth+2 ,obj_menu_pause);
	return _menu;
}

///@param _var_x
///@param _var_y
function scr_pause(_var_x, _var_y) {
	with (obj_controller) {
		if (!sprite_exists(screen_shot)) { 
			screen_shot = sprite_create_from_surface(application_surface,0,0,view_wport*2,view_hport*2,0,0,0,0);
	    }
		instance_deactivate_all(true);
		var _draw_obj = instance_create_depth(_var_x-view_wport/2,_var_y-view_hport/2,depth+3,obj_draw);
		_draw_obj.sprite_index = screen_shot;
		_draw_obj.image_xscale = 0.5;
		_draw_obj.image_yscale = 0.5;
	}
}

function scr_continue() {
	instance_activate_all();
	if (instance_exists(obj_draw)) {
		instance_destroy(obj_draw);
	}
	if (sprite_exists(obj_controller.screen_shot)) {
		sprite_delete(obj_controller.screen_shot);
    }
	if (scr_instance_exist_custom(obj_controller.menu_pause)) {
		instance_destroy(obj_controller.menu_pause);
	}
}
