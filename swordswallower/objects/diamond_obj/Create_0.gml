/// @description Insert description here
// You can write your code in this editor

my_floor = false
player_floor = false

state = 0

state_idle = 0
state_chasing = 1
state_hitting = 2
state_knockback = 3

hunting= false

knockback_timer = 0
knockback_amt = 30
collided_with_friend = false

grav = .24

h_accel = .25

h_decel_g = 0.35
h_decel_a = 0.025
h_decel = 0

h_walk_speed = 2.5
h_max_speed = 7.5

sword_hold_x = false
sword_hold_y = false
sword_ang_temp = 0

facing_right = false

sword_present = false

hit = noone
hit_timer = 0
hit_success = false

met = false

yanked = false

death = false

particlect = 0

weakened = false

pointingx = 0
pointingy = 0

inv_timer = 0

aiming_sound = noone

knockback = false

hit=noone