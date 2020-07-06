/// @description Insert description here
// You can write your code in this editor
if sword_present {
	tail_obj.current_obj = self
	tail_obj.moving_platform_bool = true
	
}


if !done {
	
	if go {
		if !yolo {
			instance_create_depth(x,y,-999999999999,title_screen_obj)	
			yolo = true
		}
		if loop1 < .4 || loop2 < .4{
			if loop1<loop2 {
				lol = loop1 	
			} else { lol = loop2 }
			hspeed=lerp(hspeed,cos(lol*3.1415)*5,0.15)
		}  else {
			hspeed=lerp(hspeed,2,0.1)
		}
		
		if loop1<loop2 {
			lol = loop1 	
		} else { lol = loop2 }
		hspeed = lerp(hspeed,sin(lol*6.2831)*6.5,0.15)
		hspeed = clamp(hspeed,2,200)
		
		if x>(startx+7600) {
			go = false	
		}
		if loop1>0.8 || loop2>0.8 || loop1<0.05 || loop2<0.05 {
			vspeed = lerp(vspeed,10,0.01)
		} else {
			vspeed = lerp(vspeed,0,0.05)	
		}
	} else {
		hspeed = 0
		if place_meeting(x,y,tail_obj) && player_obj.held_position && x<(startx+10) {
			go = true
			player_obj.ending_lock = true
			with player_obj {
				x = player_hitbox_check_obj.x	
				y = player_hitbox_check_obj.y
				xvheld = x-tail_obj.current_wall.x
				yvheld = y-tail_obj.current_wall.y
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
	if x>=(startx+1000) && x<(startx+1000 + hspeed) && !yolo {
	
		ui_manager.speaking = true
		ui_manager.printing = true
	
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
		if dialogue="end" {
			current_pick = 0	
		}
	}

	if ui_manager.speaking && x>(startx+1000+hspeed) && !yolo {
		if player_obj.k_speak_p {
			ui_manager.speaking = true
			ui_manager.printing = true
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
			if dialogue="end" {
				current_pick = 0	
			}
		}	
	}

	if sword_present = false && !go && x>(startx+20000) {
		ui_manager.current_dialogue = "end"
		current_pick = 0
		x = startx+7999
		done = true
		hspeed = 0
	}
}

