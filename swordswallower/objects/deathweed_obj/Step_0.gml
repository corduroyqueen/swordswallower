/// @description Insert description here
// You can write your code in this editor
if start {
	if active {
		perm = true	
	} else {
		perm = false	
	}
	start = false
}


if player_obj.fire_active {
	if point_distance(x,y,tail_obj.x,tail_obj.y)<150 ||	
	point_distance(x,y,player_obj.x,player_obj.y)<150 {
		death = true
		active = false
		image_index = 0
		wake_timer_t = 0
	}
}

if active {
	image_index = 4
	if place_meeting(x,y,player_obj) {
		damage_script(10,1,1,1)
	}	
	if !perm {
		reawake_t++
		if reawake_t>120 {
			active = false
			image_index = 0
			image_speed = 0
			wake_timer_t=0
		}
	}	
}
if wake_timer_t>wake_timer_m {
	image_speed = 1
	
} else if wake_timer_t<1 {
	if place_meeting(x,y,player_obj) {
		wake_timer_t++	
	}
	image_speed = 0
} else {
	wake_timer_t++
	
	image_speed = 1
	if floor(image_index)!=1 {
		image_index=1
	}
}