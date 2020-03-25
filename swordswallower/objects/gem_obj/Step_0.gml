/// @description Insert description here
// You can write your code in this editor
if player_obj.tail_carry {
	active = true	
}

if active {
	//image_alpha = lerp(image_alpha,1,0.2)
	sprite_index = greenfire
} else {
	//image_alpha = lerp(image_alpha,0,0.7)
	sprite_index = greenfireout
}