/// @description Insert description here
// You can write your code in this editor


if vspeed>7 && other.y>y {
	instance_destroy(other)	
	vspeed*=0.2
}
if grabbing {
	damage_script(10,sign(player_obj.x-x),0,0)	
}
if special_guy == 1 {
	if phase1 {
		if sword_checked {
			instance_destroy(other)
			hspeed = sign(hspeed) * 3
			special_guy = 0
			state=state_chasing
		} else {
			default_collision(other)
			phase1 = false
			phase2 = true
		}
		
	}
		
} else if abs(hspeed)>6 {
	instance_destroy(other)
	hspeed = sign(hspeed) * 3
	
} else {
	default_collision(other)
}
	
ready = false


