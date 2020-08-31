/// @description Insert description here
// You can write your code in this editor
if player_obj.tail_carry || player_obj.tail_planted {
	met = false	
}

if place_meeting(x,y,player_obj) && player_obj.zoom_timer_bool {
	destroy = true
	lel = true
}
draw_sprite_ext(plantfg,0,x,y,image_xscale,image_yscale,0,c_white,1)
draw_self()
draw_sprite_ext(plantbg,0,x,y,image_xscale,image_yscale,0,c_white,1)
if destroy {
	instance_destroy()	
}