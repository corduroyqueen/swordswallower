/// @description Insert description here
// You can write your code in this editor
if death {
	x = x_lock
	y = y_lock
	instance_deactivate_object(self)
}
if player_obj.tail_carry  {
	met = false	
}

if player_obj.tail_pulling {
			sword_lock = false	
		}

if angry {
	if !(collision_line(x,y,player_obj.x,player_obj.y,wall_obj,false,true)==noone 
	&& collision_line(x,y,player_obj.x,player_obj.y,door_obj,false,true)==noone 
	&& collision_line(x,y,player_obj.x,player_obj.y,break_wall_obj,false,true)==noone
	&& collision_line(x,y,player_obj.x,player_obj.y,moving_platform_obj,false,true)==noone 
	&& collision_line(x,y,player_obj.x,player_obj.y,nightdoor_obj,false,true)==noone
	&& collision_line(x,y,player_obj.x,player_obj.y,black_wall_obj,false,true)==noone) {
		angry = false
		x = x_lock
		y = y_lock
		angry_timer=0
	}
	if sword_lock {
		x = x_lock
		y = y_lock
		angry_timer = 0
		angry_timer_m = 50
	} else {
		angry_timer++
		
		
		
		if angry_timer<angry_timer_m {
			x = x_lock + random_range(-3,3)
			y = y_lock + random_range(-3,3)
		} else {
			move_towards_point(player_obj.x,player_obj.y,12)
			sprite_index = follow_guy_angry
		}
	}
} else {
	//if going_up {
	
	//	if place_meeting(x,y-vs,wall_obj) {
	//		going_up = false
	//		return
	//	} else {
	//		vspeed = -vs
	//	}
	//} else {
	
	//	if place_meeting(x,y+vs,wall_obj) {
	//		going_up = true
	//		return
	//	} else {
	//		vspeed = vs
	//	}
	//}
	
	if (abs(y-follow_camera_obj.y)<360 && (abs(x-follow_camera_obj.x)<640))
	&& collision_line(x,y,player_obj.x,player_obj.y,wall_obj,false,true)==noone 
	&& collision_line(x,y,player_obj.x,player_obj.y,door_obj,false,true)==noone 
	&& collision_line(x,y,player_obj.x,player_obj.y,break_wall_obj,false,true)==noone
	&& collision_line(x,y,player_obj.x,player_obj.y,moving_platform_obj,false,true)==noone
	&& collision_line(x,y,player_obj.x,player_obj.y,nightdoor_obj,false,true)==noone
	&& collision_line(x,y,player_obj.x,player_obj.y,black_wall_obj,false,true)==noone {
		angry = true	
	}
	
}