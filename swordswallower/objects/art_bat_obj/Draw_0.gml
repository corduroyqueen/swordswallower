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
	
	if in_camera_range_bigger(x,y) {
		var cx = player_obj.camx + player_obj.cam_width_h
		var cy = player_obj.camy + player_obj.cam_height_h
	
		s_posx = mean(cx,cx,cx,cx,cx,cx,x)
		s_posy = mean(cy,cy,cy,cy,cy,cy,y)
		
		audio_emitter_position(emit,s_posx,s_posy,0)
	
	}

}
gpu_set_colorwriteenable(1,1,1,1)