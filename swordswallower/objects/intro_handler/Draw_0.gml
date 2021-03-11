//fuck yes//fuck yes

//draw_set_font(font2)
if player_obj.intro {
	
	draw_set_color(c_white)
	draw_set_alpha(alpha)
	
	intro_timer++
	if level1_master.dev {
		intro_timer = 100000 
	}
	//intro_timer=2000
		
	if intro_timer<black_timer_m {
		
		//timer_audio_script(metal_door,intro_timer,-25)
		//timer_audio_script(Emergency_Sandbag_Heavy_Hitting_Rocks_02,intro_timer,-25)
		//timer_audio_script(sword_thud_1,intro_timer,-25)
		
		//timer_audio_script(meat_pull_outs_1,intro_timer,-25)
		
		
		var ok = choose(s_footstep_wood_01,s_footstep_wood_02,s_footstep_wood_03)
				audio_sound_gain(ok,0.75,0)
				
				audio_sound_pitch(ok,random_range(0.9,1.1))
				//audio_manager(ok,0,false,0)
		timer_audio_script(ok,intro_timer,0)
		ok = choose(s_footstep_wood_01,s_footstep_wood_02,s_footstep_wood_03)
		audio_sound_pitch(ok,random_range(0.8,1.2))
		timer_audio_script(ok,intro_timer,16)
		ok = choose(s_footstep_wood_01,s_footstep_wood_02,s_footstep_wood_03)
		audio_sound_pitch(ok,random_range(0.8,1.2))
		timer_audio_script(ok,intro_timer,30)
		ok = choose(s_footstep_wood_01,s_footstep_wood_02,s_footstep_wood_03)
		audio_sound_pitch(ok,random_range(0.8,1.2))
		timer_audio_script(ok,intro_timer,45)
		ok = choose(s_footstep_wood_01,s_footstep_wood_02,s_footstep_wood_03)
		audio_sound_pitch(ok,random_range(0.8,1.2))
		timer_audio_script(ok,intro_timer,57)
		ok = choose(s_footstep_wood_01,s_footstep_wood_02,s_footstep_wood_03)
		audio_sound_pitch(ok,random_range(0.8,1.2))
		timer_audio_script(ok,intro_timer,70)

		
		//timer_audio_script(Juicy_Burst_VM_03,intro_timer,63)
		//timer_audio_script(Knife_Hit_Wall_2244,intro_timer,63)
		//timer_audio_script(eye_scream,intro_timer,63)
		
		if intro_timer==75 {
			audio_play_sound(gsound.s_sword_whoosh,0,true)
		}
		
		
		if intro_timer==100 {
			audio_stop_sound(gsound.s_sword_whoosh)
		}
		
		
		timer_audio_script(eye_scream,intro_timer,100)
		
		timer_audio_script(Knife_Pull_140,intro_timer,100)
			
		ok = sword_thud_1
		audio_sound_gain(ok,random_range(0.3,0.35),0)
		audio_sound_pitch(ok,random_range(0.9,1.1))
		timer_audio_script(ok,intro_timer,100)
			
		var bruh = lettuce_chop
		audio_sound_pitch(bruh,random_range(0.75,1.25))
		audio_sound_gain(bruh,0.32,0)
		timer_audio_script(bruh,intro_timer,100)
			
		bruh = sword_crunch_1
		audio_sound_pitch(bruh,random_range(2,3))
		audio_sound_gain(bruh,random_range(0.3,0.6),0)
		timer_audio_script(bruh,intro_timer,100)
			
		
		var lel = Emergency_Sandbag_Heavy_Hitting_Rocks_02
		audio_sound_pitch(lel,random_range(0.9,1.1))
	//audio_manager(Emergency_Sandbag_Heavy_Hitting_Rocks_02,0,false,0)
	timer_audio_script(lel,intro_timer,110)
		
	var ello = sword_strike_1
	audio_sound_gain(ello,0.3,0)
	audio_sound_pitch(ello,random_range(0.9,1.1))
	//audio_manager(Emergency_Sandbag_Heavy_Hitting_Rocks_02,0,false,0)
	timer_audio_script(ello,intro_timer,110)
		
		
	ello = gsound.s_sword_hit_metal_wall
	audio_sound_pitch(ello,random_range(0.9,1.1))
	//audio_manager(gsound.s_sword_hit_metal_wall,0,false,0)
	
	timer_audio_script(ello,intro_timer,110)
		
	ello = impact_1
	audio_sound_gain(ello,0.5,0)
	audio_sound_pitch(ello,random_range(0.9,1.1))
	timer_audio_script(ello,intro_timer,110)
	//audio_manager(Emergency_Sandbag_Heavy_Hitting_Rocks_02,0,false,0)
	
		
		var ok = choose(s_footstep_wood_01,s_footstep_wood_02,s_footstep_wood_03)
				audio_sound_gain(ok,0.75,0)
				
				audio_sound_pitch(ok,random_range(0.9,1.1))
				//audio_manager(ok,0,false,0)
		timer_audio_script(ok,intro_timer,210)
		ok = choose(s_footstep_wood_01,s_footstep_wood_02,s_footstep_wood_03)
		audio_sound_pitch(ok,random_range(0.8,1.2))
		timer_audio_script(ok,intro_timer,235)
		ok = choose(s_footstep_wood_01,s_footstep_wood_02,s_footstep_wood_03)
		audio_sound_pitch(ok,random_range(0.8,1.2))
		timer_audio_script(ok,intro_timer,255)
		ok = choose(s_footstep_wood_01,s_footstep_wood_02,s_footstep_wood_03)
		audio_sound_pitch(ok,random_range(0.8,1.2))
		timer_audio_script(ok,intro_timer,280)
		
		
		var idle_sound = choose(zomb_idle1,zomb_idle2,zomb_idle3)
		audio_sound_pitch(idle_sound,random_range(0.8,1.2))
		timer_audio_script(idle_sound,intro_timer,240)
		
		if intro_timer==270 {
			audio_play_sound(gsound.s_sword_whoosh,0,true)
		}
		
		
		if intro_timer==310 {
			audio_stop_sound(gsound.s_sword_whoosh)
		}
		
		
		
		if intro_timer==330 {
			audio_play_sound(gsound.s_sword_whoosh,0,true)
		}
		
		
		timer_audio_script(Knife_Pull_140,intro_timer,100)
			
		ok = sword_thud_1
		audio_sound_gain(ok,random_range(0.3,0.35),0)
		audio_sound_pitch(ok,random_range(0.9,1.1))
		timer_audio_script(ok,intro_timer,370)
			
		var bruh = lettuce_chop
		audio_sound_pitch(bruh,random_range(0.75,1.25))
		audio_sound_gain(bruh,0.32,0)
		timer_audio_script(bruh,intro_timer,370)
			
		bruh = sword_crunch_1
		audio_sound_pitch(bruh,random_range(2,3))
		audio_sound_gain(bruh,random_range(0.3,0.6),0)
		timer_audio_script(bruh,intro_timer,370)
		
		ok = choose(zomb_death3)
		audio_sound_pitch(ok,random_range(0.8,1.2))
		audio_sound_gain(ok,0.2,0)
		timer_audio_script(ok,intro_timer,375)
		
		if intro_timer==400 {
			audio_stop_sound(gsound.s_sword_whoosh)
		}
		
		
		var lel = Emergency_Sandbag_Heavy_Hitting_Rocks_02
		audio_sound_pitch(lel,random_range(0.9,1.1))
		//audio_manager(Emergency_Sandbag_Heavy_Hitting_Rocks_02,0,false,0)
		timer_audio_script(lel,intro_timer,400)
		
		var ello = sword_strike_1
		audio_sound_gain(ello,0.3,0)
		audio_sound_pitch(ello,random_range(0.9,1.1))
		//audio_manager(Emergency_Sandbag_Heavy_Hitting_Rocks_02,0,false,0)
		timer_audio_script(ello,intro_timer,400)
		
		
		ello = gsound.s_sword_hit_metal_wall
		audio_sound_pitch(ello,random_range(0.9,1.1))
		//audio_manager(gsound.s_sword_hit_metal_wall,0,false,0)
	
		timer_audio_script(ello,intro_timer,400)
		
		ello = impact_1
		audio_sound_gain(ello,0.5,0)
		audio_sound_pitch(ello,random_range(0.9,1.1))
		timer_audio_script(ello,intro_timer,400)
	
		timer_audio_script(sword_reject_1,intro_timer,400)
		timer_audio_script(lettuce_chop,intro_timer,400)
		
		timer_audio_script(eye_scream,intro_timer,400)
		timer_audio_script(Juicy_Burst_VM_03,intro_timer,403)
		timer_audio_script(Knife_Hit_Wall_2244,intro_timer,410)
		timer_audio_script(Emergency_Sandbag_Heavy_Hitting_Rocks_02,intro_timer,410)
		
		var ok = choose(s_footstep_wood_01,s_footstep_wood_02,s_footstep_wood_03)
				audio_sound_gain(ok,0.75,0)
				
				audio_sound_pitch(ok,random_range(0.9,1.1))
				//audio_manager(ok,0,false,0)
		timer_audio_script(ok,intro_timer,380)
		ok = choose(s_footstep_wood_01,s_footstep_wood_02,s_footstep_wood_03)
		audio_sound_pitch(ok,random_range(0.8,1.2))
		timer_audio_script(ok,intro_timer,401)
		ok = choose(s_footstep_wood_01,s_footstep_wood_02,s_footstep_wood_03)
		audio_sound_pitch(ok,random_range(0.8,1.2))
		timer_audio_script(ok,intro_timer,419)
		ok = choose(s_footstep_wood_01,s_footstep_wood_02,s_footstep_wood_03)
		audio_sound_pitch(ok,random_range(0.8,1.2))
		timer_audio_script(ok,intro_timer,438)
		
		timer_audio_script(eye_scream,intro_timer,440)
		
		if intro_timer>=1 && intro_timer<2 {
			//just_blood_input(0,0,0,-8,200,0,4000,1000)
			//x-=400
			//just_blood_input(0,0,0,-13,200,0,4000,1000)
			//x+=900
			//just_blood_input(0,0,0,-15,200,0,4000,1000)
			audio_stop_sound(surrogatedrone)
			audio_play_sound(ocean_ambience,0,false)
		}
		
		if intro_timer>=600 {
			audio_stop_sound(ocean_ambience)
		}
		
		if intro_timer>=black_timer_m-1 {
			
			
		}
		
	} else {
		
		
		if intro_timer>900 {
			if !player_obj.tail_pulling {
				a2 = lerp(a2,1,0.03)
			} else {
				a2 = lerp(a2,0,0.3)	
			}
			intro_timer = 901
		}
		draw_set_alpha(1)
		//depth = -500
		//draw_text(startposx+20,startposy,"Left Click to Pull")
		if input_controller.controller==input_controller.controller_keyboard {
			draw_sprite_ext(txt_leftclickintro,0,startposx+20,startposy,1,1,0,c_white,a2)
		} else {
			draw_sprite_ext(txt_rightshoulderintro,0,startposx+20,startposy,1,1,0,c_white,a2)
		}
		//draw_sprite_ext(left_click,0,startposx+200,startposy+20,1,1,0,c_white,alpha)
		
	
	}
	
} else {
	
	if player_obj.tail_planted {
		alpha = lerp(alpha,1,0.1)
	} else {
		alpha = lerp(alpha,0,0.1)	
	}
	if intro_timer<2000 && player_obj.tail_carry {
		with music_ctrlr {
			audio_start_sync_group(subtemple_mc)	
		}
		
		intro_timer=2001
	}
	
	//draw_text(15547,9315,"WASD to move")
	
}
