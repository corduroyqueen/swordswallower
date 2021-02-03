/// @description Insert description here
// You can write your code in this editor
if start {
	return	
}
if fly_hp<=0 {
	death = true	
	if player_obj.tail_planted && tail_obj.current_obj==self {
		player_obj.tail_planted = false
		player_obj.tail_pulling = true
	}
}
if death {
	instance_destroy(id)	
}