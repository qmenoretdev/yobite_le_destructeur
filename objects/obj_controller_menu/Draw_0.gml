// affichage du text dans le boite de texte
if(instance_exists(text_box)) {
	draw_set_font(fnt_text);
	draw_set_color(c_white);
	var _marge = 16
	draw_text_ext(text_box.x-(text_box.sprite_width/2)+_marge,text_box.y-(text_box.sprite_height/2)+_marge,text,string_height(text),text_box.sprite_width - 30);
}