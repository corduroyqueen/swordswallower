//fuck yes

if player_obj.tail_pulling || player_obj.zoom_timer_bool {
	outline_start(2,global.magic_color)
}
gpu_set_colorwriteenable(true,true,true,false)
draw_self()
gpu_set_colorwriteenable(true,true,true,true)
if player_obj.tail_pulling || player_obj.zoom_timer_bool {
	outline_end()
}