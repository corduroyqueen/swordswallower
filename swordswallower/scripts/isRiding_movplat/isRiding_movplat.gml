obj = argument0

if intangible {
	
} else if object_index==tail_obj {
	
	if player_obj.tail_planted {
		if tail_obj.current_obj==obj {
			return true	
		}
	} else if player_obj.held_position {
		
		if tail_obj.current_obj==obj {
			
			return true	
		}
	}
} else if place_meeting(x,y+2,obj)  {
	return true
} else if object_index==player_hitbox_check_obj {
	if player_obj.tail_planted {
		if tail_obj.current_obj==obj {
			return true	
		}
	}
} else if object_index==player_obj {
	if tail_obj.current_obj!=noone {
		if held_position && tail_obj.current_obj==obj {
			return true
		} 
	}
}
return false