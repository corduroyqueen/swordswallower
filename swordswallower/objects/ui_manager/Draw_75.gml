/// @description Insert description here
// You can write your code in this editor
with intro_handler {
	
	if intro_handler.intro_timer>=200 &&intro_handler.intro_timer<500 {
		draw_set_alpha(1)
		draw_sprite(gameby,0,960,400)
		draw_sprite(names[names_f],0,960,500)
		draw_sprite(and_s,0,960,590)
		draw_sprite(names[1-names_f],0,960,700)
		draw_set_alpha(alpha)
	}
	
}
draw_set_font(font2)
var sec=0
if level1_master.end_time>0 {
	sec = level1_master.end_time / 1000
	
} else if level1_master.start_time>0 {
	sec = (current_time - level1_master.start_time) / 1000
}

draw_text(10,10,string_replace_all(string_format(floor(sec/3600),2,0)," ","0"))
	draw_text(50,10,":")
	draw_text(55,10,string_replace_all(string_format((floor(sec/60)) - (floor(sec/3600) * 3600),2,0)," ","0"))
	draw_text(95,10,":")
	draw_text(100,10,string_replace_all(string_format(floor(sec - (floor(sec/60) * 60)),2,0)," ","0"))
	
	var sec2 = (sec - (floor(sec/60) * 60)) - floor(sec - (floor(sec/60) * 60))
	//draw_text(130,10,string_format(floor(sec2 - (floor(sec2/60) * 60)),2,0))
	draw_text(140,10,":")
	draw_text(145,10,string_replace_all(string_format(floor(sec2 * 60),2,0)," ","0"))
	
if keyboard_check_pressed(ord("T")) game_restart();
player_start_map()

/*
if level1_master.dev && !keyboard_check_pressed(ord("V")) {
	draw_text(19,89,"fps  " + string(fps))	
	draw_text(19,120,"real fps  " + string(fps_real))	
	draw_text(19,151,"active instances  " + string(instance_count))
	draw_text(19,182,"d time  " + string(delta_time))
	//gpu_get_state()
}