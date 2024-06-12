/// @description Insert description here
// You can write your code in this editor

for (var _i = 0; _i < array_length(invinc_list); _i++) {
	if (invinc_list[_i].timer > 0) {
		invinc_list[_i].timer--;
	} else {
		array_delete(invinc_list, _i, 1);
	}
}

event_inherited();