/// @description Insert description here
// You can write your code in this editor
if player_obj.tail_throwing {
	with tail_obj {
		sword_reject_script()
		x = other.x
		y = other.y
	}
	state = state_parent_tar
} else if player_obj.tail_pulling {
	if state!=state_parent_tar {
		instance_destroy(id)	
	}
}