/// @description Insert description here
// You can write your code in this editor
if state==state_knockback {
	image_blend = c_red
	draw_sprite_ext(charger_open,loltimer,x+random_range(-5,5),y+random_range(-2,2),image_xscale,1,0,c_red,1)
	loltimer++
	if loltimer>1 {
		loltimer=0	
	}
} else if charging && state==state_chasing {
	image_blend = c_white
	draw_sprite_ext(charger_fly,0,x,y,image_xscale,1,0,c_white,1)
} else if !charging && state==state_chasing {
	image_blend = c_white
	
	draw_sprite_ext(charger_fly,0,x+random_range(-7,7),y,image_xscale,1,0,c_white,1)
} else { 
	image_blend = c_white
	draw_self()
	loltimer=0
}