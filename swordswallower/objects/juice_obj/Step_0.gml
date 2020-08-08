/// @description Insert description here
// You can write your code in this editor

//if surrounded {
//	hsp=0
//	vsp=0
//	lifect++
	
//	if lifect >200 {
//		image_alpha-=0.02
//	}
//	if image_alpha<=0 {
//		instance_destroy()	
//	}
//} else {
//	if place_meeting(x+hwidth,y+hheight,wall_obj) && place_meeting(x+hwidth,y-hheight,wall_obj) 
//	&& place_meeting(x-hwidth,y+hheight,wall_obj) && place_meeting(x-hwidth,y-hheight,wall_obj) {
	
//		surrounded = true
	
//	} 
//}



//bounce_vel += (maxscale-image_xscale) * .4;
//bounce_vel *= .9;
//image_xscale += bounce_vel;
//image_yscale = maxscale+(maxscale-image_xscale)

//maxscale -= 0.05


image_xscale -= 0.05
image_yscale -= 0.05

red_value-=2
image_blend = make_color_rgb(red_value,43,143)

if image_xscale<=0 {
	instance_destroy()	
}