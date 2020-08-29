//fuck yes//fuck yes

draw_set_font(font2)
if player_obj.intro {
	
	draw_set_color(c_white)
	draw_set_alpha(alpha)
	
	intro_timer++
	intro_timer=2000
	
	if intro_timer<black_timer_m {
		
		timer_audio_script(metal_door,intro_timer,-25)
		timer_audio_script(Emergency_Sandbag_Heavy_Hitting_Rocks_02,intro_timer,-25)
		timer_audio_script(sword_thud_1,intro_timer,-25)
		
		timer_audio_script(meat_pull_outs_1,intro_timer,-25)
		
		
		var ok = footstep5
		audio_sound_pitch(ok,random_range(0.8,1.2))
		timer_audio_script(ok,intro_timer,0)
		audio_sound_pitch(ok,random_range(0.8,1.2))
		timer_audio_script(ok,intro_timer,20)
		audio_sound_pitch(ok,random_range(0.8,1.2))
		timer_audio_script(ok,intro_timer,40)
		audio_sound_pitch(ok,random_range(0.8,1.2))
		timer_audio_script(ok,intro_timer,60)
		audio_sound_pitch(ok,random_range(0.8,1.2))
		timer_audio_script(ok,intro_timer,80)
		audio_sound_pitch(ok,random_range(0.8,1.2))
		timer_audio_script(ok,intro_timer,100)
		
		timer_audio_script(Juicy_Burst_VM_03,intro_timer,63)
		timer_audio_script(Knife_Hit_Wall_2244,intro_timer,63)
		timer_audio_script(eye_scream,intro_timer,63)
		
		
		
		timer_audio_script(sword_reject_1,intro_timer,75)
		timer_audio_script(lettuce_chop,intro_timer,78)
		timer_audio_script(sword_reject_1,intro_timer,175)
		
		timer_audio_script(Juicy_Burst_VM_03,intro_timer,200)
		timer_audio_script(Knife_Hit_Wall_2244,intro_timer,200)
		timer_audio_script(eye_scream,intro_timer,200)
		
		audio_sound_pitch(ok,random_range(0.8,1.2))
		timer_audio_script(ok,intro_timer,210)
		audio_sound_pitch(ok,random_range(0.8,1.2))
		timer_audio_script(ok,intro_timer,235)
		audio_sound_pitch(ok,random_range(0.8,1.2))
		timer_audio_script(ok,intro_timer,250)
		audio_sound_pitch(ok,random_range(0.8,1.2))
		timer_audio_script(ok,intro_timer,270)
		
		
		timer_audio_script(sword_reject_1,intro_timer,275)
		timer_audio_script(lettuce_chop,intro_timer,279)
		
		timer_audio_script(sword_reject_1,intro_timer,400)
		timer_audio_script(lettuce_chop,intro_timer,403)
		
		timer_audio_script(eye_scream,intro_timer,400)
		timer_audio_script(Juicy_Burst_VM_03,intro_timer,403)
		timer_audio_script(Knife_Hit_Wall_2244,intro_timer,410)
		timer_audio_script(Emergency_Sandbag_Heavy_Hitting_Rocks_02,intro_timer,410)
		
		timer_audio_script(eye_scream,intro_timer,425)
		timer_audio_script(eye_scream,intro_timer,450)
		timer_audio_script(eye_scream,intro_timer,475)
		
		if intro_timer>=1 && intro_timer<2 {
			just_blood_input(0,0,0,-8,200,0,4000,1000)
			x-=400
			just_blood_input(0,0,0,-13,200,0,4000,1000)
			x+=900
			just_blood_input(0,0,0,-15,200,0,4000,1000)
			audio_stop_sound(surrogatedrone)
		}
		
		if intro_timer>=600 {
			audio_stop_sound(meat_pull_outs_1)	
		}
		
		if intro_timer>=black_timer_m-1 {
			
			
		}
		
	} else {
		
		
		if intro_timer>900 {
			if player_obj.tail_planted {
				alpha = lerp(alpha,1,0.03)
			} else {
				alpha = lerp(alpha,0,0.03)	
			}
			intro_timer = 901
		}
	
		draw_text(startposx+20,startposy,"Left Click to Pull")
		//draw_sprite_ext(left_click,0,startposx+200,startposy+20,1,1,0,c_white,alpha)
		draw_set_alpha(1)
	
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
		player_obj.x = 19707
		player_obj.y = 13900
		intro_timer=2001
	}
	
	//draw_text(15547,9315,"WASD to move")
	
}
