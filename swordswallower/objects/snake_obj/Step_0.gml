/// @description Insert description here
// You can write your code in this editor
if death {
	if deathinit {
		if instance_exists(hit) {
			instance_destroy(hit)	
		}
		go = instance_create_depth(head.x,head.y,0,snakeheaddead_obj)
		go.hsp = tail_obj.throwxs*0.4
		go.vsp = tail_obj.throwys*0.4
		go.spinspeed = random_range(20,100) * -sign(go.hsp)
	
		instance_destroy(head)
		deathinit = false
	}
} else {
	if player_obj.tail_carry || player_obj.tail_planted {
		headhit = false
	}
	if state==state_idle {
		head.image_angle = image_angle
		if distance_to_object(player_obj)<1000 {
			if wall_raycast_checker(player_obj) && in_camera_range(x,y) {
				state = state_searching
			}
		}	
	} else if state==state_searching {
		atk_timer++
		
		if !wall_raycast_checker(player_obj) {
			atk_timer=-1
			if audio_is_playing(venus_searching_1) {
				audio_stop_sound(venus_searching_1)	
				audio_stop_sound(venus_searching_2)	
			}
			head.image_angle = lerp(head.image_angle,image_angle,1)
		} else {
			head.image_angle = lerp(head.image_angle,point_direction(x,y,
			player_obj.x+player_obj.hsp,
			player_obj.y+player_obj.vsp)-90,1)	
		}
		if atk_timer>0 && atk_timer<2 {
			
			var pitch = random_range(0.8,1.5)
			var s1 = venus_searching_1
			var s2 = venus_searching_2
			audio_sound_pitch(s1,pitch)
			audio_sound_pitch(s2,pitch)
			
			
			audio_play_sound_at(s1,x,y,0,-1,-1,-1,true,0)
			audio_play_sound_at(s2,x,y,0,-1,-1,-1,true,0)
		}
		
		if atk_timer<atk_timer_max-30 && atk_timer>0 {
			head.x = x + random_range(-6,6)
			head.y = y + random_range(-6,6)
		} else {
			head.x = x
			head.y = y
			if audio_is_playing(venus_searching_1) {
				audio_stop_sound(venus_searching_1)	
				audio_stop_sound(venus_searching_2)	
			}
			
		}
		
		
		if atk_timer>atk_timer_max {
			state=state_attacking
			targetx = player_obj.x
			targety = player_obj.y
			atk_timer = 0
			
			weak_spot = instance_create_depth(x,y,0,snakeheart_obj)
			weak_spot.parent = self
			
			var atks = venus_atk_1
			audio_sound_pitch(atks,random_range(0.8,1.2))
			audio_play_sound_at(atks,x,y,0,-1,-1,-1,false,0)
			
		} 
	} else if state==state_attacking {
		with head {
			sp_towards_target(other.targetx,other.targety,other.atk_speed,1)
		}
		
		weak_spot.x = mean(x,head.x)
		weak_spot.y = mean(y,head.y)
		weak_spot.image_angle = point_direction(x,y,head.x,head.y)
		weak_spot.image_xscale = point_distance(x,y,head.x,head.y) * 0.04
		
		if point_distance(head.x,head.y,targetx,targety) < pythag(head.hsp,head.vsp) {
			head.hsp = 0
			head.vsp = 0
		
			
			//weak_spot.distance = random_range(20,point_distance(x,y,head.x,head.y)-10)s
			
			//weak_spot.x = x + lengthdir_x(weak_spot.distance,ok)
			//weak_spot.y = y + lengthdir_y(weak_spot.distance,ok)
			
	
	
	
			state = state_hitting
		}
	} else if state==state_hitting {
	
		if atk_timer<1 {
			hit = instance_create_depth(head.x,head.y,0,atk_collision_obj)
			hit.xvel = sign(hit.x-player_obj.x)*10
			hit.yvel = -4
			hit.dmg = 10
		}
		atk_timer++
		
		if atk_timer > 100 {
			instance_destroy(hit)
			instance_destroy(weak_spot)
			atk_timer = 0
			state=state_retracting
		}
	
	} else if state==state_retracting {
		with head {
			sp_towards_target(other.x,other.y,other.atk_speed*1.4,1)
		}	
		if point_distance(x,y,head.x,head.y)<pythag(head.hsp*1.2,head.vsp*1.5) {
			state=state_searching
			atk_timer = 0
			head.x = x
			head.y = y
			head.hsp = 0
			head.vsp = 0
		}
	}
}