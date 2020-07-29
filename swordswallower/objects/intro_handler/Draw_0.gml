/// @description Insert description here
// You can write your code in this editor


draw_set_font(font2)
if player_obj.intro {
	
	draw_set_color(c_white)
	draw_set_alpha(alpha)
	
	intro_timer++
	
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
		intro_timer=2001
	}
	
	draw_text(15547,9315,"WASD to move")
	
}





if !player_obj.death {
	if room==subtemple01 {
		if player_obj.x>18000 && player_obj.y<10000 {
		
			if layer_get_visible(level1artm) {
				layer_set_visible(level1artm,false)
				layer_set_visible(level1art1,false)
				layer_set_visible(level1art2,false)
				layer_set_visible(level1art3,false)
				layer_set_visible(level1art4,false)
				layer_set_visible(level1art5,false)
			
				layer_set_visible(level1bgm,false)
				layer_set_visible(level1bg1,false)
				layer_set_visible(level1bg2,false)
				layer_set_visible(level1bg3,false)
			
				layer_set_visible(level3artm,true)
				layer_set_visible(level3art1,true)
				layer_set_visible(level3art2,true)
				layer_set_visible(level3art3,true)
				layer_set_visible(level3art4,true)
			
				layer_set_visible(level3bgm,true)
				layer_set_visible(level3bg1,true)
				layer_set_visible(level3bg2,true)
				layer_set_visible(level3bg3,true)
			}
		} else {
		
			if !layer_get_visible(level1artm) {
				layer_set_visible(level1artm,true)
				layer_set_visible(level1art1,true)
				layer_set_visible(level1art2,true)
				layer_set_visible(level1art3,true)
				layer_set_visible(level1art4,true)
				layer_set_visible(level1art5,true)
			
				layer_set_visible(level1bgm,true)
				layer_set_visible(level1bg1,true)
				layer_set_visible(level1bg2,true)
				layer_set_visible(level1bg3,true)
			
				layer_set_visible(level3artm,false)
				layer_set_visible(level3art1,false)
				layer_set_visible(level3art2,false)
				layer_set_visible(level3art3,false)
				layer_set_visible(level3art4,false)
			
				layer_set_visible(level3bgm,false)
				layer_set_visible(level3bg1,false)
				layer_set_visible(level3bg2,false)
				layer_set_visible(level3bg3,false)
			}
		}
	}
}