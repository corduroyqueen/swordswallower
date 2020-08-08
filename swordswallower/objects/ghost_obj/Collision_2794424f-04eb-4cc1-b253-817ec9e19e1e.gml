/// @description Insert description here
// You can write your code in this editor
if other.zoom_timer_bool && sword_present {
	player_obj.tail_planted = false
	player_obj.tail_pulling = true
	
	player_obj.zoom_timer_bool = false
	player_obj.zoom_timer = 0
	player_obj.bounced = false
	player_obj.zoom_ctdn = 0
	player_obj.held_position_ready = false
				
	player_obj.bounce_buff_timer = 0
				
	reset_intangibility()
				
	if player_obj.bounce_buff_timer==0 || place_meeting(x,y,impale_circle_obj) || place_meeting(x,y,ghost_obj) {
		//player_obj.hsp *= 0.75
		//player_obj.vsp *= 0.75
		player_obj.hsp = clamp(player_obj.hsp,-17,17)
		player_obj.vsp = clamp(player_obj.vsp,-17,17)
	}
}