event_inherited();
// stats
hp_max = 50;
hp = hp_max;
defense = 0;
attack = 0;
// instance de collision
collision_instance = instance_create_depth(x, y, depth - 1, obj_character_collision);
// déplacement
walkspd = 6; // vitesse de base en ligne droite
spd = walkspd;
diagspd = round(sqrt(2)/2 * spd);
slow = 1;
freeze = false;
hspd = 0
vspd = 0;
grav = 0.5;
is_dashing = false;
can_dash = true;
acceleration_spd = 1.25;
acceleration_max = 1;
acceleration_min = 0.1;
acceleration = acceleration_min;
jump_spd = -walkspd;
nb_jump = 0;
nb_jump_max = 2;
conveyor_hspd = 0;
// Sons
snd_pain = undefined;
// gestion effets
slow_effects = [];
effect_freeze_timer_max = 200;
effect_freeze_timer = effect_freeze_timer_max;
effect_pacifist_timer_max = 200;
effect_pacifist_timer = effect_freeze_timer_max;
pacifist = false;
// gestion cac
cac_object = undefined;
cac = undefined;
// gestion push
push_timer = 0
push_timer_max = 0
push_power = 0;
push_direction = 0;
push_start_timer_max = 4;
push_start_timer = push_start_timer_max;
// gestion boost
boost = 1;
boost_timer_max = 300;
boost_timer = boost_timer_max;
flash_alpha = 0.7;
timer_flash_alpha_max = 8;
timer_flash_alpha = timer_flash_alpha_max;
// action
action = ACTION_PACIFIST;
// gestion orientation de sprite
spr_r = []
spr_l = []
// gestion ennemi
player_side = false;
// si peut se faire remplir de sperme ou non
fillingable = false;
// gestion invicibilite
invinc = false;

// brulure
burning_timer_max = 91;
burning_timer = burning_timer_max;
burn_damage_timer_max = 30;
burn_damage_timer = burn_damage_timer_max;
burn_damage = 5;
fireproof = false;