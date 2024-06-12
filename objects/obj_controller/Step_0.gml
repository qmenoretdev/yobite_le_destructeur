if keyboard_check_pressed(vk_escape) {
	window_set_fullscreen(!window_get_fullscreen());
}

if keyboard_check_pressed(vk_enter) && instance_exists(obj_yobite) {
	if (!scr_instance_exist_custom(menu_pause)) {
		menu_pause = scr_menu_pause(obj_yobite.x,obj_yobite.y);
	} else {
		scr_continue();
	}
}

// Gestion résolution
if(global.monitor_w>=(global.port_width*2) && global.monitor_h>=(global.port_height*2)) {
	surface_resize(application_surface,global.port_width*2,global.port_height*2)
	global.offset_x=(global.monitor_w-global.port_width*2)/2;
	global.offset_y=(global.monitor_h-global.port_height*2)/2;
}

if (scr_instance_exist_custom(menu_pause) || room = rm_menu_principal) {
	cursor_sprite = spr_pointer;
} else {
	cursor_sprite = -1;
}

// Gestion des levels
if (array_contains(global.objectifs, OBJECTIF_KILL_ALL) && instance_number(obj_spawner) == 0
	&& instance_number(obj_ennemi) == 0) {
	array_delete(global.objectifs, array_get_index(global.objectifs, OBJECTIF_KILL_ALL), 1);
}

if ((room = rm_level_3 || room = rm_level_4) && array_length(global.objectifs) == 0) {
	global.level_end = true;	
}

if (global.level_end) {
// Gestion des levels
	if (!scr_instance_exist_custom(menu_pause)) {
		switch (room) {
			case rm_level_1:
				if (!scr_instance_exist_custom(fondu)) {
					fondu = instance_create_depth(0, 0, depth, obj_fondu);
				} else if (fondu.image_alpha == 1) {
					room = rm_level_2_intro;
				}
				break;
			case rm_level_2:
				if (!scr_instance_exist_custom(fondu)) {
					fondu = instance_create_depth(0, 0, depth, obj_fondu);
				} else if (fondu.image_alpha == 1) {
					room = rm_level_3_intro;
				}
				break;
			case rm_level_3:
				if (!scr_instance_exist_custom(fondu)) {
					fondu = instance_create_depth(0, 0, depth, obj_fondu);
				} else if (fondu.image_alpha == 1) {
					room = rm_level_4_intro;
				}
				break;
			case rm_level_4:
				if (!scr_instance_exist_custom(fondu)) {
					fondu = instance_create_depth(0, 0, depth, obj_fondu);
				} else if (fondu.image_alpha == 1) {
					room = rm_end;
				}
				break;
		}
	}
}