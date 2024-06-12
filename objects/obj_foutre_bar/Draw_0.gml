draw_self();
with(obj_yobite) {
	var _decalage_x = 2;
	var _decalage_y = 1;
	for (var _i = 0; _i < foutre; _i++) {
		draw_sprite_ext(spr_foutre,0,other.x+_decalage_x+(_i*2),other.y+_decalage_y,other.image_xscale,other.image_yscale,0,c_white,global.interface_image_alpha);
	}
}