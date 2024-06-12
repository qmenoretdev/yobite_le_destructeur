if (dash_timer < dash_timer_max) {
	if (dash_timer > 2) {	
		draw_sprite_ext(sprite_index,image_index,xprevious-hspd,yprevious,image_xscale,image_yscale,image_angle,image_blend,0.15);	
		draw_sprite_ext(sprite_index,image_index,xprevious-hspd*0.5,yprevious,image_xscale,image_yscale,image_angle,image_blend,0.3);
		draw_sprite_ext(sprite_index,image_index,xprevious-hspd*(-0.25),yprevious,image_xscale,image_yscale,image_angle,image_blend,0.6);
	}
}
if (boost > 1) {
	shader_set(sh_blink);
	draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*1.2,image_yscale*1.1,image_angle,c_white,flash_alpha);
	shader_reset();	
}
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,image_angle,image_blend,image_alpha);
event_inherited();