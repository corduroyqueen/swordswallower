/// @description Insert description here
// You can write your code in this editor


if vsp>7 && other.y>y {
	//instance_destroy(other)	
	//vsp*=1
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
		
} else if sword_checked && abs(hsp)>7 {
	instance_destroy(other)
	hsp = sign(hsp) * 3
	
} else {
	default_collision(other)
}
	
ready = false


