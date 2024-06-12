/// @description Insérez la description ici
// Vous pouvez écrire votre code dans cet éditeur

if(fondu) {
	if (image_index > sprite_get_number(sprite_index) - 1) {
		image_speed = 0;
		image_index = sprite_get_number(sprite_index) - 1;
	}
	if(image_alpha > 0) {
		image_alpha -= 0.02;
	} else {
		instance_destroy(self);
	}
} else {
	if (image_index > sprite_get_number(sprite_index) - 1) {
		instance_destroy(self);
	}
}