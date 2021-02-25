//fuck yes
big_timer++
if big_timer<200 {
	blood_timer_1++
	blood_timer_2++
	blood_timer_3++
	blood_timer_4++
	blood_timer_5++

	y+=0.2
	if blood_timer_1>blood_timer_m {
		just_blood_speed_input(-2,-2,0.2,25,true,x-50,y)
		blood_timer_1 = 0
		event_user(1)
	}
	if blood_timer_2>blood_timer_m {
		just_blood_speed_input(-1.5,-1,0.2,25,true,x-60,y+400)
		blood_timer_2 = 0
		event_user(1)
	}
	if blood_timer_3>blood_timer_m {
		just_blood_speed_input(-2,-2,0.2,25,true,x-40,y+130)
		blood_timer_3 = 0
		event_user(1)
	}
	if blood_timer_4>blood_timer_m {
		just_blood_speed_input(-1.5,-1.5,0.2,25,true,x-60,y+210)
		blood_timer_4 = 0
		event_user(1)
	}
	if blood_timer_5>blood_timer_m {
		just_blood_speed_input(-1.5,-2,0.2,25,true,x-40,y+300)
		blood_timer_5 = 0
		event_user(1)
	}
} else {
	if sprite_index==stomachburst {
		audio_sound_gain(boss_explosion,2,0)
		audio_play_sound(boss_explosion,0,false)
		
		
		audio_stop_sound(boss_death_2)
		player_obj.shake_d=20
		player_obj.camera_shake_d = true
		sprite_index = spr_bossexplosion
		image_index = 0
		image_speed=1.5
		event_user(1)
		
		audio_play_sound(Knife_Pull_140,0,false)
			
			var ok = sword_thud_1
			audio_sound_gain(ok,random_range(0.5,0.6),0)
			audio_sound_pitch(ok,random_range(0.9,1.1))
			audio_play_sound(ok,0,false)

			
			bruh = venus_die_1
			audio_sound_pitch(bruh,random_range(0.8,1.2))
			audio_sound_gain(bruh,random_range(0.5,0.8),0)
			audio_play_sound(bruh,0,false)
		just_blood_speed_input(-2,-2,0.2,25,true,x-40,y+130)
	}
}