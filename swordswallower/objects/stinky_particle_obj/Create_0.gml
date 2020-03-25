/// @description Insert description here
// You can write your code in this editor

if player_obj.tail_pulling || player_obj.tail_throwing {
	rval = irandom_range(3,4)
} else {
	rval = irandom_range(1,1.5)
}
visible = false
image_xscale = rval
image_yscale = rval

bounce_vel = 0.5 * rval
deprate = 0.01