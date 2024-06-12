// Gestion du curseur
window_set_cursor(cr_none);
window_set_fullscreen(true);
scr_initialize_room();
global.interface_image_alpha = 0.7;

// gestion pause et menus
screen_shot = -1;
menu_pause = undefined;

// gestions distance de son
global.fallof_ref_dist = 100;
global.fallof_max_dist = 600;

// phase
global.phase = 0;

// transition
fondu = undefined;

// limit de spawn de monstre
global.spawn_limit = 50;

// gestion fin de level
global.objectifs = []; // struct Objectif
global.level_end = false;

// objectifs selon level
switch(room) {
	case rm_level_1:
		global.objectifs = [OBJECTIF_TOUCH_END_LEVEL, OBJECTIF_KILL_ALL]
		break;
	case rm_level_3:
		global.objectifs = [OBJECTIF_KILL_ALL]
		break;
	case rm_level_4:
		global.objectifs = [OBJECTIF_KILL_ALL]
		break;
}