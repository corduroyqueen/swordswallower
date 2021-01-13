/// @description Insert description here
// You can write your code in this editor

if x>(47000) {
	if times_spoken<1 {
		dialogue_array[0] = "I'm going to circle around. I'll wait for you on the other side if I get there first. "
		dialogue_array[1] = "See you soon. "
		dialogue_array[2] = "end"
	} else {
		dialogue_array[0] = "Good luck. "
		dialogue_array[1] = "end"
	}
//if times_spoken<1 {
	
//}
} else {
	if times_spoken<1 {
		dialogue_array[0] = "Wha... What's that ahead of us? Hold on. "
		dialogue_array[1] = "... "
		dialogue_array[2] = "The island ahead... I've never seen it before. I passed through just this morning. "
		dialogue_array[3] = "It looks like it's covered the width of the pass, so I can't get past. "
		dialogue_array[4] = "I guess I'm going to drop you off. I'll go back and take the long way around... "
		dialogue_array[5] = "Maybe I can pick you up from the other side. "
		dialogue_array[6] = "... "
		dialogue_array[7] = "Did it bubble up from the bottom of the lake? "
		dialogue_array[8] = "end"
	} else {
		dialogue_array[0] = "My village will be okay. The guards are capable. "
		dialogue_array[1] = "But this is a bad omen. "
		dialogue_array[2] = "end"
	}
}

if !done {
	
	if go {
		if !yolo {
			//instance_create_depth(x,y,-999999999999,title_screen_obj)	
			yolo = true
		}
		if loop1 < .4 || loop2 < .4{
			if loop1<loop2 {
				lol = loop1 	
			} else { lol = loop2 }
			hsp=lerp(hsp,cos(lol*3.1415)*5,0.15)
		}  else {
			hsp=lerp(hsp,2,0.1)
		}
		
		if loop1<loop2 {
			lol = loop1 	
		} else { lol = loop2 }
		hsp = lerp(hsp,sin(lol*6.2831)*6.5,0.15)
		hsp = clamp(hsp,2,200)
		
		if x>(47000) {
			go = false	
			player_obj.ending_lock = false
			player_obj.move_locked = false
			tail_obj.moving_platform_bool = false
			sword_present = false
			player_obj.held_position = false
			//with tail_obj {
			//	sword_reject_script()
			//}
			sword_pull_check()
			current_pick = 0
			//x = startx+7999
			//done = true
			//hsp = 0
			
			ui_manager.current_dialogue = "end"
			current_pick = 0
			times_spoken=0
			boatboy_obj.times_spoken = 0
			
		}
		if loop1>0.8 || loop2>0.8 || loop1<0.05 || loop2<0.05 {
			vsp = lerp(vsp,10,0.01)
		} else {
			vsp = lerp(vsp,0,0.05)	
		}
	} else {
		hsp = 0
		if tail_obj.current_obj==id && player_obj.held_position && x<(startx+10) {
			go = true
			player_obj.ending_lock = true
			current_pick=0
			with boatboy_obj {
				ui_manager.current_dialogue = "end"
				current_pick = 0
			}
			
			with player_obj {
				x = player_hitbox_check_obj.x	
				y = player_hitbox_check_obj.y
				xvheld = x-tail_obj.current_obj.x
				yvheld = y-tail_obj.current_obj.y
			}
			
		}	
	}

	if point_distance(x,y,player_obj.x,player_obj.y)<(sprite_width) {
		player_present = true
	} else {
		player_present = false
	}
	y = lerp(y,starty ,0.1)
	if init {
		
		var lol = dialogue_array[0]
		while lol!="0" {
			lol = dialogue_array[o]	
			o++
		}
		if o>0 {
			dialogue_array[o-1] = "end"
		} else {
			dialogue_array[0] = "end"	
		}
		init = false
	}
	
	
	if x>(startx+1000) && go {
		
		if !init_talk || player_obj.k_speak_p {
			init_talk = true
			if !ui_manager.spk_bool {
				ui_manager.speaking = true
				ui_manager.printing = true
				ui_manager.spk_bool = true
				ui_manager.s_dia_talk_list = dialogue_sound_list
				with ui_manager {
					current_dialogue = ""
					global.display_txt = ""
					global.tboxActive = false;
					txt = global.txtCache;
					global.txtCache = "";
		
					txt = global.placeholderTxt;
					global.placeholderTxt = "";
					global.temp_placeholderTxt = "";
					global.txtIndex = 1;
			
				}
			
				dialogue = dialogue_array[current_pick]
				current_pick++
				ui_manager.current_dialogue = dialogue
			} 
			
		
			if dialogue=="end" {
				current_pick = 0
				times_spoken++
			} 
		}
			
		with ui_manager {
			friendly_x = other.x
			friendly_y = other.y - 50
			friendly_x = player_obj.x+500
			friendly_y = player_obj.y
			view_xview = friendly_x-view_wview/2
		}
	}

	if sword_present = false && !go && x>(startx+20000) {
		//ui_manager.current_dialogue = "end"
		current_pick = 0
		x = startx+7999
		done = true
		hsp = 0
	}
}

moving_plat_move(hsp,vsp)