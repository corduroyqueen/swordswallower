xpos = argument0
ypos = argument1

if place_meeting(xpos, ypos, all_walls_parent_obj)
{
	if object_index==tail_obj {
		if place_meeting(xpos,ypos,impale_circle_obj) {
			var circle = instance_place(xpos,ypos,impale_circle_obj)
			var temp_mask = mask_index
			mask_index = sword_whirling_enemy
			if place_meeting(player_obj.start_throw_x,player_obj.start_throw_y,circle) {
				return false	
			}
			mask_index = temp_mask
		}
	} 
	return true
}
return false