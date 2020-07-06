/// @description Insert description here
// You can write your code in this editor

if death {
	just_blood(tail_obj.hspeed,tail_obj.vspeed,0.2,30,false,sprite_width/4,sprite_height)
	
	at=instance_create_depth(x,y,depth+1,default_atk_obj)	
	at.timer = 5
	at.image_xscale = 450/32
	at.image_yscale = 450/32
	at.destructive = true
	
	
	audio_manager(false,0,false,3)
	instance_destroy()
} else {

	if hrev {
		hspeed = hgo 
	
	} else {
		hspeed = -hgo 
	}

	if vrev {
		vspeed = vgo 
	
	} else {
		vspeed = -vgo 
	}
	image_xscale = 1 * sign(hspeed)
	if wall_checker_enemy(x+hspeed*2,y) {
		hrev = !hrev	
	}
	if wall_checker_enemy(x,y+vspeed*2) {
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
	hspeed = clamp(hspeed,-maxspeed,maxspeed)
	vspeed = clamp(vspeed,-maxspeed,maxspeed)
}