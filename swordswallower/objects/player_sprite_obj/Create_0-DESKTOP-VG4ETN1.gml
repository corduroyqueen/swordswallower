/// @description Insert description here
// You can write your code in this editor

facing_right = false

image_xscale = 1
image_yscale = 1
depth = 500

player_surface = surface_create(300,300)


spr_tarred = false
spr_tarheight = 0
spr_tarred_a = 0


spr_bloodied = false
spr_bloodied_a = 0


s_player_idle_e = cc_idle111
s_player_crouch_e = cc_crouch111
s_player_run_e = cc_run_e111

s_player_idle_s = cc_idle111
s_player_crouch_s = cc_crouch111
s_player_run_s = cc_run_s111

s_boost = boost



s_player_idle_e = spr_mc_idle
s_player_crouch_e = spr_mc_crouch
s_player_run_e = spr_mc_run
s_player_falling_e = spr_mc_falling


s_player_idle_s = spr_mc_idle
s_player_crouch_s = spr_mc_crouch
s_player_run_s = spr_mc_run
s_player_falling_s = spr_mc_falling

s_player_wall_cling = spr_mc_wall_cling
s_player_ceil_cling = spr_mc_tophang

s_player_dash = spr_mc_dash
s_boost = boost

arm_pin_x = 152
arm_pin_y = 170

arm_hand_x = 150+1
arm_hand_y = 150-20

arm_max_length = 34
arm_seg_length_1 = arm_max_length/2
arm_seg_length_2 = arm_max_length/2

hsp=0
vsp=0

head_sprite = noone

sword_pos_x = x
sword_pos_y = y
sword_facing = 1
sword_ang = -120

sword_s = 2
sword_s_planted = 1
sword_s_dragging = 2
sword_s_air = 3

sword_planted_held = false
sword_planted_bounds = false

sword_tx = tail_obj.x
sword_ty = tail_obj.y

outline_init()

head_pos_table_x = array_create(6)
head_pos_table_y = array_create(6)

head_pos_table_x[0] = 8
head_pos_table_x[1] = 11
head_pos_table_x[2] = 10
head_pos_table_x[3] = 12
head_pos_table_x[4] = 13
head_pos_table_x[5] = 11

head_pos_table_y[0] = -25
head_pos_table_y[1] = -22
head_pos_table_y[2] = -21
head_pos_table_y[3] = -18
head_pos_table_y[4] = -24
head_pos_table_y[5] = -24


arm_pos_table_x[0] = 6
arm_pos_table_x[1] = 9
arm_pos_table_x[2] = 8
arm_pos_table_x[3] = 10
arm_pos_table_x[4] = 11
arm_pos_table_x[5] = 9

arm_pos_table_y[0] = -17
arm_pos_table_y[1] = -14
arm_pos_table_y[2] = -13
arm_pos_table_y[3] = -10
arm_pos_table_y[4] = -16
arm_pos_table_y[5] = -16