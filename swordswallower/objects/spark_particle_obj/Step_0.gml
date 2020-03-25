/// @description Insert description here
// You can write your code in this editor


//if place_meeting(x+hwidth,y+hheight,wall_obj) && place_meeting(x+hwidth,y-hheight,wall_obj) 
//&& place_meeting(x-hwidth,y+hheight,wall_obj) && place_meeting(x-hwidth,y-hheight,wall_obj) {

color_timer+=0.1

color1 = merge_color(c_yellow,c_white,0.5)
 
image_blend = merge_color(color1,c_black,color_timer)

if color_timer>=1 {
	instance_destroy()	
}