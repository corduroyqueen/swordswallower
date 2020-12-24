xpos = argument0
ypos = argument1

if position_meeting(xpos, ypos, wall_parent_obj) && !level1_master.in_void {
	return true
}
return false