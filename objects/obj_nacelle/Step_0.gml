/// @description Insert description here
// You can write your code in this editor
event_inherited();

var _nb_balloons = 0;
for(var _i = 0; _i < array_length(balloons); _i++) {
	if (scr_instance_exist_custom(balloons[_i])) {
		_nb_balloons++;
		balloons[_i].y = y - delta_y;
	}
}

for(var _i = 0; _i < array_length(canons); _i++) {
	if (scr_instance_exist_custom(canons[_i])) {
		canons[_i].y = y - delta_y/3;
	}
}

if (free) {
	switch(_nb_balloons) {
		case 1:
			grav = 0;
			vspd = 0;
			break;
		case 0:
			grav = 0.5
			break;
	}
}

vspd = vspd + grav;
if (vspd > vspd_max) {
	vspd = vspd_max;	
}
y += vspd;

if (destroy) {
	for(var _i = 0; _i < array_length(canons); _i++) {
		if (scr_instance_exist_custom(canons[_i])) {
			canons[_i].hp = 0;
		}
	}
	scr_death(self, spr_explosion,1,snd_explosion);
}