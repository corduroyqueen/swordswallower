/// @description Insert description here
// You can write your code in this editor
if !parent {
	alpha = lerp(alpha,0,0.5)	
	if alpha<=0.2 {
		instance_destroy()	
	}
}

if place_meeting(x,y,tail_obj) {
	alpha = lerp(alpha,1,0.1)	
	if player_obj.tail_planted {
		tempx = tail_obj.x
		tempy = tail_obj.y
	}
	if mouse_check_button_pressed(mb_right) {
		parent = false	
	}
} else {
	alpha = lerp(alpha,0,0.4)
}