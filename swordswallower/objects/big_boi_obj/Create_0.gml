/// @description Insert description here
// You can write your code in this editor

my_floor = false
player_floor = false

state = 0

state_idle = 0
state_chasing = 1
state_hitting = 2
state_knockback = 3

carryingcrab = false
crabfriend = false

hunting= false

knockback_timer = 0
knockback_amt = 30
collided_with_friend = false

grav = .50
yplusb=0
h_accel = .15

h_decel_g = 0.2
h_decel_a = 0.025
h_decel = 0

h_walk_speed = 8
h_max_speed = 15

grabbing = false

sword_hold_x = false
sword_hold_y = false
sword_ang_temp = 0

facing_right = false

sword_present = false

h_accel = .12
h_walk_speed = 11
	

hit = noone
hit_timer = 0
hit_success = false

met = false

death = false

particlect = 0

weakened = false
fly_hp = 6
last_fly_hp = 6

hold_timer = 0


special_guy = 0
ready = false
phase1 = true
phase2 = false


startx = x
starty = y
locked = false
climbing_bool = false
wallheight = 0
climbing=false

sword_checked = false
grabbed = false
last_grounded_y = y