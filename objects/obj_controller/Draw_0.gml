/// @description Insert description here

with (obj_capote) {
	//draw_text(x, y -25, "hp : " + string(hp));
	//draw_text(x, y -50, "action : " + string(action));
}

with (obj_yobite) {
	//draw_text(x, y - 200, "nbMobs : " + string(instance_number(obj_ennemi)));
	//draw_text(x, y -50, "slow_effects : " + string(slow_effects));
}

with (obj_keken) {
	//draw_text(x, y - 25, "ready : " + string(ready_to_cac));
	//draw_text(x, y -50, "action : " + string(action));
}

with (obj_iron_door) {
	//draw_text(x, y - 25, "open : " + string(open));
	//draw_text(x, y - 50, "sprite : " + string(sprite_get_name(sprite_index)));
	//draw_text(x, y -50, "action : " + string(action));
}

with (obj_yobite) {
	if (scr_instance_exist_custom(energy_bar)) {
		var _regen_color = inventory.regen.stock > 0 ? c_white : c_grey;
		var _x = energy_bar.x + sprite_get_width(energy_bar.sprite_index) + sprite_get_width(spr_regen_ointment)/2;
		var _y = energy_bar.y + 10;
		draw_sprite_ext(spr_regen_ointment,0,_x,_y,1,1,0,_regen_color,0.9);
		scr_write_text_outline(fnt_inventory,fa_top,fa_left,_x + 5,_y - 10,inventory.regen.stock,c_white,c_black,1);
	
		var _boost_color = inventory.boost.stock > 0 ? c_white : c_grey;
		_x = energy_bar.x + sprite_get_width(energy_bar.sprite_index) + sprite_get_width(spr_boost_gronon_placement);
		_y = energy_bar.y + 12;
		draw_sprite_ext(spr_boost_gronon,0,_x,_y,0.11,0.11,0,_boost_color,0.9);
		draw_set_font(fnt_bouton);
		scr_write_text_outline(fnt_inventory,fa_top,fa_left,_x + 5,_y - 12,inventory.boost.stock,c_white,c_black,1);
	}
}