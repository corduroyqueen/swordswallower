/// @description Insert description here
// You can write your code in this editor
camera_set_view_pos(view_camera[0],x-640,y-360)
key_left = ord("A")
key_right = ord("D")
key_jump = vk_space

hp = 1
inv_timer = 0
inv_delay = 4
inv_count = 0
inv_max = 40
dmg_flashing = false
damage_start = false

h_accel = 0.42
h_decel_g = 0.6
h_decel_a = 0.025
h_decel = 0
walk_timer = 0

jump_able = false

jump_height = 13
v_decel = 0.2
jump_buff_timer = 0

max_hs = 8.75
max_vs = 30

//grav = .185
grav = .43
grav_j = .15
start_grav = grav
grav_jv = .15
grav_boost = .185

grounded=false

step_height=5

sprite = instance_create_depth(x,y,0,player_sprite_obj)

startx = x
starty = y

state=0

zspeed=100
//zspeed=20
zspeed_enemy = 28.5
zspeed_normal = 28.5
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

camx = player_obj.x-640
camy = player_obj.y-360

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
zoom_max_interact = 25
zoom_dist = 125
zoom_pause = false
zoom_ctdn = 0
zoom_particle_timer = 0
check_zoom_collision = false
click_out_of_wall_timer = 0

line_go = 0

hit_pause = 0

bounced = false
bounce_buff_timer = 0

left_click_buffer = 0

held_start_hspeed = 0
held_start_vspeed = 0
held_bounce_timer = 0

cool = true

stinky_check = false

move_locked = false

xpreva = x
ypreva = y

death = false
start_death = false

gem_active = false
gem_thrown = false

fire_active = false

treasure_count = 0

checkpoint_num = level1_master.checkpoint_num

view_visible[0] = true
view_visible[1] = false

shake_d = 0
camera_shake_d = false

camera_shake_direc = false
cam_ang = 0
shake_dir = 0

start_ckpt_timer=0
ckpt_place_toggle = true

shielded = false

thin_floor_bool = false


keys=ds_list_create()

footstep_timer = 0
footstep_timer_m = 7