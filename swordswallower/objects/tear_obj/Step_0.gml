/// @description Insert description here
// You can write your code in this editor
if death {
	instance_destroy()	
}

if in_camera_range_bigger(x,y) {
	seen = true	
}
if wall_checker(x+hspeed,y+vspeed) || (!in_camera_range_bigger(x,y) && seen) {
	death = true	
}

vspeed+=0.75
vspeed = clamp(vspeed,0,20)