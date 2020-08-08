going_right = argument0
grounded = argument1
distance= argument2
value = argument3
obj = argument4

var resetspeed = false

if grounded {
	if (!place_meeting(x+distance*going_right,y+1,wall_obj) && !place_meeting(x+distance*going_right,y+1,break_wall_obj) && !place_meeting(x+distance*going_right,y+1,door_obj)) || place_meeting(x+hsp,y,wall_obj) || place_meeting(x+hsp,y,break_wall_obj) {
		hsp=0
		going_right = !going_right
		resetspeed=true
	}
} else {
	if dir_ceiling {
		if (!place_meeting(x+distance*going_right,y-1,wall_obj) && !place_meeting(x+distance*going_right,y-1,break_wall_obj) && !place_meeting(x+distance*going_right,y-1,door_obj)) || place_meeting(x+hsp,y,wall_obj) || place_meeting(x+hsp,y,break_wall_obj) {
			hsp=0
			going_right = !going_right
			resetspeed=true
		}	
	}
	if dir_lwall {
		
		if (!place_meeting(x-1,y+distance*going_right,wall_obj) && !place_meeting(x-1,y+distance*going_right,break_wall_obj) && !place_meeting(x-1,y+distance*going_right,door_obj)) || place_meeting(x,y+vsp,wall_obj) || place_meeting(x+hsp,y,break_wall_obj) {
			vsp=0
			
			going_right = !going_right
			resetspeed=true
		}	
	}
	if dir_rwall {
		
		if (!place_meeting(x+1,y+distance*going_right,wall_obj) && !place_meeting(x+1,y+distance*going_right,break_wall_obj) && !place_meeting(x+1,y+distance*going_right,door_obj)) || place_meeting(x,y+vsp,wall_obj) {
			vsp=0
			going_right = !going_right
			resetspeed=true
		}	
	}
}

if obj==crab_obj && resetspeed {
	walk_dir = 0
}