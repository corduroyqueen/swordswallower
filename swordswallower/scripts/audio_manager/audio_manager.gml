sound = argument0
priority = argument1
loop = argument2
action = argument3



if action = 0 {
	audio_play_sound(sound,priority,loop)
}

if action = 1 {
	audio_stop_sound(sound)
}

if action == 2 {
	audio_play_sound(sound,priority,loop)	
}

if action = 3 {
	
	
	audio_play_sound(Juicy_Burst_VM_03,0,false)
	
	hello = gsound.s_meat_array[ irandom(array_length_1d(gsound.s_meat_array)-1) ]
	audio_sound_gain(hello,0.2,0)
	audio_play_sound(hello, priority, loop);
	
	
	audio_play_sound(lettuce_chop,0,false)
	
	var ello = impact_2
	audio_sound_gain(ello,0.3,0)
	audio_sound_pitch(ello,random_range(0.9,1.1))
	audio_play_sound(ello,0,false)
	
	audio_play_sound(Knife_Pull_louder,0,false)
}

if action = 4 {
	audio_play_sound(Juicy_Burst_VM_03,0,false)
	
	hello = gsound.s_meat_array[ irandom(array_length_1d(gsound.s_meat_array)-1) ]
	audio_sound_gain(hello,0.3,0)
	audio_play_sound(hello, priority, loop);
	
	audio_play_sound(lettuce_chop_louder,0,false)
	
	audio_play_sound(Knife_Pull_louder,0,false)
}