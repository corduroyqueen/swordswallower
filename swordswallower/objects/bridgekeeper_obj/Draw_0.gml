/// @description Insert description here
// You can write your code in this editor

gpu_set_colorwriteenable(1,1,1,0)


draw_sprite_ext(sprite_index,image_index,x,y,image_xscale,image_yscale,0,c_white,1)
gpu_set_colorwriteenable(1,1,1,1)
if x>23620 {
	//y-=60
	dialogue_start_npc_script2(x+90,y-30)
	//y+=60
}