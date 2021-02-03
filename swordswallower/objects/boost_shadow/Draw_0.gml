/// @description Insert description here
// You can write your code in this editor


image_alpha -= 0.05
gpu_set_colorwriteenable(true,true,true,false)
image_xscale = sign(player_obj.hsp)
image_yscale = -sign(player_obj.hsp)


draw_sprite_ext(spr_mc_dash,0,x,y,1,image_yscale,image_angle+180,c_white,image_alpha)
gpu_set_colorwriteenable(true,true,true,true)

if image_alpha<=0 {
	instance_destroy(id)	
}