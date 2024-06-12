/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

if (mouse_check_button_pressed(mb_left)) {
	if (image_index = 1) {
		if ("Quitter" = text) {
			game_end();
		} else if ("Continuer" = text) {
			scr_continue();
		} else {
			room_goto(room_togo);
		}
	}
}