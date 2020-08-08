/// @description Insert description here
// You can write your code in this editor
if timer_begin {
	timer++
	if timer>50 {
		//other.hspeed = 0
		//other.vspeed = 0
		if player_obj.tail_planted && place_meeting(x,y,tail_obj) {
			player_obj.tail_planted = false
			player_obj.tail_pulling = true
		}
		hello = instance_create_depth(x,y,0,temp_obj)
		if !audio_is_playing(Ice_Break__Shatter__Smash_03) {
			audio_play_sound(Ice_Break__Shatter__Smash_03,0,false)
		}
		if tail_obj.current_wall==self {
			tail_obj.current_wall = tail_obj	
		}
		if player_obj.held_position  {
			with player_obj{
				reset_intangibility()
				held_position = false
				held_release_timer = 10	
			}
		}	
		instance_destroy()	
	}
}