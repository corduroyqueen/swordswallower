obj = argument0


if player_obj.tail_throwing {
	player_obj.tail_throwing = false
	//player_obj.tail_pulling = false
	player_obj.tail_planted = true
	
	planted=true
			
	obj.sword_present = true

	
	//obj.hspeed = 0
	//obj.vspeed = 0
	
	obj.sword_hold_x = (x-obj.x)
	obj.sword_hold_y = (y-obj.y)
	
	tail_obj.image_angle = point_direction(player_obj.start_throw_x,player_obj.start_throw_y,x,y) - 90
	obj.sword_ang_temp = image_angle
	
	obj.met = true
	
	
	
} else if player_obj.tail_pulling {
	
	player_obj.tail_pulling = false
	//player_obj.tail_pulling = false
	player_obj.tail_planted = true
	
	pull_timer = 0 
	
	planted=true
			
	obj.sword_present = true

	
	//obj.hspeed = 0
	//obj.vspeed = 0
	
	obj.sword_hold_x = (x-obj.x)
	obj.sword_hold_y = (y-obj.y)
	
	tail_obj.image_angle = point_direction(player_obj.start_throw_x,player_obj.start_throw_y,x,y) - 90
	obj.sword_ang_temp = image_angle
	
	obj.met = true
	
	
}