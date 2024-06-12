/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

spr_atk = new ProfileSprite(spr_bite_360_atk_l, spr_bite_360_atk_r);

bite_back_draw = instance_create_depth(x,y,layer_get_depth(LAYER_YOBITE) + 1,obj_draw);
bite_front_draw = instance_create_depth(x,y,layer_get_depth(LAYER_YOBITE) - 1,obj_draw);

snd_create = snd_blow_shot;

push_power = 9;
push_timer_max = 9;

damage = 15;