/// @description Insert description here
// You can write your code in this editor


if level1_master.dev && !keyboard_check_pressed(ord("V")) {
	draw_text(19,89,"fps  " + string(fps))	
	draw_text(19,120,"real fps  " + string(fps_real))	
	draw_text(19,151,"active instances  " + string(instance_count))
	draw_text(19,182,"d time  " + string(delta_time))
	//gpu_get_state()
}