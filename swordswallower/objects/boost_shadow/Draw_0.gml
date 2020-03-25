/// @description Insert description here
// You can write your code in this editor


image_xscale = 1.15
image_yscale = 1.15
image_alpha -= 0.05

draw_sprite_ext(player_cloud,0,x,y,1,1,0,c_white,image_alpha)

if image_alpha<=0 {
	instance_destroy()	
}