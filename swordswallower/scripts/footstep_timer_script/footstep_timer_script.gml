if grounded {
	if k_left || k_right {
		footstep_timer++
		if footstep_timer > footstep_timer_m {
			//audio_play_sound(gsound.s_footstep_stone,0,false)
			footstep_timer=0
		}
	} else {
		footstep_timer=footstep_timer_m-1	
	}

} else {
	footstep_timer=footstep_timer_m-1	
}
