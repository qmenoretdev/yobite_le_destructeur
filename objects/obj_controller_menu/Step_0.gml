if keyboard_check_pressed(vk_escape) {
	window_set_fullscreen(!window_get_fullscreen());
}

if (instance_exists(obj_textbox)) {
	if(keyboard_check_pressed(vk_right)) {
		if(text_index < array_length(text_tab)-1) {
			text_index++;
		} else {
			switch (room) {
				case rm_level_1_intro:
					room = rm_level_1;
					break;
					
				case rm_level_2_intro:
					room = rm_level_2;
					break;
					
				case rm_level_3_intro:
					room = rm_level_3;
					break;
				case rm_level_4_intro:
					room = rm_level_4;
					break;
			}
		}
	} else if keyboard_check_pressed(vk_left) {
		if(text_index > 0) {
			text_index--;
		}
	}
	text = text_tab[text_index];
	// boutons next et previous
	if (text_index < array_length(text_tab) && room != rm_end && room != rm_game_over) {
		text_box_next.image_alpha = 1;
	} else {
		text_box_next.image_alpha = 0;
	}
	if (text_index > 0) {
		text_box_before.image_alpha = 1;
	} else {
		text_box_before.image_alpha = 0;
	}
}