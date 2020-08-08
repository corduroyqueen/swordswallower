/// @description Insert description here
// You can write your code in this editor

my_floor = instance_place(x,y+1,wall_obj)
player_floor = player_obj.current_platform

if place_meeting(x,y+1,wall_obj) {
	grounded = true
} else {
	grounded = false
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
	if my_floor==player_floor && my_floor!= -4 {
		hunting = true
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
	if facing_right { lmao = -1 } else { lmao = 1 }
	
	
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
	
	if point_distance(x,y,player_obj.x,player_obj.y)<20 && player_obj.zoom_timer_bool {
		
		player_obj.hsp*=0.55
		player_obj.vsp*=0.55
		
		hsp = player_obj.hsp * 1.5
		vsp = player_obj.vsp * 0.8
		
		player_obj.hsp*=-0.25
		player_obj.vsp*=-0.35
		
		state = state_knockback
		collided_with_friend = false
		hit_timer = 0
		hit_success = false
		//sprite_index = golem_idle
		if instance_exists(hit) {
			instance_destroy(hit)	
		}
		
		reset_zoom()
		reset_intangibility()
		player_obj.tail_planted = false
		player_obj.tail_pulling = true
		sword_present = false
	}
	
	
	
}

if state==state_chasing {
	
	if player_obj.x<x {
		hsp-=h_accel	
		image_xscale = 1
		facing_right = false
	} else {
		hsp+=h_accel	
		image_xscale = -1
		facing_right = true
	}
	
	if grounded {
		if (x-player_obj.x)<50 && sign(x-player_obj.x)==1 {
			state = state_hitting
		
		} else if (x-player_obj.x)>-50 && sign(x-player_obj.x)==-1 {
			state = state_hitting
		}
	}
	//sprite_index = intimidating_walk
	image_speed = 0.75
	hsp = clamp(hsp,-h_walk_speed,h_walk_speed)
	
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
		
		
		
		if hit_timer>80 {
			//sprite_index = intimidating
			if instance_exists(hit) {
				instance_destroy(hit)	
			}
			//sprite_index = golem_idle
		} else {
			//sprite_index = golem_atk
		
		}
		if hit_timer>95 {
			state = state_idle
			hit_timer = 0
			hit_success = false
		}
	}
} else {
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



if death {
	if sword_present {
		player_obj.tail_planted = false
		player_obj.tail_pulling = true
	}
	just_blood(tail_obj.hsp,tail_obj.vsp,0.2,80,true,sprite_width/4,sprite_height)
	instance_destroy()	
}

hsp = clamp(hsp,-h_max_speed,h_max_speed)

//sdm(my_floor)