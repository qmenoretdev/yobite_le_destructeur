/// @description Insert description here
// You can write your code in this editor
shader_set(sh_blink);
draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*1.2,image_yscale*1.1,image_angle,flash_color,flash_alpha);
shader_reset();
draw_self();