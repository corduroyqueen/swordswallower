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

grav = 0.6
yplusb=0
h_accel = 0.2

h_decel_g = 0.2
h_decel_a = 0.025
h_decel = 0

h_walk_speed = 50
h_max_speed = 50

grabbing = false

sword_hold_x = false
sword_hold_y = false
sword_ang_temp = 0

facing_right = false

sword_present = false

	

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

hsp=0
vsp=0

sword_checked = false
grabbed = false
last_grounded_y = y

wallheight=0
maxheight=300