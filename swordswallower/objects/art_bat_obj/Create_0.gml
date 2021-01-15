//fuck yes
idle = true
hsp=0
vsp=0


emit = audio_emitter_create()
sound = s_bats_flying_away


var cx = player_obj.camx + player_obj.cam_width_h
var cy = player_obj.camy + player_obj.cam_height_h
	
s_posx = mean(cx,cx,cx,cx,cx,cx,tail_obj.x)
s_posy = mean(cy,cy,cy,cy,cy,cy,tail_obj.y)


	//audio_sound_pitch(Emergency_Sandbag_Heavy_Hitting_Rocks_02,random_range(0.9,1.1))
	////audio_manager(Emergency_Sandbag_Heavy_Hitting_Rocks_02,0,false,0)
	//audio_play_sound_at(Emergency_Sandbag_Heavy_Hitting_Rocks_02,
	//	posx,
	//	posy,
	//	10,100,300,1,false,0)