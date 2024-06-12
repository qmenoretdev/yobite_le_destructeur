/// @description Insert description here
// You can write your code in this editor
draw_self();
if (scr_is_sprite(spr_distance_atk)) {
	var _spr = scr_get_profile_sprite(spr_distance_atk_draw);
	draw_sprite_ext(_spr, image_index, x, y, image_xscale, image_yscale, image_angle, image_blend, image_alpha);
}
if (filling_rate >= filling_rate_max) {
	shader_set(sh_blink);
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,c_white,0.75);
	shader_reset();
}
event_inherited();