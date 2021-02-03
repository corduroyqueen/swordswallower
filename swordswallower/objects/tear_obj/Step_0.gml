/// @description Insert description here
// You can write your code in this editor
if death {
	instance_destroy(id)	
}

if in_camera_range_bigger(x,y) {
	seen = true	
}
if wall_detect(x+hsp,y+vsp) || (!in_camera_range_bigger(x,y) && seen) {
	death = true	
}

vsp+=0.75
vsp = clamp(vsp,0,20)