/// @description Insert description here
// You can write your code in this editor

if death {
	just_blood(tail_obj.hsp,tail_obj.vsp,0.2,30,false,sprite_width/4,sprite_height)
	
	at=instance_create_depth(x,y,depth+1,default_atk_obj)	
	at.timer = 5
	at.image_xscale = 450/32
	at.image_yscale = 450/32
	at.destructive = true
	
	
	audio_manager(false,0,false,3)
	instance_destroy()
} else {

	if hrev {
		hsp = hgo 
	
	} else {
		hsp = -hgo 
	}

	if vrev {
		vsp = vgo 
	
	} else {
		vsp = -vgo 
	}
	image_xscale = 1 * sign(hsp)
	if wall_detect(x+hsp*2,y) {
		hrev = !hrev	
	}
	if wall_detect(x,y+vsp*2) {
		vrev = !vrev	
	}

	
	if hp<1 {
		death = true
	}
	if point_distance(x,y,tail_obj.x,tail_obj.y)>100 || player_obj.tail_planted {
		met = false	
	}
	if !place_meeting(x,y,nucrab_obj) {
		inv_hit = false	
	}
	hsp = clamp(hsp,-maxspeed,maxspeed)
	vsp = clamp(vsp,-maxspeed,maxspeed)
}