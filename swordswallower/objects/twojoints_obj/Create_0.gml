/// @description Insert description here
// You can write your code in this editor
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