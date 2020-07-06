/// @description Insert description here
// You can write your code in this editor
if !player_obj.intro {
	intro_start = false	
} else {
	if player_obj.tail_carry && !sword_swallower.visible {
		text_bool = true	
		text_timer = 1000
	}
	if text_bool {
		text_timer++
		if text_timer>61 && text_timer<63 {
			audio_play_sound(its_drum_time_intro,0,false)
		}
		title_obj.x = player_obj.x
		title_obj.y = player_obj.y
		if text_timer>215 {
			title_obj.sprite_index = title3
		} else if text_timer>135 {
			title_obj.sprite_index = title2
		} else if text_timer>60 {
			title_obj.sprite_index = title
		} else {
			title_obj.sprite_index = noone
		}
		
		if text_timer>295 {
			player_obj.intro=false
			intro_start = false
			text_bool = false
			title_obj.sprite_index = noone
			audio_stop_sound(its_drum_time_intro)
			//audio_manager(gsound.m_area_one,0,true,0)
			//camera_set_view_size(view_camera[0],1280,720)
		}
	}
	
}