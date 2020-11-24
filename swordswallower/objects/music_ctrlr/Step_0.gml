/// @description Insert description here
// You can write your code in th


if level1_master.dev {
	if keyboard_check_pressed(ord("O")) {
		audio_sound_gain(sub_bass1,1,0)
		audio_sound_gain(sub_bass2,0,0)
	
		audio_sound_gain(swsw1,0.19,0)
	}

	if keyboard_check_pressed(ord("P")) {
		audio_sound_gain(sub_bass1,0,0)
		audio_sound_gain(sub_bass2,1,0)
	
		audio_sound_gain(swsw1,0,0)
	}
}

if room==subtemple01 {
	//with gagaga {
	//	if checkpoint_manager.checkpoint==self {
	//		audio_sound_gain(swsw1,0,3000)
	//	}
	//}
	
	with hohoho {
		if enabled {
			audio_sound_gain(swsw1,0,0)
		}
	}
	
	if instance_exists(coffin_boss_1) {
		if coffin_boss_1.music_cue {
			if go2 {
				audio_stop_sync_group(subtemple_mc)
				part2_mc = audio_create_sync_group(true)
				audio_play_in_sync_group(part2_mc,swsw2)
				audio_start_sync_group(part2_mc)
				audio_play_sound(swsw2,0,false)
				//audio_sound_set_track_position(swsw2,26.00)
				go2 = false
			}
		}
	}
	
	
	if go3 {
		if player_obj.x>36203 {
		
			audio_sound_gain(swsw2,0,5000)
			audio_play_sound(ocean_ambience,0.2,3000)
			go3 = false
		}
	}
	
	if go5 {
		if player_obj.x>66400 && player_obj.y>2750 {
			part4_mc = audio_create_sync_group(true)
			audio_play_in_sync_group(part4_mc,swsw_bossfight)
			audio_start_sync_group(part4_mc)
			audio_play_sound(swsw_bossfight,0,false)
			audio_stop_sound(ocean_ambience)
			go5 = false
		}
	}
	
	
}

if !go2 {
	if audio_sound_get_gain(swsw1)>0 {
		audio_sound_gain(swsw1,0,0)
	}	
}	

//audio_sound_gain(swsw2,0,0)
//audio_sound_gain(swsw1,0,0)


//audio_sound_gain(gmc,duck_value,0)