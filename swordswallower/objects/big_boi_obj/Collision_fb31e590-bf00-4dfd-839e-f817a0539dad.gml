/// @description Insert description here
// You can write your code in this editor


if vsp>7 && other.y>y {
	instance_destroy(other)	
	vsp*=0.5
} else {
	instance_destroy(other)	
	//state=state_hitting
}
if grabbing {
	damage_script(10,sign(player_obj.x-x),0,0)	
}
if special_guy == 1 {
	if phase1 {
		if sword_checked {
			instance_destroy(other)
			hsp = sign(hsp) * 3
			special_guy = 0
			state=state_chasing
		} else {
			default_collision(other)
			phase1 = false
			phase2 = true
		}
		
	}
		
} else if abs(hsp)>6 {
	instance_destroy(other)
	hsp = sign(hsp) * 7
	
} else {
	default_collision(other)
}
	
ready = false


