/// @description Insert description here
// You can write your code in this editor
wall_friend.x = x + cos(degtorad(point_direction(x,y,player_obj.x,player_obj.y))) * 75
wall_friend.y = y - sin(degtorad(point_direction(x,y,player_obj.x,player_obj.y))) * 75
wall_friend.image_angle = point_direction(x,y,player_obj.x,player_obj.y) + 270

if death {
	instance_destroy(wall_friend)	
	just_blood(tail_obj.hsp,tail_obj.vsp,0.2,80,true,sprite_width/2,sprite_height/2)
	instance_destroy()	
}