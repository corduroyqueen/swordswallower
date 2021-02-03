//fuck yes
gpu_set_colorwriteenable(true,true,true,false)
if player_obj.tail_carry || player_obj.tail_planted {
	met = false	
}

draw_sprite_part(sprite_index,image_index,xx,yy,w,h,x,y)

if destroy {
	instance_destroy(id)	
}
gpu_set_colorwriteenable(true,true,true,true)