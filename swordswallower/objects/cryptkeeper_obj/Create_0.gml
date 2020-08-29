/// @description Insert description here
// You can write your code in this editor
event_inherited()
my_floor = false
player_floor = false

state = 0
hp = 1
state_idle = 0
state_chasing = 1
state_hitting = 2
state_knockback = 3

knockback_timer = 0
knockback_amt = 30

grav = 1

h_accel = .4

h_decel_g = 0.45
h_decel_a = 0.035
h_decel = 0

h_walk_speed = 4.75
h_max_speed = 17

sword_hold_x = false
sword_hold_y = false
sword_ang_temp = 0

facing_right = false

sword_present = false

hit_timer = 0

met = false

death = false

particlect = 0

weakened = false

hit = noone
hit_timer = 0
hit_success = false

if !variable_instance_exists(id,"fumbling_timer"){
	fumbling_timer = 0
}
if !variable_instance_exists(id,"detect_range"){
	detect_range = 1200
}

sound_timer = 149
sound_timer_t = 150
idle_sound = false

image_xscale = -1

tartimer=0

sprites = array_create(10)
sprites[0] = ghoul816
sprites[1] = ghoul2845
sprites[2] = ghoul3

sprite_index = sprites[floor(x) % 3]

sprite_index = new_ghoul

number_of_pus = 4
pus_x = array_create(number_of_pus)

pus_x[0] = 0
pus_x[1] = 22
pus_x[2] = 27
pus_x[3] = 2

pus_y = array_create(number_of_pus)


pus_y[0] = -4
pus_y[1] = -31
pus_y[2] = -60
pus_y[3] = -40


pus_s = array_create(number_of_pus)
pus_s[0] = pus1
pus_s[1] = pus2
pus_s[2] = pus3
pus_s[3] = pus4


pus_starting_sc = 0.6

pus_sc = array_create(number_of_pus,pus_starting_sc)
pus_bv = array_create(number_of_pus,random_range(0.01,1))



mask_index = sprite_index
hsp=0
vsp=0