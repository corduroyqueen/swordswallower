/// @description Insert description here
// You can write your code in this editor

if player_obj.tail_planted {

	player_obj.tail_dest_x = x
	player_obj.tail_dest_y = y

	if !met {
		met = true
		sky_obj.day = !sky_obj.day
		
		instance_activate_all()	
		with(dash_guy_obj) {
			if death {
				visible = true
				angry = false
				angry_timer= 0
				death = false
				met = false
				intangible = false
				angry_timer_m = 65
				sprite_index = follow_guy
				hspeed =0
				vspeed= 0
			}
		}
		
	}
}