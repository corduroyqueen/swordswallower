/// @description Insert description here
// You can write your code in this editor
if death {
	instance_destroy()	
}

move_towards_point(x+xoff,y+yoff,mspeed)

if wall_detect_solids(x+hsp,y+vsp) {
	death = true	
}