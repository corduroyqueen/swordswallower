/// @description Insert description here
// You can write your code in this editor

if death {
	just_blood(tail_obj.hsp,tail_obj.vsp,0.2,30,false,sprite_width/4,sprite_height)
	
	at=instance_create_depth(x,y,depth+1,default_atk_obj)	
	at.timer =5
	at.image_xscale = 450/32
	at.image_yscale = 450/32
	at.destructive = true
	
	
	audio_manager(false,0,false,3)
	instance_destroy()
} else {
	if hp<1 {
		death = true
	}

	hsp = 0
	vsp = 0
}