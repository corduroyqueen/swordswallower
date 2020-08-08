/// @description Insert description here
// You can write your code in this editor
if death {
	instance_destroy()	
}

move_towards_point(x+xoff,y+yoff,mspeed)
image_angle = point_direction(x,y,x+xoff,y+yoff) + 90

if wall_detect(x+hsp,y+vsp) || !in_camera_range_bigger(x,y)
|| place_meeting(x,y,tar_obj) {
	death = true	
}
