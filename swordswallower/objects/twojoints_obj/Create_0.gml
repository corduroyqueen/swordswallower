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
attack_wall_hands = 5

timer=0

state_timer=0

sword_reject = true

head = instance_create_depth(x,y,depth,twojoints_head_obj)


h1_x = 37114
h1_x = 63190
h1_x = 66490
h1_y = 2790
h1 = instance_create_depth(h1_x,h1_y,depth+1,killbox)
h1.image_xscale = 13.09


h2_x = 37129
h2_x = 63205
h2_x = 66505
h2_y = 3532
h2 = instance_create_depth(h2_x,h2_y,depth+1,killbox)
h2.image_angle = -3.29
h2.image_xscale = 20

h1.x = 1000
h2.x = 1000
h1.y = -1000
h2.y = -1000


//srf = surface_create(1920,1080)

ht=0