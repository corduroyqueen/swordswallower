//fuck yes


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
	times_spoken++
}