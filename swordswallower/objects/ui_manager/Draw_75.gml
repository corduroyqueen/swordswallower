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

player_start_map()
if !player_obj.death && !player_obj.ending_lock && !instance_exists(title_screen_obj) && !keyboard_check_pressed(ord("V")) {
	draw_set_color(c_black)
	draw_circle(mouse_ui_x-player_obj.camx,mouse_ui_y-player_obj.camy,10,false)
	draw_set_color(c_white)
	draw_circle(mouse_ui_x-player_obj.camx,mouse_ui_y-player_obj.camy,9,false)
}

if level1_master.dev && !keyboard_check_pressed(ord("V")) {
	draw_set_font(lato)
	draw_text(19,89,"fps  " + string(fps))	
	draw_text(19,120,"real fps  " + string(fps_real))	
	draw_text(19,151,"active instances  " + string(instance_count))
	draw_text(19,182,"d time  " + string(delta_time))
	//gpu_get_state()
}