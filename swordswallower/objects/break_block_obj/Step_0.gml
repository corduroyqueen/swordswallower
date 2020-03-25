/// @description Insert description here
// You can write your code in this editor
if gone {
	timer++
	if timer>100 {
		gone = false	
		timer = 0
	}
	sprite_index=noone
	
} else {
	sprite_index=break_block_spr
	if timer_begin {
		timer++
		if timer>50 {
			if player_obj.tail_planted && place_meeting(x,y,tail_obj) {
				//player_obj.tail_planted = false
				//player_obj.tail_pulling = true
			}
			timer=0
			gone = true
			timer_begin = false
			if tail_obj.current_wall==self {
				player_obj.tail_planted = false
				player_obj.tail_pulling = true
				if player_obj.held_position {
					player_obj.held_position = false
					player_obj.held_release_timer=10
				}
			}
			
		}
	} 
	if place_meeting(x,y,tail_obj) && player_obj.held_position {
		timer_begin = true	
	}
}