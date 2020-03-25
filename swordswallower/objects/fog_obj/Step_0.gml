/// @description Insert description here
// You can write your code in this editor

if abs(player_obj.x-x)<(sprite_width*0.5) &&
abs(player_obj.y-y)<(sprite_height*0.5) {
	instance_destroy()
}

//if player_obj.x>(x-64*image_xscale*0.5) &&
//player_obj.x<(x+64*image_xscale*0.5) && 
//player_obj.y>(x-64*image_yscale*0.5) &&
//player_obj.y<(x+64*image_yscale*0.5) {
//	instance_destroy()	
//}