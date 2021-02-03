/// @description Insert description here
// You can write your code in this editor
if player_obj.tail_carry || player_obj.tail_planted {
	met = false	
}

if place_meeting(x,y,player_obj) && player_obj.zoom_timer_bool {
	destroy = true
	lel = true
}
draw_sprite_ext(plants_in_pot,0,x,y,image_xscale,image_yscale,0,c_white,1)
draw_self()

if destroy {
	instance_destroy(id)	
}