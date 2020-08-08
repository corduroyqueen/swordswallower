/// @description Insert description here
// You can write your code in this editor
if inv_timer>0 {
	inv_timer--
} else {
	image_blend = c_white	
}

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
	yanked = true
	hspeed = tail_obj.hspeed * 5
	vspeed = tail_obj.vspeed * 5
	audio_play_sound(Knife_Pull_140,0,false)
}

if yanked {
	hspeed = lerp(hspeed,0,0.05)
	vspeed = lerp(vspeed,0,0.05)
	
	if speed<1 {
		yanked = false
	}
}

if state!=state_hitting && state!=state_knockback {
	if distance_to_object(player_obj)<1000 {
		if !collision_line(x,y,player_obj.x,player_obj.y,wall_obj,false,true) 
		&& !collision_line(x,y,player_obj.x,player_obj.y,break_wall_obj,false,true){
			hunting = true
		}
	}
}

if state==state_knockback {
	if player_obj.zoom_timer_bool && sword_present {
		hspeed = 0
		vspeed = 0
	}
	
	hspeed = lerp(hspeed,0,0.07)
	vspeed = lerp(vspeed,0,0.07)
	
	if speed<1 {
		state = state_idle
	}
} else {
	collided_with_friend=true	
}

if place_meeting(x,y,diamond_obj) && collided_with_friend==false {
	var friendo = instance_place(x,y,diamond_obj)
	if friendo.state!=state_knockback {
		
		friendo.hspeed = hspeed * 1.2
		friendo.vspeed = vspeed * 1 * -sign(vspeed)
		
		hspeed *= 0.4
		vspeed *= 0.4
		
		friendo.state = state_knockback
		friendo.hit_timer = 0
		friendo.hit_success = false
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
	
	
	tail_obj.hspeed = 0
	tail_obj.vspeed = 0
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
		particle.hspeed = random_range(0.01,1) * lmao + hspeed
		particle.vspeed = random_range(0.01,1) * lmao + vspeed
		particlect = false
	} 
	if particlect>120{
		particlect=0	
	}
	
	if point_distance(x,y,player_obj.x,player_obj.y)<20 && (player_obj.bounce_buff_timer>0 || player_obj.zoom_timer_bool) {
		
		player_obj.hsp*=0.55
		player_obj.vsp*=0.55
		
		hspeed = player_obj.hsp * 1.5
		vspeed = player_obj.vsp * 1.5
		
		player_obj.hsp*=-0.25
		player_obj.vsp*=-0.35
		
		audio_sound_pitch(hit_wall,1.3)
		audio_play_sound(hit_wall,0,false)	
		audio_play_sound(metal_clank,0,false)
		
		inv_timer = 0
		state = state_knockback
		collided_with_friend = false
		hit_timer = 0
		hit_success = false
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
	if distance_to_object(player_obj)>250 {
		if !yanked {
			
			move_towards_point(player_obj.x,player_obj.y-32,h_walk_speed)
		}
	} else {
		
		hit = instance_create_depth(x,y,0,diamond_atk_obj)
		
		
		state = state_hitting
		
		aiming_sound = audio_play_sound(rising_sine,0,false)
		audio_sound_set_track_position(aiming_sound,random_range(0,5))
	}
	
	
	//sprite_index = intimidating_walk
	image_speed = 0.75
	//hspeed = clamp(hspeed,-h_walk_speed,h_walk_speed)
	
} 

if state==state_idle {
	if instance_exists(hit) {
			instance_destroy(hit)	
		}
	if hunting {
		state = state_chasing	
	}
	//sprite_index = intimidating	
}


if grounded { h_decel = h_decel_g } else { h_decel = h_decel_a }

if state==state_idle || state==state_hitting {
	//if(abs(hspeed) < h_decel){
	//	hspeed=0;	
	//} else {
		
	//	hspeed-=sign(hspeed) * h_decel;	
		
	//}
}

if state==state_hitting {
	//hspeed = lerp(hspeed,0,0.2)
	//vspeed = lerp(vspeed,0,0.2)
	if !yanked {
		move_towards_point(player_obj.x,player_obj.y-32,h_walk_speed/5)
	}
	hit_timer++
	if instance_exists(hit) {
		hit.x = x
		hit.y = y
	}
	
	if hit_timer>85 {
		if hit_timer<=120 {
			hit.image_blend = c_purple	
		}
		if hit_timer>120 && hit_timer<122 {
			audio_play_sound(Laser_Cannon,0,false)	
		}
		if hit_timer>120 && hit_timer<128 {
			if audio_is_playing(aiming_sound) {
				audio_stop_sound(aiming_sound)	
			}
			hit.sprite_index = check_wall_hitbox
			hit.image_blend = c_white
		} else if hit_timer>130 {
			if instance_exists(hit) {
				instance_destroy(hit)	
			}
		}
		
		if hit_timer>160 {
			state = state_idle
			hit_timer = 0
			hit_success = false
		}
	} else {
		hit.sprite_index = red_pointer
		pointingx = player_obj.x
		pointingy = player_obj.y
		hit.image_angle = point_direction(x,y,pointingx,pointingy)
	}
} else {
	if abs(x-player_obj.x)<250 {
		//state=state_hitting	
		//hit_timer = 10
	}
	if audio_is_playing(aiming_sound) {
		audio_stop_sound(aiming_sound)	
	}
} 

//if state==state_knockback {
//	knockback_timer--
//	if knockback_timer<=0 {
//		state = state_idle	
//	}
//}

if instance_exists(hit) {
	hit.x = x
		hit.y = y
}
if death {
	if sword_present {
		player_obj.tail_planted = false
		player_obj.tail_pulling = true
	}
	if instance_exists(hit) {
			instance_destroy(hit)	
		}
	just_blood(tail_obj.hspeed,tail_obj.vspeed,0.2,80,true,sprite_width/4,sprite_height)
	instance_destroy()	
}

//hspeed = clamp(hspeed,-h_max_speed,h_max_speed)

//sdm(my_floor)