/// @description Insert description here
// You can write your code in this editor

if player_obj.tail_carry || player_obj.tail_planted {
	met = false	
}

draw_sprite_part(sprite_index,image_index,xx,yy,w,h,x,y-sprite_get_yoffset(sprite_index)+yy)

if destroy {
	instance_destroy()	
}