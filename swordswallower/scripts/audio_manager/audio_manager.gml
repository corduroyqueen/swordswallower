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
	audio_play_sound(gsound.s_meat_array[ irandom(array_length_1d(gsound.s_meat_array)-1) ], priority, loop);
}