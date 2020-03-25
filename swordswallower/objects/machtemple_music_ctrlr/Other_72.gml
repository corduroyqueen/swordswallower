/// @description Insert description here
// You can write your code in this editor
if start{
	subtemple_mc = audio_create_sync_group(true)
	audio_play_in_sync_group(subtemple_mc,sub_drums1)
	audio_play_in_sync_group(subtemple_mc,sub_bass1)
	
	audio_play_in_sync_group(subtemple_mc,sub_bass2)
	audio_sound_gain(sub_bass2,0,0)
	
	//audio_start_sync_group(subtemple_mc)
	
	//audio_play_sound(sub_drums1,1,true)
	//audio_play_sound(sub_bass1,1,true)
	
	//
	start = false
}
