/// @description Insert description here
// You can write your code in this editor

if death {
	just_blood(tail_obj.hsp,tail_obj.vsp,0.2,30,false,sprite_width/4,sprite_height)
	
	audio_manager(false,0,false,3)
	instance_destroy(id)
} else {
	if hp==1 {
		mult = 1.5	
		image_blend = c_red
	} else {
		mult = 1	
	}
	if hrev {
		hsp = hgo * mult
	
	} else {
		hsp = -hgo * mult
	}

	if vrev {
		vsp = vgo * mult
	
	} else {
		vsp = -vgo * mult
	}
	image_xscale = 0.75 * sign(hsp)
	if wall_detect(x+hsp*2,y) {
		hrev = !hrev	
	}
	if wall_detect(x,y+vsp*2) {
		vrev = !vrev	
	}

	if hp==1 {
		particlect++
	
		if particlect==1 {
			particle = instance_create_depth(x,y,100,blood_obj)
	
			var scalevar = random_range(0.3,1)
			particle.image_xscale = scalevar
			particle.image_yscale = scalevar
			particle.hsp = random_range(0.01,1)
			particle.vsp = random_range(0.01,1) 
			particlect = false
		} 
		if particlect>20{
			particlect=0	
		}
	} else if hp<1 {
		death = true
	}
	if point_distance(x,y,tail_obj.x,tail_obj.y)>100 || player_obj.tail_planted {
		met = false	
	}
	if !place_meeting(x,y,nucrab_obj) {
		inv_hit = false	
	}
	hsp = clamp(hsp,-maxspeed*mult,maxspeed*mult)
	vsp = clamp(vsp,-maxspeed*mult,maxspeed*mult)
}