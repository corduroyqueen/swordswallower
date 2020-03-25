xv = argument0
yv = argument1

if place_meeting(xv,yv,wall_obj) 
|| place_meeting(xv,yv,moving_platform_obj) 
|| place_meeting(xv,yv,falling_rock_obj)
|| place_meeting(xv,yv,black_wall_obj)
|| place_meeting(xv,yv,falling_rock_obj)
|| place_meeting(xv,yv,wood_wall_obj)
|| place_meeting(xv,yv,switch_wall_obj)
|| place_meeting(xv,yv,voidwall_obj)
|| place_meeting(xv,yv,close_wall_obj)
|| place_meeting(xv,yv,mach_timed_hazard_obj)
|| place_meeting(xv,yv,mach_hazard_obj)
|| place_meeting(xv,yv,mach_moving_wall_obj)
|| place_meeting(xv,yv,mach_door_obj)
|| place_meeting(xv,yv,sinking_platform_obj)
|| place_meeting(xv,yv,break_block_obj) {
	return true;	
}