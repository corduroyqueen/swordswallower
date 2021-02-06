event_user(0)
gpu_set_colorwriteenable(true,true,true,false)
if docile {
	var a = max(0,level1_master.boss_intro_timer-120)/80
	draw_set_alpha(1-a)
	draw_set_color(c_black)
	draw_rectangle(x-1500,y-1000,x+500,y+1000,false)
	draw_set_alpha(1)
	draw_set_color(c_white)
}
gpu_set_colorwriteenable(true,true,true,1)