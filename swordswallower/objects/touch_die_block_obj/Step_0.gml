/// @description Insert description here
// You can write your code in this editor
if timer_begin {
	timer++
	if timer>50 {
		other.hspeed = 0
		other.vspeed = 0
		if player_obj.tail_planted && place_meeting(x,y,tail_obj) {
			player_obj.tail_planted = false
			player_obj.tail_pulling = true
		}
		hello = instance_create_depth(x,y,0,temp_obj)

		instance_destroy()	
	}
}