/// @description Insert description here
// You can write your code in this editor

if place_meeting(x,y-10,wall_obj) {
	ceiling_obj = instance_place(x,y-10,wall_obj)	
} else if place_meeting(x,y-10,black_wall_obj) {
	ceiling_obj = instance_place(x,y-10,black_wall_obj)	
}

on_wall = false

h_accel = 2.5
v_accel = .1

state = 0

state_idle = 0
state_chasing = 1

death = false
met = false

s_fly_buzz = -1

while !place_meeting(x,y,ceiling_obj) {
	y-=0.01	
}

fly_emitter = audio_emitter_create()

hit_timer=0

on_target = false
inv_timer = 0

target_obj = false

startx = x
starty = y
death_timer = 0

within_bound = false
bound_box = false