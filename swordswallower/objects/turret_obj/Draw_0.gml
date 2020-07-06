/// @description Insert description here
// You can write your code in this editor
if tracking {
	lol = point_direction(x,y,player_obj.x,player_obj.y)-90
	clr = c_white
	
} else {
	lol = -180
	clr = c_gray
}


draw_sprite_ext(snake_base,0,x,y,1,1,image_angle,clr,1)

draw_set_color(c_black)
draw_circle(
x + lengthdir_x(12,image_angle+90),
y + lengthdir_y(12,image_angle+90),
20,false)

if shooting {
	draw_sprite_ext(snake_head_atk,0,x,y,1,1,image_angle,clr,1)
} else {
	draw_sprite_ext(snake_head,0,x,y,1,1,image_angle,clr,1)	
}
draw_set_color(c_white)