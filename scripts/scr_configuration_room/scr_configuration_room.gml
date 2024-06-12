function scr_initialize_room() {
	application_surface_draw_enable(false);
	// Gestion résolution
	global.monitor_w=display_get_width();
	global.monitor_h=display_get_height();
	global.port_width = global.monitor_w/2.5;
	global.port_height = global.monitor_h/2;
	global.offset_x=(global.monitor_w-global.port_width)/2;
	global.offset_y=(global.monitor_h-global.port_height)/2;
	// Initialise Viewports
	view_enabled = true;
	view_visible[0] = true;
	/*view_xport[0] = 0;
	view_yport[0] = 0;*/
	// Initialisation caméra
	var _camera = instance_create_depth(x,y,depth,obj_camera);
	view_wport[0] = global.port_width;
	view_hport[0] = global.port_height;
	view_camera[0] = camera_create_view(0, 0, view_wport[0], view_hport[0], 0, _camera, -1, -1, global.port_width/2, global.port_height/2);
}