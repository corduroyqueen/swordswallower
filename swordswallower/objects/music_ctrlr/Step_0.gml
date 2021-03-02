/// @description Insert description here
// You can write your code in th


if level1_master.dev {
	//if keyboard_check_pressed(ord("O")) {
	//	audio_sound_gain(sub_bass1,1,0)
	//	audio_sound_gain(sub_bass2,0,0)
	
	//	audio_sound_gain(swsw1,0.19,0)
	//}

	//if keyboard_check_pressed(ord("P")) {
	//	audio_sound_gain(sub_bass1,0,0)
	//	audio_sound_gain(sub_bass2,1,0)
	
	//	audio_sound_gain(swsw1,0,0)
	//}
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
	
	if art_surface_setter.void_black_rect_a>0 {
		audio_sound_gain(swsw1,(1-art_surface_setter.void_black_rect_a)*0.35*(1-art_surface_setter.void_black_rect_a),0)
		
		if !audio_is_playing(surrogatedrone) {
				
			audio_play_sound(surrogatedrone,0,true)
			audio_sound_set_track_position(surrogatedrone,30)
		
		}
		if level1_master.in_void {
			audio_sound_gain(surrogatedrone,0.35,0)
		} else {
			audio_sound_gain(surrogatedrone,(art_surface_setter.void_black_rect_a)*0.35,0)
		}
	} else {
		if audio_is_playing(surrogatedrone) && !instance_exists(title_screen_obj) {
			audio_stop_sound(surrogatedrone)
		}
	}
	
	if instance_exists(coffin_boss_1) {
		if coffin_boss_1.music_cue {
			if go2 {
				audio_stop_sync_group(subtemple_mc)
				audio_stop_all()
				part2_mc = audio_create_sync_group(true)
				audio_sound_gain(swsw2, 0.47, 0);
				audio_play_in_sync_group(part2_mc,swsw2)
				audio_start_sync_group(part2_mc)
				
				//audio_play_sound(swsw2,0,false)
				//audio_sound_set_track_position(swsw2,26.00)
				go2 = false
			}
		}
	}
	
	if point_distance(lore_mirror_obj.x,lore_mirror_obj.y,player_obj.x,player_obj.y)<950 {
		audio_sound_gain(swsw2,0,180)
		if !audio_is_playing(swsw_item_room) {
			audio_play_sound(swsw_item_room,0,true)
			audio_sound_gain(swsw_item_room,0,0)
			audio_sound_gain(swsw_item_room,1,180)
		}
	} else if audio_is_playing(swsw_item_room) {
		audio_sound_gain(swsw_item_room,0,180)
		audio_sound_gain(swsw2,0.47,160)
		if audio_sound_get_gain(swsw_item_room)<0.05 {
			audio_sound_gain(swsw_item_room,0,0)
			
			audio_stop_sound(swsw_item_room)
		}
		
	}
	if go3 {
		if player_obj.x>36203 {
		
			audio_sound_gain(swsw2,0,5000)
			audio_play_sound(ocean_ambience,0.2,3000)
			go3 = false
		}
	}
	
	if go6 {
		if player_obj.x>46000 {
			//audio_sound_pitch(swsw_meat_1_music,1.5)
			audio_play_sound(swsw_meat_1_music,0,true)
			
			audio_sound_gain(swsw_meat_1_music,0,0)
			audio_sound_gain(swsw_meat_1_music,1,500)
			go6 = false
		}
	}
	
	if go5 {
		if player_obj.x>66400 && player_obj.y>2750 {
			player_obj.disable = true
			player_obj.hsp = 0
			if audio_is_playing(ocean_ambience) {
				audio_stop_sound(ocean_ambience)
				audio_stop_sound(swsw_meat_1_music)
			}
			if (instance_exists(meat1_boss) && !meat1_boss.docile) {
				audio_stop_all()
				part4_mc = audio_create_sync_group(true)
				//audio_play_in_sync_group(part4_mc,swsw_bossfight)
				//audio_start_sync_group(part4_mc)
				audio_play_sound(swsw_bossfight_new2,0,true)
				audio_sound_gain(swsw_bossfight_new2,0.3,0)
				player_obj.disable = false
				go5 = false
			}
			
		}
	}
	
	//audio_sound_gain(swsw1,0,0)
	//audio_sound_gain(swsw2,0,0)
	//audio_sound_gain(swsw_bossfight,0,0)
	
}

//if lower_boss_music {
//	audio_sound_gain(swsw_bossfight_new2,0.3,60)
//}

//if lower_boss_music {
//	audio_sound_gain(swsw_bossfight_new2,0.6,60)
//}


if !go2 {
	if audio_sound_get_gain(swsw1)>0 {
		audio_sound_gain(swsw1,0,0)
	}	
}	

//audio_sound_gain(swsw2,0,0)
//audio_sound_gain(swsw1,0,0)


//audio_sound_gain(gmc,duck_value,0)