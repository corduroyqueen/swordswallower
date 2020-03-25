/// @description Insert description here
// You can write your code in this editor

if death {
	instance_destroy()
}

if place_meeting(x,y,tail_obj) {
	touched = true	
}

if parent && !death {
	x = parent.x
	y = parent.y
	
	if parent.move_right {
		image_xscale = -1
	} else {
		image_xscale = 1
	}

}

if touched {
		
}

if player_obj.tail_carry {
	touched = false	
}