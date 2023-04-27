//fuck yes

// Inherit the parent event
event_inherited();

health_proportion = 0

hitbox_on = false
met = false

_state_dummy = 0
_state_idle = 1
_state_defensive = 2
_state_guarddown = 3
_state_tele_plunge = 4
_state_tele_aoe = 5
_state_tele_jump = 6
_state_laser = 7
_state_knife_magnet = 8
_state_swipe = 9
_state_spawn_second_knife = 10
_state_second_tele_jump = 11
_state_second_tele_laser = 12
_state_second_tele_ordered = 13
_state_knockback = 14
_state_throw = 15

_state = _state_idle

_substate = 0

sprite = noone
subimg = 0

facing_lock = false
player_distance = 0

startgrav = 1.05
grav = startgrav
facing = 1

hit = false
dmg_to_take = 0
defense = 100
starting_defense = 100

defense_sword_addition = 1

image_speed =  0

timer = 0
initiate_attack_timer = 0

sword_present = false

hitbox_1 = instance_create_depth(x,y,0,atk_collision_obj)
instance_deactivate_object(hitbox_1)


held_knives = 1
total_knives = 1


knife_1 = instance_create_depth(x,y,0,boss_knifegirl_knife_obj)
knife_1.parent = id
instance_deactivate_object(knife_1)

knife_2 = instance_create_depth(x,y,0,boss_knifegirl_knife_obj)
knife_2.parent = id
instance_deactivate_object(knife_2)

selected_knife = noone
knife_throw_speed = 50