/// @description Insert description here
// You can write your code in this editor
event_inherited()
my_floor = false
player_floor = false

hitbox_on = false

state = 0
ang=0
state_idle = 0
state_chasing = 1
state_hitting = 2
state_knockback = 3

hp = 25

carryingcrab = false
crabfriend = false

hunting= false

knockback_timer = 0
knockback_amt = 30
collided_with_friend = false

grav = .8
yplusb=0
h_accel = 2.5

h_decel_g = 0.35
h_decel_a = 0.0375
h_decel = 0

h_walk_speed = 33
h_max_speed = 33

grabbing = false

charge_timer = 0 
charge_go=60
knockback_end = 220
direc = false
charging = false 
image_speed = 0.8

sword_hold_x = false
sword_hold_y = false
sword_ang_temp = 0

facing_right = true

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

alpha_spr = 1

fade_in_t = 0
fade_in_a = 0

hsp=0
vsp=0
horns = instance_create_depth(x+125,y+50,depth+1,cow_boss_horns_obj)
horns.image_yscale = 2.6
horns.visible = false
//horns.image_yscale = 3
//cow_boss_horns_obj.x = x + 400
//cow_boss_horns_obj.y = y