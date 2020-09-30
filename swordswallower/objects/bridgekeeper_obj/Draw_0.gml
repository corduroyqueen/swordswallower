/// @description Insert description here
// You can write your code in this editor


draw_sprite_ext(sprite_index,image_index,x,y,image_xscale*1.5,image_yscale*1.5,0,c_white,1)

if x>23620 {
	y-=60
	dialogue_start_npc_script()
	y+=60
}