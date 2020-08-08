/// @description Insert description here
// You can write your code in this editor

if wall_checker(x,y+1) {
	grounded = true	
} else {
	grounded = false	
}


if wall_checker(x+2,y) {
	move_right = false
}

if wall_checker(x-2,y) {
	move_right = true
}

if move_right {
	h_direc=1	
} else {
	h_direc=-1	
}

if state==state_idle {
	hsp=0
	state_timer--
	if state_timer<=0 {
		if abs(player_obj.x-x)<60 
		&& abs(player_obj.x-x)>20 {
			state=state_jumping
		} else {
			if random_range(0,100)>50 {
				state=state_running	
			} else {
				vsp=-15
				state=state_jumping	
			}
		}
		state_timer=random_range(50,100)
	}
} else if state==state_running {
	hsp=h_vel*h_direc
	state_timer--
	if state_timer<=0 {
		state=state_idle
		state_timer=random_range(20,40)	
	}
} else {
	hsp=h_vel*h_direc*0.6666
	if grounded {
		state=state_idle	
		state_timer=random_range(20,40)	
	}
}

if !grounded {
	vsp+=0.5
}