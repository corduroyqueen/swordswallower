/// @description Insert description here
// You can write your code in this editor
if !death {
	draw_set_color(c_dkgray)
	draw_line_width(x,y,head.x,head.y,10)

	draw_sprite_ext(venusbase_n,0,x,y,1,1,image_angle,c_white,1)
	
	

	if state==state_searching || state==state_idle {
		//draw_set_color(c_black)

		//draw_circle(
	
		//x + lengthdir_x(12,head.image_angle+90),
	
		//y + lengthdir_y(12,head.image_angle+90),
		//20,false)
	}
} else {
	draw_sprite_ext(venusbase_n,0,x,y,1,1,image_angle,c_white,1)
}


draw_set_color(c_white)