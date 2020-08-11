obj = argument0

if place_meeting(x,y+1,obj) ||
(held_position && object_get_parent(current_wall.object_index)==obj) {
	return true
} 
return false