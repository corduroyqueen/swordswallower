//fuck yes

gpu_set_colorwriteenable(true,true,true,false)
if id==st_bridge_bridge {
	draw_sprite(spr_dropbridge,0,x,y)
} else {
	draw_self()
}
gpu_set_colorwriteenable(true,true,true,true)