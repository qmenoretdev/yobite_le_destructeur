/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (timer_flash_alpha = timer_flash_alpha_max) {
	if (flash_alpha = 0.5) {
		flash_alpha = 0.3;	
	} else {
		flash_alpha = 0.5;	
	}
	timer_flash_alpha = 0;
} else {
	timer_flash_alpha++;	
}