
with tail_obj {
	if local_obj.inv_timer>0 || local_obj.death {
		player_obj.tail_planted = false
		x = oldx
		y = oldy
			
		return false	
	}
	can_sword_be_planted = false
	with local_obj {
		sprite_index = eyebat_flying3
			
		death_blood_spawn_x = x
		death_blood_spawn_y = y
		death = true	
		met = true
		//sdm("fly dead")
		//shatter_mb_input_script(sprite_width/2)	
	}
	sword_hitpause(local_obj,2)
	player_obj.shake_d=4.5
	player_obj.camera_shake_d = true
	audio_play_sound(Knife_Pull_140,0,false)
		
		
			
	var ok = sword_thud_1
	audio_sound_gain(ok,random_range(0.1,0.2),0)
	audio_sound_pitch(ok,random_range(1.1,1.3))
	audio_play_sound(ok,0,false)
		
	player_obj.tail_planted = false
	//x = xpreva
	//y = ypreva
	return false	
	//hitpause = true
}