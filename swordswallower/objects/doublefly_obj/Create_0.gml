/// @description Insert description here
// You can write your code in this editor



h_accel = 2.5
v_accel = .1

state = 0

state_idle = 0
state_chasing = 1

death = false
met = false

s_fly_buzz = -1

fly_emitter = audio_emitter_create()

hit_timer=0

on_target = false
inv_timer = 0

target_obj = false

on_wall = false

detect_range = 750

startpx = x
startpy = y
death_timer = 0

fly1 = false
fly2 = false

within_bound = false
bound_box = false