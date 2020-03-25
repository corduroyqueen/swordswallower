/// @description Insert description here
// You can write your code in this editor
bounce_vel += (rval-image_xscale) * .8
bounce_vel *= 0.9

image_xscale += bounce_vel
image_yscale = rval+(rval-image_xscale)
rval-=deprate
if image_xscale<=0 || image_yscale<=0 {
	instance_destroy()	
}