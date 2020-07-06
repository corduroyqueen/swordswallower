/// @description Insert description here
// You can write your code in this editor


fuck = 0
h_accel = 3.75
v_accel = .1

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