/// @description Insert description here
// You can write your code in this editor
if death {
	instance_destroy()	
}

move_towards_point(x+xoff,y+yoff,mspeed)

if wall_checker(x+hspeed,y+vspeed) || !in_camera_range_bigger(x,y)
|| place_meeting(x,y,tar_obj) {
	death = true	
}
