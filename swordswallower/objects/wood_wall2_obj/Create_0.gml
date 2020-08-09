/// @description Insert description here
death = false


fly_hp = 3

sep = 15

hand_points_w_num = floor(sprite_width/sep)
hand_points_h_num = floor(sprite_height/sep)

pn_total = hand_points_w_num*2 + hand_points_h_num*2

hand_anim_i = 0

points_x = ds_list_create()
points_y = ds_list_create()
points_ang = ds_list_create()

start = true

