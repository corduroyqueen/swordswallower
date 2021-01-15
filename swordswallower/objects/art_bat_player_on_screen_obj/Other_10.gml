//fuck yes
if point_distance(x,y,player_obj.x,player_obj.y)<fly_dist || point_distance(x,y,tail_obj.x,tail_obj.y)<200 {
	idle = false
	hsp = -sign(image_xscale)*random_range(0,7)
	vsp = random_range(0,7)
	image_index = floor(random_range(0,4))
	
	
	audio_sound_gain(sound,0.25,0)
	//audio_sound_gain(sound,0,120)
	audio_sound_pitch(sound,random_range(1.0,1.5))
	audio_play_sound_on(emit, sound, false, 0);
}