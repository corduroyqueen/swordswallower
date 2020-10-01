/// @description Insert description here
// You can write your code in this editor
arm_initialize(800,2,two_jointed_arm_t)
hand = instance_create_depth(x,y,depth,twojoints_hand_obj)
arm_start_px = x-100
arm_start_py = x+390

arm_px = arm_start_px
arm_py = arm_start_py


//seg_add(250,noone)
//seg_add(200,noone)

//seg_set_length(0,500)
//seg_set_length(1,200)
//seg_set_length(2,100)

seg_len[0] = 450
seg_len[1] = 350

arm_length = 800


hand_tar = clamp(player_obj.x+150,x-1500,x-200)
elbow_pos_x = x-100+random_range(-5,5)+(player_obj.x-x+700)
elbow_pos_y = y+390

color = c_white

offset = 200
minclamp = 850

timer=0

elbow_hsp = 0
elbow_vel = 0

state_idle = 0
state_lunging = 1
state_knockback = 2
state_anticipation = 3
state_recovery = 4


state = state_idle


//arm_reconnect(true,x,y)

//seg_set_length(0,10)

//arm_move_to(x-500,y,true,x,y)