sword_spr = sword5
if tail_planted {

	hey = instance_create_depth(tail_obj.x,tail_obj.y,0,snakeheaddead_obj)
	hey.hspeed = 0
	hey.vspeed = 0
	hey.sprite_index = sword_spr
	hey.spinspeed = 0
	hey.image_angle = tail_obj.image_angle
}


if tail_carry {

	hey = instance_create_depth(x,y-64,0,snakeheaddead_obj)
	hey.hspeed = hspeed*1.5
	hey.vspeed = random_range(-2,-6)
	hey.sprite_index = sword_spr
	hey.spinspeed = -sign(hspeed) * 50
	hey.image_angle = tail_obj.image_angle
}

if tail_throwing {
	hey = instance_create_depth(tail_obj.x-tail_obj.hspeed,tail_obj.y-tail_obj.vspeed,0,snakeheaddead_obj)
	hey.hspeed = tail_obj.hspeed
	hey.vspeed = tail_obj.vspeed
	hey.sprite_index = sword_spr
	hey.spinspeed = -sign(tail_obj.hspeed) * 100
	hey.image_angle = tail_obj.image_angle	
	hey.sword_bool = true
}

if tail_pulling {
	hey = instance_create_depth(tail_obj.x+tail_obj.hspeed,tail_obj.y+tail_obj.vspeed,0,snakeheaddead_obj)
	hey.hspeed = tail_obj.hspeed
	hey.vspeed = tail_obj.vspeed
	hey.sprite_index = sword_spr
	hey.spinspeed = -sign(tail_obj.hspeed) * 100
	hey.image_angle = tail_obj.image_angle	
	hey.sword_bool = true
}


