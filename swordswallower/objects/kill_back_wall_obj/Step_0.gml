/// @description Insert description here
// You can write your code in this editor
if sword_present {
	if init {
		swordang = tail_obj.image_angle-image_angle
		init = false	
	}
	tail_obj.x = x + lengthdir_x(dist,image_angle+ang)
	tail_obj.y = y + lengthdir_y(dist,image_angle+ang)
	tail_obj.image_angle = swordang + image_angle
	if player_obj.tail_pulling {
		sword_present = false	
	}
	
	
} else {
	init = true	
}