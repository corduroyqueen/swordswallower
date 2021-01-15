if object_index==level1_master { return }
if grounded && !zoom_timer_bool { 
	h_decel = h_decel_g 
} else { 
	h_decel = h_decel_a 
}


if !zoom_timer_bool && !held_position{
	if grounded {
		if k_left && hsp>=-max_hs_g {
			if hsp >= 0 {
				hsp-=h_accel_g*2
			} else {
				hsp-=h_accel_g
			}
		} else if k_right && hsp<=max_hs_g {
			if hsp <= 0  {
				hsp+=h_accel_g*2	
			} else {
				hsp+=h_accel_g
			}
		}
	
	
		if abs(hsp)>max_hs_g {
			hsp = lerp(hsp,max_hs_g * sign(hsp),0.02)
		}
		
		h_dir_bool = true
	} else {
		if k_left && hsp>=-max_hs_a {
			if hsp >= 0 || !h_dir_bool 
			{
				hsp-=(h_accel_a/2)*(out_of_dash_t/out_of_dash_m)
			} else {
				hsp-=h_accel_a*(out_of_dash_t/out_of_dash_m)
				h_dir_bool = false
			}
		} else if k_right && hsp<=max_hs_a {
			if hsp <= 0 || !h_dir_bool
			{
				hsp+=(h_accel_a/2)*(out_of_dash_t/out_of_dash_m)
			} else {
				hsp+=h_accel_a*(out_of_dash_t/out_of_dash_m)
				h_dir_bool = false
			}
		}
	
	
		if abs(hsp)>max_hs_a  {
			hsp = lerp(hsp,max_hs_a * sign(hsp),0.02)
		}	
	}
}

//sdm(player_sprite_obj.image_index)
if grounded && (k_left || k_right) {
	//walk_timer+=1
	//if walk_timer>(25-abs(hsp)) {
	if //abs(player_sprite_obj.image_index-4)<0.1 ||
	floor(player_sprite_obj.image_index)==0 && footstep_audio_bool
	{
		
		
		var floor_obj = instance_place(x,y+2,wall_master_parent_obj)
		if instance_exists(floor_obj) {
			if floor_obj.material_type==floor_obj.material_stone {
				hey = footstep5
				audio_sound_pitch(hey,random_range(0.75,1.25))
				audio_manager(hey,0,false,0)
				var hey = choose(footstep6)//footstep144,footstep2,footstep3)
				audio_sound_pitch(hey,random_range(0.75,1.25))
				audio_manager(hey,0,false,0)
			} else if floor_obj.material_type==floor_obj.material_wood {
				var hey = choose(s_footstep_wood_01,s_footstep_wood_02,s_footstep_wood_03)
				audio_sound_gain(hey,0.75,0)
				audio_sound_pitch(hey,random_range(0.9,1.1))
				audio_manager(hey,0,false,0)
			} else if floor_obj.material_type==floor_obj.material_meat {
				var hey = choose(s_squelch_01,s_squelch_03,s_squelch_05,s_squelch_06,s_squelch_07,s_squelch_08)//footstep144,footstep2,footstep3)
				audio_sound_gain(hey,0.05,0)
				audio_sound_pitch(hey,random_range(0.91,1.25))
				audio_manager(hey,0,false,0)
			}
		}
		//if 
		//if !tail_carry {
		//	var hey = choose(footstep6)//footstep144,footstep2,footstep3)
		//	audio_sound_pitch(hey,random_range(0.75,1.25))
		//	audio_manager(hey,0,false,0)
		//} else {
		//	var hey = choose(footstep6)//footstep144,footstep2,footstep3)
		//	audio_sound_pitch(hey,random_range(0.75,1.25))
		//	audio_manager(hey,0,false,0)
		
				
		//}
		//all except 2 4 and 5
		var dust = instance_create_depth(player_obj.x+sign(player_obj.hsp)*15,player_obj.y+45,depth+100,player_footstep_dust_obj)
		dust.image_xscale = dust.image_xscale * sign(player_obj.hsp)
		//dust.image_alpha = 0.4
		footstep_audio_bool = false
	} else if floor(player_sprite_obj.image_index)!=0 {
		footstep_audio_bool = true	
	}
		
		walk_timer=0	
	//}
} else {
	walk_timer=10
}

//if grounded {
//	jump_able = true	
//}

//if keyboard_check_pressed(key_jump) && jump_able {
//	vsp-=jump_height		
//	jump_buff_timer = 0
//	jump_able = false
//}

//if jump_able && jump_buff_timer>0 {
//	vsp-=jump_height		
//	jump_buff_timer = 0
//}


//wall_collision_yaxis_up(wall_obj)
//wall_collision_yaxis_up(black_wall_obj)

if !zoom_timer_bool {
	if(!k_left && !k_right){
		if(abs(hsp) < h_decel){
			hsp=0;	
		} else {
			hsp-=sign(hsp) * h_decel;	
		}
	}
}


if held_release_timer>0 {
	held_release_timer--
	grav = 0
	vsp = lerp(vsp,0,0.05)
	//if vsp<-1 {
	//	held_release_timer = 0
	//}
} else {
	grav = start_grav	
}
if !grounded && !zoom_timer_bool && out_of_dash_t>=0 && vsp<max_vs {
	if !wall_checker(x,y) && place_meeting(x,y,tar_obj) {
		vsp = 0.75
	} else {
		vsp += grav
	}
}

if tail_obj.moving_platform_bool {
	//if instance_exists(tail_obj.current_obj) {
	player_hitbox_check_obj.x = player_hitbox_check_obj.x + tail_obj.current_obj.hsp
	player_hitbox_check_obj.y = player_hitbox_check_obj.y + tail_obj.current_obj.vsp
	tail_dest_x = player_hitbox_check_obj.x
	tail_dest_y = player_hitbox_check_obj.y
	//}
	
}
if ability_spin_jump {
	if grounded || held_position {
		ability_spin_jump_e = true
	}
	if !grounded && ability_spin_jump_e && !held_position {
		
		if keyboard_check_pressed(vk_space) {
			ability_spin_jump_e = false
			out_of_dash_t=out_of_dash_m
			if vsp>0 {
				vsp*=0.5
				vsp-=25
				hsp*=0.60
			} else {
				vsp-=10
				hsp*=0.60
			}
		}
	}
}
if held_position {
	if tail_obj.current_obj.object_index==wood_wall_obj {
		//damage_script(10,sign(player_obj.x-x),5,-1)	
	}
	if tail_obj.moving_platform_bool {
		held_pos_timer++
			
		if held_pos_timer<3 {
			x = player_hitbox_check_obj.x	
			y = player_hitbox_check_obj.y
			xvheld = x-tail_obj.current_obj.x
			yvheld = y-tail_obj.current_obj.y
			
			
		}
		
		x = tail_obj.current_obj.x + xvheld
		y = tail_obj.current_obj.y + yvheld
		hsp = held_start_hsp
		vsp = held_start_vsp
		collision_swordpos(moving_platform_obj)
		collision_swordpos(switch_wall_obj)
		collision_swordpos(sinking_platform_obj)
		
		
		
				//default_collision_nospeed(moving_platform_obj)
		
		
		if !(place_meeting(x,y,wall_obj) || place_meeting(x,y,black_wall_obj)) {
			x = x + tail_obj.current_obj.hsp	
			y = y + tail_obj.current_obj.vsp		
		}
		
		if place_meeting(x,y,wall_obj) || place_meeting(x,y,black_wall_obj) {
			hsp = tail_obj.current_obj.hsp
			vsp = tail_obj.current_obj.vsp
			default_collision(wall_obj)
			default_collision(black_wall_obj)
			xvheld = x-tail_obj.current_obj.x
			yvheld = y-tail_obj.current_obj.y
			hsp = 0
			vsp = 0
		} 
		hsp = 0
		vsp = 0
		
		
		
		
		
	} else {
	
		hsp = 0
		vsp = 0
		
		//x = tail_dest_x
		//y = tail_dest_y
	}
	zoom_timer_bool = false
	zoom_timer = 0
	
	if ability_held_release_jump {
		ability_held_release_t++	
	}
	if ability_held_release_t>ability_held_release_m && (keyboard_check_pressed(vk_space)) {
		reset_intangibility()
		ability_held_release_t=0
		zoom_particle_timer=0
		
		hsp = cos(degtorad(point_direction(x,y,global.mousepx,global.mousepy))) * 60
		vsp = -sin(degtorad(point_direction(x,y,global.mousepx,global.mousepy))) * 60
		out_of_dash_t=-10
		held_position = false
		held_release_timer = 10
		
	}
	if (k_fire_p || k_dash_r) {
		reset_intangibility()
		//if ability_held_release_t>ability_held_release_m && (k_dash_r || keyboard_check_pressed(vk_space)) {
		//	ability_held_release_t=0
		//	move_towards_point(global.mousepx,global.mousepy,23)	
		//	out_of_dash_t=10
		//}
		held_position = false
		held_release_timer = 13
		
	}
	
	held_bounce_timer--
	
	if held_bounce_timer<=0 {
		held_bounce_timer = 0	
	} else {
		
		if k_dash_r || bounce_buff_timer>0  {
			
			reset_intangibility()
			
			if !place_meeting(x,y,wall_obj) {
				
				hsp = held_start_hsp
				vsp = held_start_vsp
			
				held_bounce_timer = 0
				held_position = false
				bounce()	
			} 
			
			
			
		}
	}
	
} else {
	ability_held_release_t =0 
	held_pos_timer = 0	
}

if grounded {
	
	if h_accel_reduc<1 {
		h_accel_reduc+=0.025
		hsp *=h_accel_reduc
	} 
	vsp = min(vsp,0)
}
if out_of_dash_t<0 {
	ang = point_direction(0,0,hsp,vsp)
	//dist = point_distance(0,0,hsp,vsp)
	hsp = lerp(hsp,cos(degtorad(ang))*20,0.30)
	if vsp<0 {
		vsp = lerp(vsp,-sin(degtorad(ang))*20,0.30)
	} else {
		vsp = lerp(vsp,-sin(degtorad(ang))*20,0.20)
	}
}

/*
if (on_wall_left && keyoard_check(ord("A"))) || (on_wall_right && keyoard_check(ord("D"))){
	if !hold_wall_bool && !held_position  {
		audio_play_sound(rocksfalling,0,true)
		hold_wall_bool = true
	} 
	if grounded {
		if audio_is_playing(rocksfalling) {
		audio_stop_sound(rocksfalling)	
	}
	}
	
	vsp = lerp(vsp,clamp(vsp,-100,2.75),0.3)	
	
} else {
	if audio_is_playing(rocksfalling) {
		audio_stop_sound(rocksfalling)	
	}
	hold_wall_bool = false
}




//if !grounded {
//	if on_wall_left && jump_buff_timer>0 {
//		hsp+=wall_jump_x
//		vsp-=wall_jump_y
//		jump_buff_timer = 0
//	}
//	if on_wall_right && jump_buff_timer>0 {
//		hsp-=wall_jump_x
//		vsp-=wall_jump_y
//		jump_buff_timer = 0
//	}
//}

//if jump_buff_timer>0 {
//	jump_buff_timer--	
//}


//hsp = clamp(hsp,-max_hs,max_hs)
//vsp = clamp(vsp,-max_vs,max_vs)

