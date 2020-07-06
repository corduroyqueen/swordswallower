/// @description Insert description here
// You can write your code in this editor
arm_initialize(300,2,noone)

sword_lel = instance_create_depth(x,y,depth+1,twoarms_sword_obj)
sword_lel.parent = self

pinx = x
piny = y
hand_tar_x = pinx
hand_tar_y = piny

side = 0

parent= noone

sp = 0

elbowx = x
elbowy = y

handx = seg_x[2]
handy = seg_y[2]