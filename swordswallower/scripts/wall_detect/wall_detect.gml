xpos = argument0
ypos = argument1

if place_meeting(xpos, ypos, wall_parent_obj) ||
(position_meeting(xpos, ypos + sprite_get_bbox_bottom(mask_index) - sprite_get_yoffset(mask_index), thin_floor_obj) &&
!position_meeting(xpos, ypos + sprite_get_bbox_bottom(mask_index) - sprite_get_yoffset(mask_index)-1, thin_floor_obj) &&
(!player_obj.k_down || object_index!=player_obj) &&
vsp>=0 )
{
	return true
}
return false