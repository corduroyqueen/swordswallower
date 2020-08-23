/// @description Insert description here
// You can write your code in this editor

if level1_master.dev {
	if keyboard_check_pressed(ord("C")) {
		recording = !recording	
	
		if recording {
			gif = gif_open(1920,1080)
		} else {
			gif_save(gif, "gif_" + string(current_month) + "_" + string(current_day) + "_" + string(current_hour) + "_" + string(current_minute) + ".gif")
		}
	}
	if keyboard_check_pressed(ord("V")) {
		screen_save("screen_" + string(current_month) + "_" + string(current_day) + "_" + string(current_hour) + "_" + string(current_minute) + ".png")
	}
	if recording {
	
		gif_add_surface(gif,GUI,2)	
	
	}
}

