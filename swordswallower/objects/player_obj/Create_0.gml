/// @description Insert description here
// You can write your code in this editor
event_inherited()
camera_set_view_pos(view_camera[0],x-640,y-360)

key_left = ord("A")
key_right = ord("D")
key_jump = vk_space

k_left = keyboard_check(ord("A"))
k_left_p = keyboard_check_pressed(ord("A"))
k_left_r = keyboard_check_released(ord("A"))
	
k_right = keyboard_check(ord("D"))
k_right_p = keyboard_check_pressed(ord("D"))
k_right_r = keyboard_check_released(ord("D"))

k_down = keyboard_check(ord("S"))
k_down_p = keyboard_check_pressed(ord("S"))
k_down_r = keyboard_check_released(ord("S"))

k_up = keyboard_check(ord("W"))
k_up_p = keyboard_check_pressed(ord("W"))
k_up_r = keyboard_check_released(ord("W"))

k_ckpt = keyboard_check(vk_space)
k_ckpt_p = keyboard_check_pressed(vk_space)
k_ckpt_r = keyboard_check_released(vk_space)

k_fire_p = mouse_check_button_pressed(mb_left)
k_fire_r = mouse_check_button_released(mb_left)
k_fire = mouse_check_button(mb_left)

k_dash_p = mouse_check_button_pressed(mb_right)
k_dash_r = mouse_check_button_released(mb_right)
k_dash = mouse_check_button(mb_right)

k_map_p = mouse_check_button_pressed(mb_right)
k_map_r = mouse_check_button_released(mb_right)
k_map = mouse_check_button(mb_right)

k_speak_p = mouse_check_button_pressed(mb_right)
k_speak_r = mouse_check_button_released(mb_right)
k_speak = mouse_check_button(mb_right)


hp = 1
inv_timer = 0
inv_delay = 4
inv_count = 0
inv_max = 40
dmg_flashing = false
damage_start = false

h_accel = 0.75
h_accel_g = 0.75
h_accel_a =1.5
h_accel_reduc = 1

h_dir_bool = true

h_decel_g = 1.05
h_decel_a = 0.045
h_decel = 0
walk_timer = 0

jump_able = false

jump_height = 26
v_decel = 0.3
jump_buff_timer = 0

max_hs_g = 13.35
max_hs_a = 9


max_vs = 45

//grav = .185
grav = 1.05
start_grav = grav
grav_jv = .25
grav_boost = .2775

grounded=false

step_height=10

sprite = player_sprite_obj

startx = x
starty = y

state=0

zspeed=150
//zspeed=20
zspeed_enemy = 42.75
zspeed_normal = 42.75
//zspeed=20
zoom_buff_timer = 0
zoom_out_of_wall_timer = 0

zoom_allow = 0

zoom_modified_jump = false
held_position = false
boosting_collision_check = false

tail_carry = true
tail_throwing = false
tail_planted = false
tail_pulling = false
tail_zooming = false
tail_held = false
winding=false

cam_height = camera_get_view_height(view_camera[0])
cam_width = camera_get_view_width(view_camera[0])
cam_height_h = cam_height/2
cam_width_h = cam_width/2
camera_shake = false

camx = player_obj.x-960
camy = player_obj.y-540
camxlast = camx
camylast = camy
camxdiff = camx - camxlast
camydiff = camy - camylast

c_slingshot = false
c_slingtimer = 0

start_throw_x = x
start_throw_y = y
tail_dest_x = 0
tail_dest_y = 0
held_release_timer = 0

zoom_timer = 0
zoom_speedx = 0
zoom_speedy = 0

wall_jump_x = 5
wall_jump_y = 4

zoom_timer_bool = false
zoom_hitbox_active = false
zoom_max_interact = 25
zoom_dist = 125
zoom_pause = false
zoom_ctdn = 0
zoom_particle_timer = 0
check_zoom_collision = false
click_out_of_wall_timer = 0

hit_pause = 0

bounced = false
bounce_buff_timer = 0

left_click_buffer = 0

held_start_hsp = 0
held_start_vsp = 0
held_bounce_timer = 0

cool = true

stinky_check = false

move_locked = false

xpreva = x
ypreva = y
xpreva1 = x
ypreva1 = y
xpreva2 = x
ypreva2 = y

death = false
start_death = false

gem_active = false
gem_thrown = false

fire_active = false

treasure_count = 0

checkpoint_num = level1_master.checkpoint_num
last_checkpoint = noone

view_visible[0] = true
view_visible[1] = false

mapout = false

shake_d = 0
camera_shake_d = false

camera_shake_direc = false
cam_ang = 0
shake_dir = 0

start_ckpt_timer=0
ckpt_place_toggle = true

shielded = false

thin_floor_bool = false


keylist = ds_list_create()

footstep_timer = 0
footstep_timer_m = 7

ending_lock = false

respawn_timer = 0
init_camera_set = true

audio_listener_orientation(0,1,0,0,0,1)

prev_pos_t = 0

out_of_dash_t = 0
out_of_dash_m = 100

shockwave_shader.trigger = true
shockwave_shader.strength_input = 0.1

stuck_check = 0

gems=0

wall_kicked = false

ckpt_place_timer = 0
ckpt_place_timer_m = 120

door_enter =false

ckpt_bool = false




///ability bools
ability_held_release_jump = false
ability_held_release_m=5

ability_spin_jump = false
ability_spin_jump_e = true


ang1 = 0
ang2 = 0

hsp = 0
vsp = 0

xRemainder = 0
yRemainder = 0
move = 0
move_dir = 0

enemy_collided_list = ds_list_create()
enemy_collided_total_list = ds_list_create()

camera_fix_bounds = false
camera_fix = false

footstep_audio_bool = true
held_position_start = false

dt = 1
//global.blood_cr = 0.73
//global.blood_cg = 0.19
//global.blood_cb = 0.43

blood_color = make_color_rgb(0.9 * 255, 0.0 * 255, 0.3 * 255)
//blood_color = make_color_rgb(1 * 255, 0 * 255, 0 * 255)

kkb = false
oldcx = 0
oldcy = 0

dash_sound_base = false