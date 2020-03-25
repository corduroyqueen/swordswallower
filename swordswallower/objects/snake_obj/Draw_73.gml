/// @description Insert description here
// You can write your code in this editor

if !death {
	draw_set_color(c_red)
	gug = head.image_angle+90
	
	pointx = head.x + lengthdir_x(14,20+gug)
	pointy = head.y + lengthdir_y(14,20+gug)
	
	draw_circle(
		pointx + lengthdir_x(3,point_direction(pointx,pointy,player_obj.x,player_obj.y))
		,
		pointy + lengthdir_y(3,point_direction(pointx,pointy,player_obj.x,player_obj.y))
		,
		2, false
	)
	draw_set_color(c_white)
}