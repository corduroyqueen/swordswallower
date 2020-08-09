/// @description Insert description here
// You can write your code in this editor
event_inherited()
hp = 2
death = false

/// @description Insert description here
// You can write your code in this editor


fuck = 0
h_accel = 5
v_accel = .1
h_accel_base = 5

chirp_timer = 0 
chirp_timer_m = random_range(10,20)
chirp = choose(eye_chirp1,eye_chirp2,eye_chirp3)

state = 0

state_idle = 0
state_chasing = 1

death = false
met = false

s_fly_buzz = -1

fly_emitter = audio_emitter_create()

inv_timer=0

hit_timer=0

on_target = false

target_obj = false

on_wall = false

startx = x
starty = y
death_timer = 0

spawn = false

within_bound = false
bound_box = false

eyespr = pinkeye

shriek = false

swarm_respawn_t = 0
swarm_respawn_m = 30
swarming = false

flies = array_create(40)
flies_x = array_create(40)
flies_y = array_create(40)
num_of_flies = 40
met = false
for(i=0;i<100;i++) {
	flies_x[i] = x+random_range(-num_of_flies,num_of_flies)
	flies_y[i] = y+random_range(-num_of_flies,num_of_flies)
}

hsp=0
vsp=0