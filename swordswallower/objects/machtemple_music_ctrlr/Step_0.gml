/// @description Insert description here
// You can write your code in th
if !start {
	timer++
	if timer>=344{
		timer=0	
	}



	if audio_sync_group_get_track_pos(subtemple_mc)<=1 {
		//timer=0	
	}

	if keyboard_check_pressed(ord("O")) {
		audio_sound_gain(sub_bass1,1,0)
		audio_sound_gain(sub_bass2,0,0)
	}

	if keyboard_check_pressed(ord("P")) {
		audio_sound_gain(sub_bass1,0,0)
		audio_sound_gain(sub_bass2,1,0)
	}

}