within_bound = argument0

if within_bound { 
	if !check_bounding_box(bound_box,player_obj.x,player_obj.y) 
	&& !(check_bounding_box(bound_box,tail_obj.x,tail_obj.y) && tail_obj.stinky) {
		return false
	} else { return true}
} else { 
	return true 
}