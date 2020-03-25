
if !zoom_timer_bool && !held_position{
if keyboard_check(key_left) && hspeed>=-max_hs{
	if hspeed >= 0 && grounded==true {
		hspeed-=(h_accel*2)	
	} else {
		hspeed-=h_accel
	}
} else if keyboard_check(key_right) && hspeed<=max_hs {
	if hspeed <= 0 && grounded==true {
		hspeed+=(h_accel*2)	
	} else {
		hspeed+=h_accel
	}
}
if abs(hspeed)>max_hs && grounded {
	hspeed = lerp(hspeed,max_hs * sign(hspeed),0.02)
}}

if grounded && (keyboard_check(key_left) || keyboard_check(key_right)) {
	walk_timer+=1
	if walk_timer>(25-abs(hspeed)) {
		if !tail_carry {
			var hey = choose(footstep4)//footstep144,footstep2,footstep3)
			audio_sound_pitch(hey,random_range(0.25,0.75))
			audio_manager(hey,0,false,0)
		
			hey = footstep5
			audio_sound_pitch(hey,random_range(0.25,0.75))
			audio_manager(hey,0,false,0)	
		} else {
			var hey = choose(footstep4)//footstep144,footstep2,footstep3)
			audio_sound_pitch(hey,random_range(0.25,0.75))
			audio_manager(hey,0,false,0)
		
			hey = footstep5
			audio_sound_pitch(hey,random_range(0.25,0.75))
			audio_manager(hey,0,false,0)	
		}
		
		walk_timer=0	
	}
} else {
	walk_timer=10
}

//if grounded {
//	jump_able = true	
//}

//if keyboard_check_pressed(key_jump) && jump_able {
//	vspeed-=jump_height		
//	jump_buff_timer = 0
//	jump_able = false
//}

//if jump_able && jump_buff_timer>0 {
//	vspeed-=jump_height		
//	jump_buff_timer = 0
//}


wall_collision_xaxis(wall_obj)
wall_collision_xaxis(black_wall_obj)
wall_collision_xaxis(falling_rock_obj)



if !zoom_timer_bool{
	if(!keyboard_check(ord("A")) && !keyboard_check(ord("D"))){
		if(abs(hspeed) < h_decel){
			hspeed=0;	
		} else {
			hspeed-=sign(hspeed) * h_decel;	
		}
	}
}


if held_release_timer>0 {
	held_release_timer--
	grav = 0
	if vspeed<-1 {
		held_release_timer = 0
	}
} else {
	grav = start_grav	
}
if !grounded && !zoom_timer_bool && vspeed<max_vs {
	
	vspeed += (grav + grav_jv)	
}

if tail_obj.moving_platform_bool {
	//if instance_exists(tail_obj.current_wall) {
	player_hitbox_check_obj.x = player_hitbox_check_obj.x + tail_obj.current_wall.hspeed
	player_hitbox_check_obj.y = player_hitbox_check_obj.y + tail_obj.current_wall.vspeed
	tail_dest_x = player_hitbox_check_obj.x
	tail_dest_y = player_hitbox_check_obj.y
	//}
	
}
if held_position {
	if tail_obj.current_wall.object_index==wood_wall_obj {
		damage_script(10,sign(player_obj.x-x),5,-1)	
	}
	if tail_obj.moving_platform_bool {
		held_pos_timer++
			
		if held_pos_timer<3 {
			x = player_hitbox_check_obj.x	
			y = player_hitbox_check_obj.y
			xvheld = x-tail_obj.current_wall.x
			yvheld = y-tail_obj.current_wall.y
			
			
		}
		
		x = tail_obj.current_wall.x + xvheld
		y = tail_obj.current_wall.y + yvheld
		hspeed = held_start_hspeed
		vspeed = held_start_vspeed
		collision_swordpos(moving_platform_obj)
		collision_swordpos(switch_wall_obj)
		collision_swordpos(sinking_platform_obj)
		
		
		
				//default_collision_nospeed(moving_platform_obj)
		
		
		if !(place_meeting(x,y,wall_obj) || place_meeting(x,y,black_wall_obj)) {
			x = x + tail_obj.current_wall.hspeed	
			y = y + tail_obj.current_wall.vspeed		
		}
		
		if place_meeting(x,y,wall_obj) || place_meeting(x,y,black_wall_obj) {
			hspeed = tail_obj.current_wall.hspeed
			vspeed = tail_obj.current_wall.vspeed
			default_collision(wall_obj)
			default_collision(black_wall_obj)
			xvheld = x-tail_obj.current_wall.x
			yvheld = y-tail_obj.current_wall.y
			hspeed = 0
			vspeed = 0
		} 
		hspeed = 0
		vspeed = 0
		
		
		
		
		
	} else {
	
		hspeed = 0
		vspeed = 0
		
		//x = tail_dest_x
		//y = tail_dest_y
	}
	zoom_timer_bool = false
	zoom_timer = 0
	
	
	
	if mouse_check_button_pressed(mb_left) || mouse_check_button_released(mb_right) {
		reset_intangibility()
		held_position = false
		held_release_timer = 10
		if tail_obj.moving_platform_bool && 
		(tail_obj.current_obj.object_index == moving_platform_obj
		|| tail_obj.current_obj.object_index == sinking_platform_obj) {
			//var h = hspeed
			//var v = vspeed
			if tail_obj.current_obj.vertical {
				y += sign(y-tail_obj.current_obj.y)*10	
			} else {
				x += sign(x-tail_obj.current_obj.x)*10		
			}
			//move_towards_point(tail_obj.current_obj.x,tail_obj.current_obj.y,2)
			//default_collision(tail_obj.current_obj)
		}
	}
	
	held_bounce_timer--
	
	if held_bounce_timer<=0 {
		held_bounce_timer = 0	
	} else {
		
		if mouse_check_button_released(mb_right) || bounce_buff_timer>0  {
			
			reset_intangibility()
			
			if !place_meeting(x,y,wall_obj) {
				
				hspeed = held_start_hspeed
				vspeed = held_start_vspeed
			
				held_bounce_timer = 0
				held_position = false
				bounce()	
			} 
			
			
			
		}
	}
	
} else {
	held_pos_timer = 0	
}

if (on_wall_left && keyboard_check(ord("A"))) || (on_wall_right && keyboard_check(ord("D"))){
	if !hold_wall_bool && !held_position  {
		audio_play_sound(rocksfalling,0,true)
		hold_wall_bool = true
	} 
	if grounded {
		if audio_is_playing(rocksfalling) {
		audio_stop_sound(rocksfalling)	
	}
	}
	
	vspeed = lerp(vspeed,clamp(vspeed,-100,2.75),0.3)	
	
} else {
	if audio_is_playing(rocksfalling) {
		audio_stop_sound(rocksfalling)	
	}
	hold_wall_bool = false
}




//if !grounded {
//	if on_wall_left && jump_buff_timer>0 {
//		hspeed+=wall_jump_x
//		vspeed-=wall_jump_y
//		jump_buff_timer = 0
//	}
//	if on_wall_right && jump_buff_timer>0 {
//		hspeed-=wall_jump_x
//		vspeed-=wall_jump_y
//		jump_buff_timer = 0
//	}
//}

//if jump_buff_timer>0 {
//	jump_buff_timer--	
//}


//hspeed = clamp(hspeed,-max_hs,max_hs)
//vspeed = clamp(vspeed,-max_vs,max_vs)

