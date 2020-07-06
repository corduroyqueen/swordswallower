/// @description Insert description here
// You can write your code in this editor
num_of_flies = hp * 10
scale = 1 + (2*num_of_flies)/64
image_xscale = 1.5
image_yscale = 1.5

if swarming {
	draw_set_alpha(0.8)
	draw_set_color(c_white)
	for(i=0;i<num_of_flies;i++) {
		flies_x[i] = flies_x[i]+random_range(-2.5,2.5)+hspeed
		flies_y[i] = flies_y[i]+random_range(-2.5,2.5)+vspeed
		flies_x[i] = lerp(flies_x[i],clamp(flies_x[i],x-num_of_flies*0.5+hspeed,x+num_of_flies*0.5+hspeed),0.2)
		flies_y[i] = lerp(flies_y[i],clamp(flies_y[i],y-num_of_flies*0.5+vspeed,y+num_of_flies*0.5+vspeed),0.2)
		draw_circle(flies_x[i],flies_y[i],3,false)
	}
	
	draw_set_alpha(1)
} else {
	draw_set_alpha(1)
	draw_set_color(c_lime)
	for(i=0;i<num_of_flies;i++) {
		flies_x[i] = flies_x[i]+random_range(-3,3)+hspeed
		flies_y[i] = flies_y[i]+random_range(-3,3)+vspeed
		flies_x[i] = lerp(flies_x[i],clamp(flies_x[i],x-num_of_flies+hspeed,x+num_of_flies+hspeed),0.2)
		flies_y[i] = lerp(flies_y[i],clamp(flies_y[i],y-num_of_flies+vspeed,y+num_of_flies+vspeed),0.2)
		draw_circle(flies_x[i],flies_y[i],3,false)
	}
	draw_set_color(c_white)
}