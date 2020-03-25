/// @description Insert description here
// You can write your code in this editor
if fly_hp<=0 {
	death = true
	
}


if state!=state_hitting && state!=state_knockback {
	if wall_raycast_checker(player_obj) && point_distance(x,y,player_obj.x,player_obj.y)<detect_range
	&& in_camera_range(x,y) {
		state = state_chasing
	} else if !wall_raycast_checker(player_obj) {
		state = state_idle	
	}
}

if state==state_chasing {
	
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
	} else {
		fumbling_timer--
		image_blend = c_red
	}
	//sprite_index = intimidating_walk
	image_speed = 0.75
	hspeed = clamp(hspeed,-h_walk_speed,h_walk_speed)
	
} 

if state==state_idle {
	//sprite_index = intimidating	
}


if state==state_idle || state==state_hitting {
	if(abs(hspeed) < h_decel){
		hspeed=0;	
	} else {
		
		hspeed-=sign(hspeed) * h_decel;	
		
	}
}

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



if death {
	just_blood(tail_obj.hspeed,tail_obj.vspeed,0.1,20,true,sprite_width,sprite_height)
	audio_manager(false,0,false,3)
	//audio_manager(gsound.s_sword_hit_shell,0,false,0)
	instance_destroy()	
	
}


//if(abs(hspeed) < h_decel){
//	hspeed=0;	
//} else {
//	hspeed-=sign(hspeed) * h_decel;	
//}

