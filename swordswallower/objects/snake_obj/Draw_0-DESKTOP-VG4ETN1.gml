/// @description Insert description here
// You can write your code in this editor
if !death {
	if state!=state_idle && state!=state_searching {
		draw_set_color(c_white)
		var angles = point_direction(x,y,head.x,head.y)
		var ct = floor(point_distance(x,y,head.x,head.y)/64)
		for (i=0;i<ct;i++) {
			draw_sprite_ext(venusstem,0,x+cos(degtorad(angles))*i*64,y-sin(degtorad(angles))*i*64,0.4,1,angles+270,c_white,1)
			if sqr(i)%3==0 {
				draw_sprite_ext(venusleaf,0,x+cos(degtorad(angles))*i*64,y-sin(degtorad(angles))*i*64,0.4,0.4,angles+270 + 180 * (i%2),c_white,1)
			}
			if (sqr(i)+1)%2==0 {
				draw_sprite_ext(venusleaf2,0,x+cos(degtorad(angles))*i*64,y-sin(degtorad(angles))*i*64,0.4,-0.4,angles-30 + 180 * (i%3),c_white,1)
			}
		}
		with head {
			draw_sprite_ext(venusstem,0,x+cos(degtorad(angles+180))*64,y-sin(degtorad(angles+180))*64,0.4,1,angles+270,c_white,1)
		}
	}
	
	//draw_set_color(c_dkgray)
	//draw_line_width(x,y,head.x,head.y,10)

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