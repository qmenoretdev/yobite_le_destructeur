/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();
var _nacelle = instance_nearest(x,y,obj_nacelle);

var _nb_balloons = 0;
for(var _i = 0; _i < array_length(balloons); _i++) {
	if (scr_instance_exist_custom(balloons[_i])) {
		_nb_balloons++;
		balloons[_i].y = y - delta_y;
	}
}

for(var _i = 0; _i < array_length(canons); _i++) {
	if (scr_instance_exist_custom(canons[_i])) {
		canons[_i].y = y;
	}
}

switch(_nb_balloons) {
	case 2:
		grav = 0;
		break;
	case 1:
		if (phase == 0) {
			if (timer_fall > 0) {
				timer_fall--;
				grav = 0.5;
			} else {
				timer_fall = timer_fall_max;
				phase = 1;
				grav = 0;
				vspd = 0;
			}
		}
		break;
	case 0:
		grav = 0.5
		break;
}

vspd = vspd + grav;
if (vspd > vspd_max) {
	vspd = vspd_max;	
}
y += vspd;
if (scr_instance_exist_custom(_nacelle)) {
	_nacelle.y += vspd;
}

if (destroy) {
	for(var _i = 0; _i < array_length(canons); _i++) {
		if (scr_instance_exist_custom(canons[_i])) {
			canons[_i].hp = 0;
		}
	}
	_nacelle.free = true;
	scr_death(self, spr_capote_man_structure_death,1,snd_explosion);
}