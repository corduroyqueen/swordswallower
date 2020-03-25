/// @description Insert description here
// You can write your code in this editor

if show_checkpoints {
	/*
	draw_text_transformed(
		player_obj.x-5,
		player_obj.y-70,
		level1_master.available_checkpoints,1,1,0)
		*/
	
	if level1_master.available_checkpoints>0 {
		tempcolor = c_fuchsia	
	} else {
		tempcolor = c_ltgray
	}
	px = player_obj.x - player_obj.hspeed
	py = player_obj.y - player_obj.vspeed
	draw_set_color(tempcolor)
	draw_ellipse(px-8,py-52,px+8,py-42,false)
	draw_set_color(c_black)
	draw_ellipse(px-4,py-49,px+4,py-45,false)
	draw_set_color(c_white)
	
	
}
