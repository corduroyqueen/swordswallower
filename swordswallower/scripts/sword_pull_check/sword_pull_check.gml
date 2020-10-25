if !tail_obj.state_stuck && !tail_obj.planted_rejecting {
	player_obj.tail_pulling = true
	
	player_obj.tail_planted = false
	player_obj.tail_throwing = false
	player_obj.tail_carry = false
}