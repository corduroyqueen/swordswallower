/// @description Insert description here
// You can write your code in this editor
draw_sprite(round_friend,0,x,y)
draw_set_color(c_blue)
draw_circle(
	x + cos(degtorad(point_direction(x,y,player_obj.x,player_obj.y))) * 7,
	y - sin(degtorad(point_direction(x,y,player_obj.x,player_obj.y))) * 7,
	10, false
)
draw_set_color(c_white)