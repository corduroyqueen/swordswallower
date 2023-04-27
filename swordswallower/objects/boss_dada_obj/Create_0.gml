//fuck yes

// Inherit the parent event
event_inherited();

health_proportion = 0

hitbox_on = false


_state_dummy = 0
_state_idle = 1
_state_defensive = 2
_state_guarddown = 3
_state_lunge = 4
_state_poke = 5
_state_knockback = 6
_state_leapandplunge = 7
_state_superthrow = 8
_state_shockwave = 9
_state_swipe = 10

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
times_plunged = 0
player_hit_during_plunge = false
queue_plunge_shockwave = false

arm_visible = 0
arm_angle = 0
arm_sprite = noone
arm_sprite_i = 0
arm_off_x = 0
arm_off_y = 0

sword_present = false

hitbox_1 = instance_create_depth(x,y,0,atk_collision_obj)
instance_deactivate_object(hitbox_1)