/// @description Insert description here
// You can write your code in this editor

var _total_hp = sender.hp + other.damage
sender.hp = _total_hp > sender.hp_max ? sender.hp_max : _total_hp;

instance_destroy(other);