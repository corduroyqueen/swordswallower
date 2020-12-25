if k_fire_p {
	left_click_buffer = 7
}
if zoom_allow>0 {
	zoom_allow--	
}	

if !tail_planted && !tail_held {
	if !tail_pulling {
		if left_click_buffer>0 && !tail_pulling && !tail_throwing {
			//if grounded {
			//	winding = true	
			//} else {
			tail_obj.moving_platform_bool = false
			tail_obj.x = player_obj.x
			tail_obj.y = player_obj.y
			if input_controller.controller == input_controller.controller_ds4 {
				//auto_aim_selection(0.8)
				auto_aim_selection(0.7)
			} else {
				//auto_aim_selection(0.25)
				//auto_aim_selection(1)
			}
			tail_dest_x = global.mousepx
			tail_dest_y = global.mousepy
			tail_carry = false
			tail_throwing = true
			
			left_click_buffer = 0
			//held_release_timer=0
			if !grounded{
				//vsp=0
				//hsp=0
			}
			if stinky_check {
				tail_obj.stinky_when_thrown = true
				tail_obj.stinky = true	
			}
				
			start_throw_x = x
			start_throw_y = y
			//}
			
			with tail_obj {
				//audio_manager(gsound.s_sword_whoosh,0,true,0)
				
				audio_emitter_gain(s_whoosh_emitter,1)
			}
		}
		
		
		//if winding {
		//	if global.mousepcheck_button_released(mb_left) {
		//		tail_dest_x = global.mousepx
		//		tail_dest_y = global.mousepy
		//		//tail_obj.hsp = xl //* tail_obj.tspeed
		//		//tail_obj.vsp = yl //* tail_obj.tspeed
		//		tail_carry = false
		//		tail_throwing = true
		//		winding = false
				
		//		start_throw_x = x
		//		start_throw_y = y
		//	}
		//}
		if tail_throwing && k_dash_p && !zoom_timer_bool {
			zoom_buff_timer = 60
			//tail_planted=false
		}
		zoom_buff_timer--
	}
	
	if (tail_carry || tail_pulling )&& tail_obj.nearby_swordgrab_buffer>0 && k_dash_p 
	&& level1_master.ability_dash //&& point_distance(x,y,player_hitbox_check_obj.x,player_hitbox_check_obj.y)<135 
	&& tail_obj.current_obj.object_index!=black_wall_obj
	{
		//shockwave_shader.trigger = true
		
		zoom_buff_timer = 0
		//zoom_ctdn = 4
		//tail_zooming=true
		zoom_timer_bool = true
		zoom_pause = true
			
		tail_carry = false
		tail_pulling = false
		tail_planted = true
		tail_obj.x = tail_obj.lpx
		tail_obj.y = tail_obj.lpy
			
		audio_play_sound(Ice_Projectile_Shoot_03,0,false)
		audio_play_sound(swsw_dash_base,0,false)
		audio_sound_gain(swsw_dash_base,0.5,0)
		//audio_play_sound(kka,0,false)
		
		draw_line_obj.go = true	
		draw_line_obj.gotimer=50
		draw_line_obj.alpha = 1
		//instance_create_depth(x,y,-10,explosion_obj)
	}
} else {
	//if global.mousepcheck_button_released(mb_left) && !tail_pulling && !tail_throwing && !zoom_timer_bool {
	//	//if grounded {
	//	//	winding = true	
	//	//} else {
				
	//		tail_dest_x = global.mousepx
	//		tail_dest_y = global.mousepy
	//		tail_planted = false
	//		tail_throwing = true
				
	//		start_throw_x = x
	//		start_throw_y = y
	//	//}
	//	audio_manager(gsound.s_sword_whoosh,0,true,0)
	//} else 
	if k_fire_p && zoom_timer_bool  && !gem_active {
		click_out_of_wall_timer = 20
	}
	
	if click_out_of_wall_timer>0 && zoom_timer_bool { 
		click_out_of_wall_timer-- 
		//sdm(click_out_of_wall_timer)
		if !place_meeting(x,y,wall_obj) {
				
			sword_pull_check()
			hsp*=0.65
			vsp*=0.65
			
			reset_intangibility()
			zoom_timer_bool= false
			zoom_timer = 0
			audio_manager(pullout1,0,false,2)
			click_out_of_wall_timer = 0
		}
	}
	
	if k_fire_p && !tail_held {
		if gem_active {
			tail_obj.pull_timer = 0
			tail_obj.inside_flier = false
			zoom_out_of_wall_timer = 0
			
			if held_bounce_timer<=0 {
				//bounced = true
			}
	
			tail_obj.planted_wall = false	
			boosting_collision_check = false
			bounce_buff_timer = 0
			check_zoom_collision = false
			
			
			tail_dest_x = global.mousepx
			tail_dest_y = global.mousepy
			tail_planted = false
			tail_throwing = true
				
			start_throw_x = tail_obj.x
			start_throw_y = tail_obj.y
			tail_obj.throw_timer=0
			tail_obj.throw_count=0
			
			gem_thrown = true
			
		} else if !zoom_timer_bool {
			sword_pull_check()
			audio_manager(pullout1,0,false,2)
		} else {
			
		}
		
	} else if k_dash_p && !zoom_timer_bool {
		zoom_buff_timer = 10
		
	}
	
	
	
	
	if tail_planted && zoom_allow<1 &&
	zoom_buff_timer>0 && k_dash && !k_dash_r 
	&& level1_master.ability_dash {
		//shockwave_shader.trigger = true
		
		zoom_buff_timer = 0
		zoom_ctdn = 6
		tail_zooming=true
		zoom_pause = true
		
		audio_play_sound(Ice_Projectile_Shoot_03,0,false)
		audio_play_sound(swsw_dash_base,0,false)
		audio_sound_gain(swsw_dash_base,0.5,0)
		
		draw_line_obj.go = true	
		draw_line_obj.gotimer=50
		draw_line_obj.alpha = 1
		//instance_create_depth(x,y,-10,explosion_obj)
	}
	
	
}

if left_click_buffer>0 {
	left_click_buffer--	
}
if zoom_buff_timer<=0 {
	zoom_buff_timer = 0	
}