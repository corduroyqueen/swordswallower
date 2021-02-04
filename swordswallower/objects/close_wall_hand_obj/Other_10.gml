//fuck yes

	
	ello = squish2
	audio_sound_gain(ello,0.75,0)
	audio_sound_pitch(ello,random_range(0.9,1.1))
	audio_play_sound(ello,0,false)
	
	ello = choose(s_squelch_01,s_squelch_02,s_squelch_03,s_squelch_04,s_squelch_05,
		s_squelch_06,s_squelch_07,s_squelch_08)
	audio_sound_gain(ello,0.4,0)
	audio_sound_pitch(ello,random_range(1.0,1.2))
	audio_play_sound(ello,0,false)