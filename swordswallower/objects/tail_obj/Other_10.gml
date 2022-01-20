//fuck yesuuuu


if player_obj.zoom_on {
	gpu_set_colorwriteenable(true,true,true,false)
	if player_obj.tail_pulling || player_obj.zoom_timer_bool {
		outline_start(2,global.magic_color)
	}
	
	draw_self()
	
	if player_obj.tail_pulling || player_obj.zoom_timer_bool {
		outline_end()
	}
	//draw_sprite_ext(swordsparklies_center,0,x,y,1,1,image_angle,c_white,1)
	gpu_set_colorwriteenable(true,true,true,true)
}