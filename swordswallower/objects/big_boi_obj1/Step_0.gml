/// @description Insert description here
// You can write your code in this editor

my_floor = instance_place(x,y+1,wall_obj)
player_floor = player_obj.current_platform

if wall_checker(x,y+1) {
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
if point_distance(x,y,player_obj.x,player_obj.y)>2000 {
	x = startx
	y = starty
	state=state_idle
	hunting = false
}

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
	(abs(y-player_obj.y)<200 && point_distance(x,y,player_obj.x,player_obj.y)<450 && wall_raycast_checker(player_obj)) {
		hunting = true
	} 
}
if special_guy==1 {
	if phase1 {
		state = state_chasing
	}
	if phase2 {
		hsp=4
		state=state_idle
		if abs(x-startx)<400 {
			phase2 = false
			phase1 = true
		}
	}
}
if state==state_knockback {
	if player_obj.zoom_timer_bool && sword_present {
		hsp = 0
		vsp = 0
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
		
		friendo.hsp = hsp * 1.2
		friendo.vsp = vsp * 1 * -sign(vsp)
		
		hsp *= 0.4
		vsp *= 0.4
		
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
	
	
	tail_obj.hsp = 0
	tail_obj.vsp = 0
	tail_obj.y = y + sword_hold_y
	tail_obj.x = x + (sword_hold_x * lmao)
	tail_obj.inside_flier = true
	tail_obj.current_obj = self
	//image_xscale = lmao
	
	var facingdir
	
	particlect++
	
	if particlect==1 {
		particle = instance_create_depth(x + (sword_hold_x*lmao),y+sword_hold_y,-1,blood_obj)
	
		var scalevar = random_range(0.2,2)
		particle.image_xscale = scalevar
		particle.image_yscale = scalevar
		particle.hsp = random_range(0.01,1) * lmao + hsp
		particle.vsp = random_range(0.01,1) * lmao + vsp
		particlect = false
	} 
	if particlect>120{
		particlect=0	
	}
	
	
	
	
	
}

if point_distance(x,y,player_obj.x+player_obj.hsp,player_obj.y+player_obj.vsp)<70 
	&& !grabbing && !grabbed{
		
	grabbing = true
	player_obj.move_locked = true
	player_obj.zoom_timer_bool = false
	player_obj.hsp = 0
	player_obj.vsp = 0
	grabbed = true
	reset_zoom()
	//player_obj.hsp*=0.55
	//player_obj.vsp*=0.55
		
	//hsp = player_obj.hsp * 1.5
	//vsp = player_obj.vsp * 0.8
		
	//player_obj.hsp*=-0.25
	//player_obj.vsp*=-0.35
		
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

if point_distance(x,y,player_obj.x+player_obj.hsp,player_obj.y+player_obj.vsp)>70 {
	grabbed = false	
}
	
	
if grabbing { 
	
	player_obj.x = x + 35 * -sign(image_xscale)
	player_obj.y = y
	hsp = lerp(hsp,0,0.1)
	state=state_hitting
	hold_timer++
	if hold_timer<45 {
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
	
	
	crabfriend.hsp = 0
	crabfriend.vsp = 0
	var lmao
	if facing_right { lmao = 1 } else { lmao = -1 }
	
	crabfriend.y = y + 0
	crabfriend.x = x + (40 * lmao)
	
}
if sword_present {
	h_accel = .25
	h_walk_speed = 10
	image_blend = c_red
} else {
	h_accel = .1
	h_walk_speed = 8.3
	image_blend = c_white
}
if ready {
	h_accel = .2
	h_walk_speed = 11
}
if state==state_chasing {
	if grabbing {
		return false	
	}
	
	if player_obj.x<x {
		hsp-=h_accel	
		image_xscale = 1
		facing_right = false
	} else {
		hsp+=h_accel	
		image_xscale = -1
		facing_right = true
	}
	
	if carryingcrab {
		
		carryingcrab = false
		crabxv = cos(degtorad(point_direction(x,y,player_obj.x,player_obj.y)))
		crabyv = -sin(degtorad(point_direction(x,y,player_obj.x,player_obj.y)))
		crabfriend.hsp = crabxv * 17
		crabfriend.vsp = crabyv * 17
		crabfriend.heldbymonster = false
		crabfriend = false
	}
	
	if grounded {
		if (x-player_obj.x)<50 && sign(x-player_obj.x)==1 {
			state = state_hitting
		
		} else if (x-player_obj.x)>-50 && sign(x-player_obj.x)==-1 {
			state = state_hitting
		}
	}
	//sprite_index = intimidating_walk
	//image_speed = 0.75
	
	hsp = lerp(hsp,clamp(hsp,-h_walk_speed,h_walk_speed),0.05)
	
} 

if state==state_idle {
	if hunting && grounded {
		state = state_chasing	
	}
	//sprite_index = intimidating	
}


if grounded { h_decel = h_decel_g } else { h_decel = h_decel_a vsp+=grav}

if state==state_idle || state==state_hitting {
	if(abs(hsp) < h_decel){
		hsp=0;	
	} else {
		
		hsp-=sign(hsp) * h_decel;	
		
	}
}

if state==state_hitting {
	if !locked {
		
	}
	hit_timer++
	
	
	if hit_timer>5 {
		if hit_timer<7 {
			hit = instance_create_depth(x,y,0,golem_atk_collision_obj)
			hit.image_xscale = image_xscale	
		}
		if !instance_exists(hit) && !hit_success {
			hit_timer=100
			hit_success = true
			
		} 
		if instance_exists(hit) {
			hit.x = x
			hit.y = y
		}
		
		
		if hit_timer>50 {
			//sprite_index = intimidating
			if instance_exists(hit) {
				instance_destroy(hit)	
			}
			//sprite_index = golem_idle
		} else {
			//sprite_index = golem_atk
		
		}
		if hit_timer>70 {
			state = state_idle
			hit_timer = 0
			hit_success = false
		}
	}
} else {
	if !locked {
		
	}
	if abs(x-player_obj.x)<250 {
		//state=state_hitting	
		//hit_timer = 10
	}	
}

//if state==state_knockback {
//	knockback_timer--
//	if knockback_timer<=0 {
//		state = state_idle	
//	}
//}

wall_collision_climbing(wall_obj)
wall_collision_climbing(black_wall_obj)

wall_collision_xaxis(wall_obj)
wall_collision_xaxis(black_wall_obj)



if locked {
	hsp = 0
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
if !place_meeting(x,y+10,touch_die_block_obj) {
	instance_destroy()	
}


last_fly_hp = fly_hp



if death {
	if sword_present {
		player_obj.tail_planted = false
		player_obj.tail_pulling = true
	}
	just_blood(tail_obj.hsp,tail_obj.vsp,0.2,80,true,sprite_width/4,sprite_height)
	instance_destroy()	
}
if sword_present {
	sword_checked = true
} else if hsp<4 {
	sword_checked = false	
}

hsp = clamp(hsp,-h_max_speed,h_max_speed)
hsp = 0
vsp = 0


