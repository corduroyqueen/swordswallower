//fuck yesuuuu


if player_obj.zoom_on {
	if player_obj.tail_pulling || player_obj.zoom_timer_bool {
		outline_start(2,global.magic_color)
	}
	gpu_set_colorwriteenable(true,true,true,false)
	draw_self()
	gpu_set_colorwriteenable(true,true,true,true)
	if player_obj.tail_pulling || player_obj.zoom_timer_bool {
		outline_end()
	}
	draw_sprite_ext(swordsparklies_center,0,x,y,1,1,image_angle,c_white,1)
}