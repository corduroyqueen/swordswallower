/// @description Insert description here
// You can write your code in this editor
if player_obj.x<=x {
	facing_right = false
} else {
	facing_right = true
}
if facing_right {
	xs = 1
} else {
	xs = -1
}

if death {
	just_blood(0,-2,0.2,10,false,sprite_width,sprite_height)	
	just_blood(0,-5,0.2,10,false,sprite_width,sprite_height)
	audio_manager(false,0,false,3)
	instance_destroy(id)
	return false	
}

if wall_detect(x,y+1) {
	grounded = true	
} else {
	grounded = false	
}

if grounded {
	vsp=0
} else {
	vsp+=grav	
}

if state==state_idle {
	if distance_to_object(player_obj)<1250 && in_camera_range(x,y) {
		if wall_raycast_checker(player_obj) {
			state = state_tossing
		}
	}
} else if state==state_tossing {
	
	if walking_right {
		hsp=walk_speed
		if x>=player_obj.x+800 {
			walking_right = false	
		}
	} else {
		hsp=-walk_speed
		if x<=player_obj.x+250 {
			walking_right = true	
		}
	}
	
	toss_timer_t++
	if toss_timer_t>toss_timer_m {
		toss_timer_t = 0
		axe = instance_create_depth(x,y,depth+1,axe_obj)
		axe.hsp = (6 * xs) + hsp/2
		axe.vsp = -20
		axe.grav = .3
	}
	
	if player_obj.y<y-400 {
		defense_timer_t++
		if defense_timer_t>defense_timer_m {
			state = state_defense
			defense_timer_t=0
			toss_timer_t = 0
		}
	}
	
	if point_distance(x,y,player_obj.x,player_obj.y)<200 {
		state = state_melee
		toss_timer_t = 0
	}
	
} else if state==state_melee {
	toss_timer_t++
	if toss_timer_t>20 {
		at=instance_create_depth(x+100*xs,y,depth+1,default_atk_obj)	
		at.timer = 5
		at.image_xscale = 100/32
		at.image_yscale = 100/32
		toss_timer_t = 0
		state = state_tossing
	}
} else if state==state_defense {
	hsp = lerp(hsp,0,0.05)
	if player_obj.y>y-100 && abs(player_obj.x-x)>70 {
		state = state_tossing	
	}
	toss_timer_t++
	if toss_timer_t>100 {
		toss_timer_t = 60
		state = state_harpoon
	}
	
} else if state==state_harpoon {
	
	ang = point_direction(x,y,player_obj.x,player_obj.y)
	
	axe = instance_create_depth(x,y,depth+1,axe_obj)
	axe.hsp = cos(degtorad(ang)) * 30
	axe.vsp = -sin(degtorad(ang)) * 30
	axe.grav = .1
	
	state = state_defense
}



if met && player_obj.tail_carry {
	met = false	
}

if sword_present {
	player_obj.tail_dest_x = x
	player_obj.tail_dest_y = y
	tail_obj.x = x + swordx
	tail_obj.y = y + swordy
	
	if player_obj.tail_pulling || player_obj.tail_carry {
		sword_present = false
	}
}