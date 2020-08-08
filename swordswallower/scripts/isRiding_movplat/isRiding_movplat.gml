obj = argument0

if object_index==tail_obj {
	if player_obj.tail_planted {
		if object_get_parent(tail_obj.current_wall.object_index)==obj {
			return true	
		}
	}
} else if place_meeting(x,y+2,obj)  {
	return true
} else if object_index==player_obj {
	if tail_obj.current_wall!=noone {
		if held_position && object_get_parent(tail_obj.current_wall.object_index)==obj {
			return true
		} 
	}
}
return false