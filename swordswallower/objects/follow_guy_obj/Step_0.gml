/// @description Insert description here
// You can write your code in this editor

if angry {
	angry_timer++
	if angry_timer<200 {
		y = lerp(y,player_obj.y,0.1)
	} else {
		vsp = 0
		hsp = 15 * -image_xscale
		sprite_index = follow_guy_angry
	}
	
} else {
	if going_up {
	
		if place_meeting(x,y-vs,wall_obj) {
			going_up = false
			return
		} else {
			vsp = -vs
		}
	} else {
	
		if place_meeting(x,y+vs,wall_obj) {
			going_up = true
			return
		} else {
			vsp = vs
		}
	}
	if distance_to_object(player_obj)<500 {
		angry = true	
	}
	if distance_to_object(player_obj)<1280 {
		image_xscale = player_obj.image_xscale
	}
}