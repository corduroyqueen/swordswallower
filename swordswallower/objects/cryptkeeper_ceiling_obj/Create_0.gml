/// @description Insert description here
// You can write your code in this editor

h_accel = .3
h_max_speed = 2.5

grav = .4

going_right = false

met = false
sword_present = false

death = false

creat_cd = 25

writhing = false
falling = false
fallingoverride = false
override_killready = false


state = 0

state_idle = 0
state_chasing = 1
state_hitting = 2
state_knockback = 3

knockback_timer = 0
knockback_amt = 30

grav = .26

h_accel = .25

h_decel_g = 0.35
h_decel_a = 0.025
h_decel = 0

h_walk_speed = 2.5
h_max_speed = 10

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


if place_meeting(x,y+creat_cd,wall_obj) || place_meeting(x,y+creat_cd,break_wall_obj) || place_meeting(x,y+creat_cd,door_obj) {
	dir_ground = true
	dir_lwall = false
	dir_rwall = false
	dir_ceiling = false
} else if place_meeting(x,y-creat_cd-7,wall_obj) || place_meeting(x,y-creat_cd-7,break_wall_obj) || place_meeting(x,y-creat_cd-7,door_obj) {
	dir_ground = false
	dir_lwall = false
	dir_rwall = false
	dir_ceiling = true
	image_angle = 180
} else if place_meeting(x-creat_cd,y,wall_obj) || place_meeting(x-creat_cd,y,break_wall_obj) || place_meeting(x-creat_cd,y,door_obj) {
	dir_ground = false
	dir_lwall = true
	dir_rwall = false
	dir_ceiling = false
	image_angle = 270
} else if place_meeting(x+creat_cd,y,wall_obj) || place_meeting(x+creat_cd,y,break_wall_obj) || place_meeting(x+creat_cd,y,door_obj) {
	dir_ground = false
	dir_lwall = false
	dir_rwall = true
	dir_ceiling = false
	image_angle = 90
}

if dir_ground || dir_ceiling {
	walk_dir = hsp
	walk_perp = vsp
} else {
	walk_perp = hsp
	walk_dir = vsp
}

if dir_ground {
	while !place_meeting(x,y+0.01,wall_obj) && !place_meeting(x,y+0.01,break_wall_obj) {
		y+=0.01	
	}
}
if dir_ceiling{
	while !place_meeting(x,y-0.01,wall_obj) && !place_meeting(x,y-0.01,break_wall_obj) {
		y-=0.01	
	}
}
if dir_lwall {
	while !place_meeting(x-0.01,y,wall_obj) && !place_meeting(x-0.01,y,break_wall_obj) {
		x-=0.01	
	}
}
if dir_rwall {
	while !place_meeting(x+0.01,y,wall_obj) && !place_meeting(x-0.01,y,break_wall_obj) {
		x+=0.01	
	}
}
fly_hp = 4
last_fly_hp = 4
//if dir_ground {
//	while !place_meeting(x,y+0.01,wall_obj) {
//		y+=0.01	
//	}
//}
//if dir_ceiling{
//	while !place_meeting(x,y-0.01,wall_obj) {
//		y-=0.01	
//	}
//}
//if dir_lwall {
//	while !place_meeting(x-0.01,y,wall_obj) {
//		x-=0.01	
//	}
//}
//if dir_rwall {
//	while !place_meeting(x+0.01,y,wall_obj) {
//		x+=0.01	
//	}
//}


if !variable_instance_exists(id,"fumbling_timer"){
	fumbling_timer = 0
}
if !variable_instance_exists(id,"detect_range"){
	detect_range = 500
}