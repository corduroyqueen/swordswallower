/// @description Insert description here
// You can write your code in this editor
a = (900-point_distance(x,y,player_obj.x,player_obj.y))/900
a = max(0,a)

gpu_set_colorwriteenable(1,1,1,0)

draw_sprite_ext(sprite_index,0,x,y,image_xscale*1.5,image_yscale*1.5,0,image_blend,a+random_range(-0.100,0.100))
gpu_set_colorwriteenable(1,1,1,1)
if x>23620 {
	y-=60
	dialogue_start_npc_script()
	y+=60
}