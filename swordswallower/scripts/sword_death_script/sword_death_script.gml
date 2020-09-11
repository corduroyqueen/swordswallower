sword_spr = newsword_center
if tail_planted {

	hey = instance_create_depth(tail_obj.x,tail_obj.y,0,snakeheaddead_obj)
	hey.hsp = 0
	hey.vsp = 0
	hey.sprite_index = sword_spr
	hey.spinspeed = 0
	hey.image_angle = tail_obj.image_angle
	
}


if tail_carry {

	hey = instance_create_depth(x,y-64,0,snakeheaddead_obj)
	hey.hsp = hsp*1.5
	hey.vsp = random_range(-2,-6)
	hey.sprite_index = sword_spr
	hey.spinspeed = -sign(hsp) * 50
	hey.image_angle = tail_obj.image_angle
}

if tail_throwing {
	hey = instance_create_depth(tail_obj.x-tail_obj.hsp,tail_obj.y-tail_obj.vsp,0,snakeheaddead_obj)
	hey.hsp = tail_obj.hsp
	hey.vsp = tail_obj.vsp
	hey.sprite_index = sword_spr
	hey.spinspeed = -sign(tail_obj.hsp) * 100
	hey.image_angle = tail_obj.image_angle	
	hey.sword_bool = true
}

if tail_pulling {
	hey = instance_create_depth(tail_obj.x+tail_obj.hsp,tail_obj.y+tail_obj.vsp,0,snakeheaddead_obj)
	hey.hsp = tail_obj.hsp
	hey.vsp = tail_obj.vsp
	hey.sprite_index = sword_spr
	hey.spinspeed = -sign(tail_obj.hsp) * 100
	hey.image_angle = tail_obj.image_angle	
	hey.sword_bool = true
}

hey.blood_color = blood_color
