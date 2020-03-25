/// @description Insert description here
// You can write your code in this editor

if keyboard_check_pressed(ord("C")) {
	recording = !recording	
	
	if recording {
		gif = gif_open(1280,720)
	} else {
		gif_save(gif, "capture2.gif")
	}
}

if recording {
	
	gif_add_surface(gif,GUI,2)	
	
}
