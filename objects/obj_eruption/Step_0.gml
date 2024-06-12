/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (eruption) {
	if (image_index < sprite_get_number(sprite_index) - 1) {
		if (timer_eruption > 0) {
			timer_eruption--;	
		} else {
			timer_eruption = timer_eruption_max;
			image_index++;
		}
	}
}