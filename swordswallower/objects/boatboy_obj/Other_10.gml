//fuck yes


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