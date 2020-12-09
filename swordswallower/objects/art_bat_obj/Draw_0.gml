//fuck yes
gpu_set_colorwriteenable(1,1,1,0)
if idle {
	draw_sprite(spr_batidle,0,x,y)
	event_user(0)
} else {
	hsp = lerp(hsp,15 * -sign(image_xscale) * random_range(0.5,1.5) ,0.5)
	vsp = lerp(vsp,-10* random_range(0.5,1.5),0.05)
	x+=hsp
	y+=vsp
	draw_sprite(spr_bat_anim,image_index,x,y)
}
gpu_set_colorwriteenable(1,1,1,1)