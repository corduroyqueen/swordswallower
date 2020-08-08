/// @description Insert description here
// You can write your code in this editor

if mouse_check_button_pressed(mb_right) && player_obj.tail_carry {
	dest_x = global.mousepx
	dest_y = global.mousepy
}

if player_obj.tail_pulling || player_obj.tail_throwing {
	sword_present = false	
}

if distance_to_point(dest_x,dest_y)>1 {
	
	going = true
}

if going {
	x = lerp(x,dest_x,0.1)
	y = lerp(y,dest_y,0.1)	
}

if place_meeting(x,y+1,wall_obj) {
	grounded = true
} else {
	grounded = false
}

if player_obj.tail_carry {
	met = false	
}

if sword_present {
	var lmao
	if facing_right { lmao = -1 } else { lmao = 1 }
	
	
	tail_obj.hspeed = 0
	tail_obj.vspeed = 0
	tail_obj.y = y + sword_hold_y
	tail_obj.x = x + (sword_hold_x * lmao)
	tail_obj.inside_flier = true
	tail_obj.current_obj = self
	//image_xscale = lmao
	
	var facingdir
	
	particlect++
	
	if particlect==1 {
		particle = instance_create_depth(x + (sword_hold_x*lmao),y+sword_hold_y,-1,blood_obj)
	
		var scalevar = random_range(0.2,2)
		particle.image_xscale = scalevar
		particle.image_yscale = scalevar
		particle.hspeed = random_range(0.01,1) * lmao + hspeed
		particle.vspeed = random_range(0.01,1) * lmao + vspeed
		particlect = false
	} 
	if particlect>120{
		particlect=0	
	}
	
	//if point_distance(x,y,player_obj.x,player_obj.y)<30 && player_obj.zoom_timer_bool {
		
	//	player_obj.hsp*=0.5
	//	player_obj.vsp*=0.5
		
	//	reset_zoom()
	//	reset_intangibility()
	//	player_obj.tail_planted = false
	//	player_obj.tail_pulling = true
	//	sword_present = false
	//}
	
	
	
}