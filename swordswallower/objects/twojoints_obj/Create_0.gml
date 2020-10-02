/// @description Insert description here
// You can write your code in this editor
event_inherited()

arm_pin_x = x
arm_pin_y = y

rightarm = instance_create_depth(x,y,depth+1,twojoints_l_arm_obj)
rightarm.image_alpha = 0.75
rightarm.offset = 600
rightarm.minclamp = 700
rightarm.offset_diff = 200
rightarm.color = c_green

leftarm = instance_create_depth(x,y,depth-1,twojoints_l_arm_obj)
leftarm.color = c_green
leftarm.offset = 400
leftarm.offset_diff = 0

state = 1
state_idle = 1
state_attacking = 2
state_swallowing = 3
state_mouthopen = 4

attack = 0
attack_left_lunge = 1
attack_right_lunge = 2
attack_cough_flies = 3
attack_cough_tar = 4

timer=0

state_timer=0

sword_reject = true

head = instance_create_depth(x,y,depth,twojoints_head_obj)