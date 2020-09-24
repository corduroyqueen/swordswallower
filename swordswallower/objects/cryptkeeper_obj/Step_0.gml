/// @description Insert description here
// You can write your code in this editor

my_floor = instance_place(x,y+1,wall_obj)
player_floor = player_obj.current_platform

if wall_detect(x,y+1) {
	grounded = true
} else {
	grounded = false
	
}

if player_obj.tail_carry {
	met = false	
}

if state!=state_hitting && state!=state_knockback {
	if wall_raycast_checker(player_obj) && 
	point_distance(x,y,player_obj.x,player_obj.y)<detect_range
	&& in_camera_range(x,y) 
	&& collision_line(x,y,obj.x,obj.y,thin_floor_obj,false,true)==noone {
		state = state_chasing
	} else if !wall_raycast_checker(player_obj) {
		state = state_idle	
	}
}

if state==state_chasing {
	sound_timer++
	if sound_timer>sound_timer_t {
		sound_timer=0
		sound_timer_t = 150 + random_range(-10,50)
		
		idle_sound = choose(zomb_idle1,zomb_idle2,zomb_idle3)
		audio_sound_pitch(idle_sound,random_range(0.8,1.2))
		audio_play_sound(idle_sound,0,false)
	}
	if player_obj.x<x {
		image_xscale = 1
		facing_right = false
	} else {
		image_xscale = -1
		facing_right = true
	}
	if fumbling_timer<=0{
		image_blend = c_white
		if player_obj.x<x {
			hsp-=h_accel	
			image_xscale = 1
			facing_right = false
		} else {
			hsp+=h_accel	
			image_xscale = -1
			facing_right = true
		}
		if (x-player_obj.x)<30 && sign(x-player_obj.x)==1 {
			state = state_hitting
		} else if (x-player_obj.x)>-30 && sign(x-player_obj.x)==-1 {
			state = state_hitting
		}
	} else {
		fumbling_timer--
		//image_blend = c_red
	}
	//sprite_index = intimidating_walk
	image_speed = 0.75
	if image_index>2 || image_index<1 {
		image_index = clamp(2,image_index,6)
	}
	if grounded {
		
		hsp = clamp(hsp,-h_walk_speed,h_walk_speed)
	} else {
		hsp = lerp(hsp,0,0.2)	
	}
} 

if state==state_idle {
	image_speed = 0
	//image_index = clamp(-1,image_index,2)
	//sprite_index = intimidating	
}


if grounded { h_decel = h_decel_g } else { h_decel = h_decel_a hsp=0 vsp+=grav}

if state==state_idle || state==state_hitting {
	if(abs(hsp) < h_decel){
		hsp=0;	
	} else {
		
		hsp-=sign(hsp) * h_decel;	
		
	}
}

//wall_collision_xaxis(wall_obj)

if state==state_hitting {
	hit_timer++
	
	
	if hit_timer>5 {
		if hit_timer<7 {
			/*
			hit = instance_create_depth(x,y,0,default_atk_collision_obj)
			hit.dmg = 0
			hit.xvel = 2
			hit.yvel = -3
			hit.image_xscale = image_xscale	
			*/
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

if place_meeting(x,y,tar_obj) {
	vsp=0.5
	hsp = lerp(hsp,0,0.2)
	tartimer++
	if tartimer>200 {
		death = true	
	}
} else {
	tartimer=0	
}


if death {
	if player_obj.zoom_timer_bool {
		just_blood(player_obj.hsp*2,player_obj.vsp*2,0.2,80,true,sprite_width/4,sprite_height)
	} else {
		just_blood(tail_obj.hsp,tail_obj.vsp,0.2,80,true,sprite_width/4,sprite_height)
	}
	var bruh = lettuce_chop_louder
	audio_sound_pitch(bruh,random_range(0.75,1.25))
	audio_play_sound(bruh,0,false)
	
	go = instance_create_depth(x,y-30,0,snakeheaddead_obj)
	go.sprite_index = ghoul_masks[ghoul_num]
	go.hsp = tail_obj.hsp*0.4
	go.vsp = tail_obj.vsp*0.4
	go.spinspeed = random_range(20,100) * -sign(go.hsp)
		
	instance_destroy()	
	
	
	
}

hsp = clamp(hsp,-h_max_speed,h_max_speed)

moveX(hsp)
moveY(vsp)

//sdm(my_floor)