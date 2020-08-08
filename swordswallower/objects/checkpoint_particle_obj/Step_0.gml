/// @description Insert description here
// You can write your code in this editor

if !visible && place_meeting(x,y,wall_obj) {
	instance_destroy()	
} else {
	visible = true	
}
bounce_vel += (rval-image_xscale)
bounce_vel *= 0.9

image_xscale += bounce_vel
image_yscale = rval+(rval-image_xscale)
rval-=deprate
if image_xscale<=0 || image_yscale<=0 {
	instance_destroy()	
}
hsp = lerp(hsp,0,0.1)