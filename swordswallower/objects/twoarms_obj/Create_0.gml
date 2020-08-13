/// @description Insert description here
// You can write your code in this editor

arm1_state = 0
arm2_state = 0
armstate_guarding = 0
armstate_winding = 1 
armstate_throwing = 2
armstate_swordout = 3
armstate_pulling = 4

arm1_timer = 0

hsp=0
vsp=0

arm1 = instance_create_depth(x,y,depth+1,twoarms_arm_obj)
arm1.parent = self
arm1.side = -1

arm2 = instance_create_depth(x,y,depth+1,twoarms_arm_obj)
arm2.parent = self
arm2.side = 1