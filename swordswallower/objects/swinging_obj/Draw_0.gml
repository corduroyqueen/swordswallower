/// @description Insert description here
// You can write your code in this editor
if player_obj.tail_planted && !lastframeplanted {
	depreciation = 25	
}
if depreciation>0.1 {
	depreciation = lerp(depreciation,0,0.05)
	rotation = 1 * depreciation * cos(sqrt(0.1/500)*current_time)
}

draw_sprite_ext(sprite,0,x,y,1,1,rotation,c_white,1);




lastframeplanted = player_obj.tail_planted