/// @description Insert description here
// You can write your code in this editor

//if abs(player_obj.x-x)<(sprite_width*image_xscale*0.5) &&
//abs(player_obj.y-y)<(sprite_height*image_yscale*0.5) {
//	instance_destroy()
//}

if player_obj.x>x &&
player_obj.x<(x+64*image_xscale) && 
player_obj.y>y &&
player_obj.y<(y+64*image_yscale) {
	instance_destroy()	
}