/// @description Insert description here
// You can write your code in this editor

facing_right = false

image_xscale = 1
image_yscale = 1
//depth = 500

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
s_player_idle_e = IdleNew4
s_player_crouch_e = spr_e_crouch
s_player_run_e = spr_mc_run
s_player_run_e = spr_e_run_smaller
s_player_falling_e = spr_mc_falling
s_player_falling_e = spr_e_falling2


s_player_idle_s = spr_mc_idle
s_player_idle_s = IdleNew4
s_player_crouch_s = spr_e_crouch
s_player_run_s = spr_mc_run
s_player_run_s = spr_e_run_smaller
s_player_falling_s = spr_mc_falling
s_player_falling_s = spr_e_falling2

s_player_wall_cling = spr_mc_wall_cling
s_player_wall_cling = spr_e_falling2
s_player_ceil_cling = spr_mc_tophang
s_player_ceil_cling = spr_e_falling2

s_player_dash = spr_mc_dash
s_boost = boost

arm_pin_x = 152
arm_pin_y = 170

arm_hand_x = 150+1
arm_hand_y = 150-20


arm_max_length = 34
arm_max_length = 44
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

scrape_s = s_sword_scrape
audio_sound_pitch(scrape_s,0.5)

part_floor_spawnx = x
part_floor_spawny = y

head_pos_table_x = array_create(6)
head_pos_table_y = array_create(6)

head_pos_table_x[0] = 8
head_pos_table_x[1] = 11
head_pos_table_x[2] = 10
head_pos_table_x[3] = 12
head_pos_table_x[4] = 13
head_pos_table_x[5] = 11
head_pos_table_x[6] = 8
head_pos_table_x[7] = 11
head_pos_table_x[8] = 10
head_pos_table_x[9] = 12
head_pos_table_x[10] = 13
head_pos_table_x[11] = 11



head_pos_table_y[0] = -25
head_pos_table_y[1] = -22
head_pos_table_y[2] = -21
head_pos_table_y[3] = -18
head_pos_table_y[4] = -24
head_pos_table_y[5] = -24
head_pos_table_y[6] = -25
head_pos_table_y[7] = -22
head_pos_table_y[8] = -21
head_pos_table_y[9] = -18
head_pos_table_y[10] = -24
head_pos_table_y[11] = -24

arm_add_f = -5
arm_pos_table_x[0] = 6+arm_add_f
arm_pos_table_x[1] = 9+arm_add_f
arm_pos_table_x[2] = 8+arm_add_f
arm_pos_table_x[3] = 10+arm_add_f
arm_pos_table_x[4] = 11+arm_add_f
arm_pos_table_x[5] = 9+arm_add_f
arm_pos_table_x[6] = 6+arm_add_f
arm_pos_table_x[7] = 9+arm_add_f
arm_pos_table_x[8] = 8+arm_add_f
arm_pos_table_x[9] = 10+arm_add_f
arm_pos_table_x[10] = 11+arm_add_f
arm_pos_table_x[11] = 9+arm_add_f

var add_t = -8
arm_pos_table_y[0] = -17 + add_t
arm_pos_table_y[1] = -14 + add_t
arm_pos_table_y[2] = -13 + add_t
arm_pos_table_y[3] = -10 + add_t
arm_pos_table_y[4] = -16 + add_t
arm_pos_table_y[5] = -16 + add_t
arm_pos_table_y[6] = -17 + add_t
arm_pos_table_y[7] = -14 + add_t
arm_pos_table_y[8] = -13 + add_t
arm_pos_table_y[9] = -10 + add_t
arm_pos_table_y[10] = -16 + add_t
arm_pos_table_y[11] = -16 + add_t



sword_recoil = false
angsp = 0

cape_p_l_x = ds_list_create()
cape_p_l_y = ds_list_create()
cape_p_l_wind_timer = ds_list_create()
cape_p_l_vsp = ds_list_create()

ds_list_add(cape_p_l_x,140)
ds_list_add(cape_p_l_x,140)
ds_list_add(cape_p_l_x,140)
ds_list_add(cape_p_l_x,140)
ds_list_add(cape_p_l_x,140)
ds_list_add(cape_p_l_x,140)
ds_list_add(cape_p_l_x,140)

ds_list_add(cape_p_l_y,130)
ds_list_add(cape_p_l_y,140)
ds_list_add(cape_p_l_y,150)
ds_list_add(cape_p_l_y,160)
ds_list_add(cape_p_l_y,170)
ds_list_add(cape_p_l_y,180)
ds_list_add(cape_p_l_y,190)

ds_list_add(cape_p_l_vsp,0)
ds_list_add(cape_p_l_vsp,0)
ds_list_add(cape_p_l_vsp,0)
ds_list_add(cape_p_l_vsp,0)
ds_list_add(cape_p_l_vsp,0)
ds_list_add(cape_p_l_vsp,0)
ds_list_add(cape_p_l_vsp,0)


lightness = 0.5
cloak_color = make_color_rgb(lightness*255,lightness*255,lightness*255)
lightness = 0.3
cloak_color_dark = make_color_rgb(lightness*255,lightness*255,lightness*255)

wind_timer_m = 1
ds_list_add(cape_p_l_wind_timer,(0/7)*wind_timer_m)
ds_list_add(cape_p_l_wind_timer,(6/7)*wind_timer_m)
ds_list_add(cape_p_l_wind_timer,(5/7)*wind_timer_m)
ds_list_add(cape_p_l_wind_timer,(4/7)*wind_timer_m)
ds_list_add(cape_p_l_wind_timer,(3/7)*wind_timer_m)
ds_list_add(cape_p_l_wind_timer,(2/7)*wind_timer_m)
ds_list_add(cape_p_l_wind_timer,(1/7)*wind_timer_m)



cape_p_m_x = ds_list_create()
cape_p_m_y = ds_list_create()

cape_p_r_x = ds_list_create()
cape_p_r_y = ds_list_create()
cape_p_r_wind_timer = ds_list_create()

ds_list_add(cape_p_r_x,140)
ds_list_add(cape_p_r_x,140)
ds_list_add(cape_p_r_x,140)
ds_list_add(cape_p_r_x,140)
ds_list_add(cape_p_r_x,140)
ds_list_add(cape_p_r_x,140)
ds_list_add(cape_p_r_x,140)

ds_list_add(cape_p_r_y,130)
ds_list_add(cape_p_r_y,140)
ds_list_add(cape_p_r_y,150)
ds_list_add(cape_p_r_y,160)
ds_list_add(cape_p_r_y,170)
ds_list_add(cape_p_r_y,180)
ds_list_add(cape_p_r_y,190)


ds_list_add(cape_p_r_wind_timer,(6/7)*wind_timer_m)
ds_list_add(cape_p_r_wind_timer,(5/7)*wind_timer_m)
ds_list_add(cape_p_r_wind_timer,(4/7)*wind_timer_m)
ds_list_add(cape_p_r_wind_timer,(3/7)*wind_timer_m)
ds_list_add(cape_p_r_wind_timer,(2/7)*wind_timer_m)
ds_list_add(cape_p_r_wind_timer,(1/7)*wind_timer_m)
ds_list_add(cape_p_r_wind_timer,(0/7)*wind_timer_m)

head_spr_i = 0

spr_mc_head_idle = e_head_idle