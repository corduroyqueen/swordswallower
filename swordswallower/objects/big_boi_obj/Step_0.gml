/// @description Insert description here
// You can write your code in this editor

my_floor = instance_place(x,y+1,wall_obj)
player_floor = player_obj.current_platform

if wall_checker(x,y+1) || place_meeting(x,y+1,wood_wall_obj)
|| place_meeting(x,y+3,thin_floor_obj) {
	if abs(last_grounded_y-y)>400 {
		//locked = true
		//startx = x
		//starty = y
	}
	grounded = true
	last_grounded_y = y
} else {
	grounded = false
}
/*
if point_distance(x,y,player_obj.x,player_obj.y)>2000 {
	x = startx
	y = starty
	state=state_idle
	hunting = false
}*/

if last_fly_hp==fly_hp {
	
} else if fly_hp <= last_fly_hp-1 {
	for(i=0;i<last_fly_hp-fly_hp;i++){
		just_blood(random_range(-10,10),random_range(-10,10),0.2,80,true,sprite_width/4,sprite_height)
	}
	audio_manager(false,0,false,3)
} 



if fly_hp<=0 {
	death = true	
}

if player_obj.tail_carry {
	met = false	
}

if player_obj.tail_pulling && met && sword_present {
	
	tail_obj.pull_timer=tail_obj.pull_wall_t
	sword_present = false
	audio_play_sound(Knife_Pull_140,0,false)
}

if state!=state_hitting && state!=state_knockback {
	if (my_floor==player_floor && my_floor!= -4) || 
	(abs(y-player_obj.y)<200 && point_distance(x,y,player_obj.x,player_obj.y)<450 && wall_raycast_checker(player_obj)) 
	|| sword_present {
		hunting = true
	} 
}
if special_guy==1 {
	if phase1 {
		state = state_chasing
	}
	if phase2 {
		hspeed=4
		state=state_idle
		if abs(x-startx)<400 {
			phase2 = false
			phase1 = true
		}
	}
}
if state==state_knockback {
	if player_obj.zoom_timer_bool && sword_present {
		hspeed = 0
		vspeed = 0
	}
	
	if grounded {
		state = state_idle
	}
} else {
	collided_with_friend=true	
}

if place_meeting(x,y,golem_obj) && collided_with_friend==false {
	var friendo = instance_place(x,y,golem_obj)
	if friendo.state!=state_knockback {
		
		friendo.hspeed = hspeed * 1.2
		friendo.vspeed = vspeed * 1 * -sign(vspeed)
		
		hspeed *= 0.4
		vspeed *= 0.4
		
		friendo.state = state_knockback
		friendo.hit_timer = 0
		friendo.hit_success = false
		//sprite_index = golem_idle
		collided_with_friend = true
		friendo.collided_with_friend = true
		if instance_exists(hit) {
			instance_destroy(hit)	
		}
		
		reset_intangibility()
	}
}

if sword_present {
	var lmao
	if facing_right { lmao = 1 } else { lmao = -1 }
	
	
	tail_obj.hspeed = 0
	tail_obj.vspeed = 0
	tail_obj.y = y + sword_hold_y
	tail_obj.x = x + (sword_hold_x * lmao)
	tail_obj.inside_flier = true
	tail_obj.current_obj = self
	//image_xscale = lmao
	
	var facingdir
	
	//particlect++
	
	if particlect==1 {
		particle = instance_create_depth(x + (sword_hold_x*lmao),y+sword_hold_y,-1,blood_obj)
	
		var scalevar = random_range(0.2,2)
		particle.image_xscale = scalevar
		particle.image_yscale = scalevar
		particle.hspeed = random_range(0.01,1) * lmao + hspeed
		particle.vspeed = random_range(0.01,1) * lmao + vspeed
		particlect = false
	} 
	if particlect>120{
		particlect=0	
	}
	
	
	
	
	
}

if point_distance(x,y,player_obj.x+player_obj.hspeed,player_obj.y+player_obj.vspeed)<105
	&& !grabbing && !grabbed{
		
	grabbing = true
	player_obj.move_locked = true
	player_obj.zoom_timer_bool = false
	player_obj.hspeed = 0
	player_obj.vspeed = 0
	grabbed = true
	reset_zoom()
	//player_obj.hspeed*=0.55
	//player_obj.vspeed*=0.55
		
	//hspeed = player_obj.hspeed * 1.5
	//vspeed = player_obj.vspeed * 0.8
		
	//player_obj.hspeed*=-0.25
	//player_obj.vspeed*=-0.35
		
	//state = state_knockback
	//collided_with_friend = false
	//hit_timer = 0
	//hit_success = false
	////sprite_index = golem_idle
	//if instance_exists(hit) {
	//	instance_destroy(hit)	
	//}
		
	//reset_zoom()
	//reset_intangibility()
	//player_obj.tail_planted = false
	//player_obj.tail_pulling = true
	//sword_present = false
}

if point_distance(x,y,player_obj.x+player_obj.hspeed,player_obj.y+player_obj.vspeed)>105 {
	grabbed = false	
}
	
	
if grabbing { 
	
	player_obj.x = x + 35 * -sign(image_xscale)
	player_obj.y = y
	hspeed = lerp(hspeed,0,0.02)
	//state=state_hitting
	hold_timer++
	if hold_timer<1 {
		hit_timer = 0	
	}
	if player_obj.zoom_timer_bool {
		grabbing = false
		hold_timer = 0
		player_obj.move_locked = false
	}
}
if !instance_exists(crabfriend) {
	carryingcrab = false
}
if carryingcrab {
	
	
	crabfriend.hspeed = 0
	crabfriend.vspeed = 0
	var lmao
	if facing_right { lmao = 1 } else { lmao = -1 }
	
	crabfriend.y = y + 0
	crabfriend.x = x + (40 * lmao)
	
}

if ready {
	//h_accel = .2
	//h_walk_speed = 11
}
if state==state_chasing {
	if grabbing {
		return false	
	}
	
	if player_obj.x<x {
		hspeed-=h_accel	
		if hspeed>0 {
			hspeed-=h_accel*2
		}
		image_xscale = 1
		facing_right = false
	} else {
		hspeed+=h_accel	
		if hspeed<0 {
			hspeed+=h_accel*2
		}
		image_xscale = -1
		facing_right = true
	}
	
	if carryingcrab && wall_raycast_checker(player_obj) && grounded {
		
		carryingcrab = false
		crabxv = cos(degtorad(point_direction(x,y,player_obj.x,player_obj.y)))
		crabyv = -sin(degtorad(point_direction(x,y,player_obj.x,player_obj.y-20)))
		crabfriend.hspeed = crabxv * 22
		crabfriend.vspeed = crabyv * 22
		crabfriend.thrown = true
		crabfriend.heldbymonster = false
		crabfriend.grav = 0.1
		crabfriend = false
	}
	
	//if grounded {
	//	if (x-player_obj.x)<50 && sign(x-player_obj.x)==1 {
	//		state = state_hitting
		
	//	} else if (x-player_obj.x)>-50 && sign(x-player_obj.x)==-1 {
	//		state = state_hitting
	//	}
	//}
	//sprite_index = intimidating_walk
	//image_speed = 0.75
	
//	hspeed = lerp(hspeed,clamp(hspeed,-h_walk_speed,h_walk_speed),0.05)
	
} 

if state==state_idle {
	if hunting && grounded {
		state = state_chasing	
	}
	//sprite_index = intimidating	
}


if grounded && !climbing { h_decel = h_decel_g } else { h_decel = h_decel_a vspeed+=grav}

if state==state_idle || state==state_hitting {
	if(abs(hspeed) < h_decel){
		hspeed=0;	
	} else {
		
		hspeed-=sign(hspeed) * h_decel;	
		
	}
}

//if state==state_hitting {
//	if !locked {
//		sprite_index = big_boi_attacking
//	}
//	hit_timer++
	
	
//	if hit_timer>5 {
//		if hit_timer<7 {
//			hit = instance_create_depth(x,y,0,golem_atk_collision_obj)
//			hit.image_xscale = image_xscale	
//		}
//		if !instance_exists(hit) && !hit_success {
//			hit_timer=100
//			hit_success = true
			
//		} 
//		if instance_exists(hit) {
//			hit.x = x
//			hit.y = y
//		}
		
		
//		if hit_timer>30 {
//			//sprite_index = intimidating
//			if instance_exists(hit) {
//				instance_destroy(hit)	
//			}
//			//sprite_index = golem_idle
//		} else {
//			//sprite_index = golem_atk
		
//		}
//		if hit_timer>50 {
//			state = state_idle
//			hit_timer = 0
//			hit_success = false
//		}
//	}
//} else {
//	if !locked {
//		sprite_index = big_boi
//	}
//	if abs(x-player_obj.x)<250 {
//		//state=state_hitting	
//		//hit_timer = 10
//	}	
//}

//if state==state_knockback {
//	knockback_timer--
//	if knockback_timer<=0 {
//		state = state_idle	
//	}
//}

//wall_collision_climbing(wall_obj)
//wall_collision_climbing(black_wall_obj)
if wall_checker(x-10,y) {
	on_wall_left = true	
} else {
	on_wall_left = false	
}



if wall_checker(x+10,y) {
	on_wall_right = true	
} else {
	on_wall_right = false	
}

wall_collision_xaxis(wall_obj)
wall_collision_xaxis(black_wall_obj)


if player_obj.y<y && !climbing {
	if on_wall_left {
		wallheight = 0
		while (wall_checker(x-10,y-wallheight) && wallheight <= maxheight) wallheight += 1;
		if wallheight<=maxheight && wallheight>10 {
			sdm("ok")
			climbing=true
		}
	} else if on_wall_right {
		wallheight = 0
		while (wall_checker(x+10,y-wallheight) && wallheight <= maxheight) wallheight += 1;
		if wallheight<=maxheight && wallheight>10 {
			sdm("ok")
			climbing=true
		}
	}
}

if climbing {
		sdm("climbing start ")
	if wall_checker(x-sign(image_xscale)*10,y-wallheight)  {
		climbing = false	
		return
		sdm("climbing f 1 ")
	}

	
	if !on_wall_left && !on_wall_right {
		yplusb = 0
		y -= yplusb
		wallheight = 0
		climbing = false
		sdm("climbing f 2 ")
		return
	} 
	
	if (on_wall_left && player_obj.x>x) ||
	(on_wall_right && player_obj.x<x) {
		yplusb = 0
		y -= yplusb
		wallheight = 0
		climbing = false
		sdm("climbing f 3 ")
		return
		
	}
	
	y-=9
	vspeed=-9

	hspeed=0
			
	
}
if climbing { sdm(vspeed) }

if climbing { sdm(vspeed) }

if locked {
	hspeed = 0
	x = startx
	sprite_index = big_boi_wounded
	image_speed = 1
	if player_obj.x<x {
		image_xscale = 1
		facing_right = false
	} else {
		image_xscale = -1
		facing_right = true
	}
}


last_fly_hp = fly_hp

if climbing { sdm(vspeed) }

if death {
	if sword_present {
		player_obj.tail_planted = false
		player_obj.tail_pulling = true
	}
	just_blood(tail_obj.hspeed,tail_obj.vspeed,0.2,80,true,sprite_width/4,sprite_height)
	if instance_exists(hit) {
		instance_destroy(hit)	
	}
	instance_destroy()	
}
if sword_present {
	sword_checked = true
} else if hspeed<4 {
	sword_checked = false	
}

hspeed = clamp(hspeed,-h_max_speed,h_max_speed)


if climbing { sdm(vspeed) }