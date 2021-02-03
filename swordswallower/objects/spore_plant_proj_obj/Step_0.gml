/// @description Insert description here
// You can write your code in this editor
if wall_detect(x,y) || death {
	instance_destroy(id)	
}

if state==state_spawning {
	x = lerp(x,targetx,0.1)
	y = lerp(y,targety,0.1)
	
	if point_distance(x,y,targetx,targety)<0.03 {
		state = state_player_tar
		targetx = player_obj.x
		targety = player_obj.y
		move_towards_point(player_obj.x,player_obj.y,player_speed)
	}
} else if state==state_parent_tar {
	if instance_exists(parent) {
		move_towards_point(parent.x,parent.y,parent_speed)
		if place_meeting(x,y,parent) {
			parent.hit = true
			instance_destroy(id)
		}
	} else {
		instance_destroy(id)	
	}
} else if state==state_player_tar {
	
}