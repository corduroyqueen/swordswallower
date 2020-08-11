/// @description Insert description here
// You can write your code in this editor

x = player_obj.x
y = player_obj.y
image_angle = point_direction(player_obj.x,player_obj.y,tail_obj.x,tail_obj.y)
image_xscale = (point_distance(player_obj.x,player_obj.y,tail_obj.x,tail_obj.y)/5)-10
image_yscale = 1.5
img=0

cool_list = ds_list_create()