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
	draw_set_font(font2)
	draw_text(19,89,"fps  " + string(fps))	
	draw_text(19,120,"real fps  " + string(fps_real))	
	draw_text(19,151,"active instances  " + string(instance_count))
	draw_text(19,182,"d time  " + string(delta_time))
	//gpu_get_state()
}

if fps>=52 && fps_check_enable {
	fps_timer=0
}
if (fps<52 || !fps_check_enable) && level1_master.fps_check_bool && !player_obj.intro { 
	fps_timer++
	if fps_timer>500  && !instance_exists(title_screen_obj) {
		draw_set_font(font2)
		draw_set_color(c_black)
		draw_set_alpha(0.5)
		draw_rectangle(0,0,1920,1080,false)
		draw_set_color(c_white)
		draw_set_alpha(1)
		draw_text(300,300,"hey! we noticed the game is running a little slow.")
		draw_text(300,350,"this is almost always because the game isn't using your graphics card.")
		draw_text(300,400,"to fix this, go to settings, system, display, scroll down and click 'graphics settings'")
		draw_text(300,450,"then click 'browse,' find the game wherever you've installed it, click 'options' and select 'high performance'.")
		draw_text(300,500,"other common sources: playing in windowed ('G' key to toggle), laptop is unplugged, bloom lighting is too much ('esc' to toggle)")
		draw_text(300,550,"we aim to have this fixed in the full release. thank you for your patience.")
		draw_text(300,600,"press 8 to close this. have fun and thank you for playing!")
		if keyboard_check_pressed(ord("8")) {
			level1_master.fps_check_bool = false
		}
		fps_check_enable = false
		
	}
}
