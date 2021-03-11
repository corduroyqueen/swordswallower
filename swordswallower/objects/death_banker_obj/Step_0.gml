/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor
if level1_master.death_num>=99 {
	dialogue_array[0] = "......."
	dialogue_array[1] = string(level1_master.death_num) + " deaths. "
	dialogue_array[2] = "I am... fascinated. Impressed. "
	dialogue_array[3] = "Take this mask. If you meet another Banker like me on your murderous path, be sure to wear it while you speak to them. "
	dialogue_array[4] = "Every time you're dredged back from death, both of us get a little richer. "
	dialogue_array[5] = "Keep going and you may leave this life with a coin or two to your name. "
	dialogue_array[6] = "end"
	
	if current_pick==4 {
		if ds_list_find_index(level1_master.hats_list,"4")<0 {
			ds_list_add(level1_master.hats_list,4)
		}
		level1_master.head_spr_i = ds_list_size(level1_master.hats_list)-1
	}
} else if level1_master.death_num<1 {
	dialogue_array[0] = "......."
	dialogue_array[1] = "Your deaths. They're " + string(level1_master.death_num) + ". "
	dialogue_array[2] = "How... disappointing. You're worthless. "
	dialogue_array[3] = "Perhaps sometime soon you will gain some worth. "
	dialogue_array[4] = "end"
} else {
	dialogue_array[0] = "......."
	dialogue_array[1] = "Your deaths. They're " + string(level1_master.death_num) + ". "
	dialogue_array[2] = "When you've seen death 99 times, you will speak to me again. "
	dialogue_array[3] = "There are always more to come. "
	dialogue_array[4] = "end"
}
if point_distance(x,y,player_obj.camx+640,player_obj.camy+360)<1000 {
	if !audio_is_playing(whispers) {
		audio_play_sound_on(whisp_emitter,whispers,true,0)
	}
	audio_sound_gain(whispers,1,0)
	audio_emitter_gain(whisp_emitter,
	clamp(0,abs(1000- point_distance(x,y,player_obj.camx+640,player_obj.camy+360))/1000,1000)/3
			
	)
			
	audio_emitter_position(whisp_emitter,
	mean(x,player_obj.x,player_obj.x),
	mean(x,player_obj.y,player_obj.y),
	10)
} else {
	audio_sound_set_track_position(whispers,choose(0,5,7,10))
	audio_emitter_gain(whisp_emitter,0)
}

if abs(x-player_obj.x)<300 && player_obj.y>2375 && player_obj.y<3600 {
	player_present = true
} else {
	player_present = false
}
y = starty

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
if player_present {
	with ui_manager {
		friendly_x = other.x
		friendly_y = other.y - other.sprite_height/2 - 40	
		view_xview = friendly_x-view_wview/2
	}
	if player_obj.k_speak_p {
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
				character_x=other.x
			}
			
			dialogue = dialogue_array[current_pick]
			current_pick++
			ui_manager.current_dialogue = dialogue
		} 
			
		
		if dialogue=="end" {
			current_pick = 0	
			//spk_bool = false
		}
	}
}
if plf==true && player_present = false {
	ui_manager.current_dialogue = "end"
	current_pick = 0
	if mapguy {
		level1_master.getmap = true	
	}
}

image_xscale = sign(x-player_obj.x)

plf = player_present