/// @description Insert description here
// You can write your code in this editor
event_inherited()
docile = true
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
attack_wall_hands_switch = 6

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
h1.sx = h1_x
h1.sy = h1_y

h1_lerp = 0


h2_x = 37129
h2_x = 63205
h2_x = 66505
h2_y = 3532
h2 = instance_create_depth(h2_x,h2_y,depth+1,killbox)
h2.image_angle = -3.29
h2.image_xscale = 20
h2.sx = h2_x
h2.sy = h2_y

h2_lerp = -20

h3_x = 37129
h3_x = 63205
h3_x = 66505
h3_y = 2790
h3 = instance_create_depth(h3_x,h3_y,depth+1,killbox)
h3.image_xscale = 1
h3.image_yscale = 20
h3.sx = h3_x
h3.sy = h3_y

h3_lerp = 0

h1.x = 1000
h2.x = 1000
h3.x = 1000
h1.y = -1000
h2.y = -1000
h3.y = -1000

chosen_wall = h1

phase1_atk = ds_list_create()
phase2_atk = ds_list_create()
phase3_atk = ds_list_create()

phase_n_i = 1000
phase_n = 0

hands_ceiling_a = false
hands_wall_a = false
if choose(-1,1)>0 {
	ds_list_add(phase1_atk,3)
	ds_list_add(phase1_atk,5)
} else {
	ds_list_add(phase1_atk,5)
	ds_list_add(phase1_atk,3)
}
var k = choose(3,5,1)
ds_list_add(phase1_atk,k)
if k!=1 {
	ds_list_add(phase1_atk,1)
}
ds_list_add(phase1_atk,choose(3,5))
ds_list_add(phase1_atk,1)

end_hand_switch = false
hand_switch_init = false

ds_list_add(phase2_atk,6)
ds_list_add(phase2_atk,3)
ds_list_add(phase2_atk,choose(5,6))
ds_list_add(phase2_atk,3)
ds_list_add(phase2_atk,2)
ds_list_add(phase2_atk,choose(3,5,6))
ds_list_add(phase2_atk,2)


ds_list_add(phase3_atk,6)
ds_list_add(phase3_atk,3)
ds_list_add(phase3_atk,3)
ds_list_add(phase3_atk,6)
ds_list_add(phase3_atk,3)
ds_list_add(phase3_atk,choose(5,6))
ds_list_add(phase3_atk,3)
ds_list_add(phase3_atk,3)
ds_list_add(phase3_atk,3)



//srf = surface_create(1920,1080)

ht=0