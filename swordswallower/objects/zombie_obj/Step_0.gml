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

if state!=state_hitting && state!=state_knockback {
	if my_floor==player_floor && my_floor!= -4 {
		state = state_chasing
	} else {
		state = state_idle	
	}
}



if sword_present {
	var lmao
	if facing_right { lmao = -1 } else { lmao = 1 }
	
	
	tail_obj.hspeed = 0
	tail_obj.vspeed = 0
	tail_obj.y = y + sword_hold_y
	tail_obj.x = x + (sword_hold_x * lmao)
	tail_obj.inside_flier = true
	tail_obj.current_obj = self
	//image_xscale = lmao
	
	var facingdir
	
	if player_obj.tail_pulling && met {
	
		tail_obj.pull_timer=tail_obj.pull_wall_t
		sword_lock = false
		death = true
		audio_play_sound(Knife_Pull_140,0,false)
	}
	
	particlect++
	
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
	
	if point_distance(x,y,player_obj.x,player_obj.y)<20 && player_obj.zoom_timer_bool {
		
		player_obj.hspeed*=0.55
		player_obj.vspeed*=0.55
		
		hspeed = player_obj.hspeed * 1.5
		vspeed = player_obj.vspeed * 0.75
		
		player_obj.hspeed*=-0.25
		player_obj.vspeed*=-0.35
		
		reset_zoom()
		reset_intangibility()
		
		
		
		
		
	}
	
}

if state==state_chasing {
	
	if player_obj.x<x {
		hspeed-=h_accel	
		image_xscale = 1
		facing_right = false
	} else {
		hspeed+=h_accel	
		image_xscale = -1
		facing_right = true
	}
	if (x-player_obj.x)<30 && sign(x-player_obj.x)==1 {
		state = state_hitting
	} else if (x-player_obj.x)>-30 && sign(x-player_obj.x)==-1 {
		state = state_hitting
	}
	//sprite_index = intimidating_walk
	image_speed = 0.75
	hspeed = clamp(hspeed,-h_walk_speed,h_walk_speed)
	
} 

if state==state_idle {
	//sprite_index = intimidating	
}


if grounded { h_decel = h_decel_g } else { h_decel = h_decel_a vspeed+=grav}

if state==state_idle || state==state_hitting {
	if(abs(hspeed) < h_decel){
		hspeed=0;	
	} else {
		
		hspeed-=sign(hspeed) * h_decel;	
		
	}
}

if state==state_hitting {
	hit_timer--
	if hit_timer<-100 {
		//sprite_index = intimidating
		
		
		
	}
	if hit_timer<-120 {
		state = state_idle
		hit_timer = 0
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
	just_blood(tail_obj.hspeed,tail_obj.vspeed,0.2,80,true,sprite_width/4,sprite_height)
	instance_destroy()	
}

hspeed = clamp(hspeed,-h_max_speed,h_max_speed)

//sdm(my_floor)