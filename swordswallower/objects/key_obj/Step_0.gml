/// @description Insert description here
// You can write your code in this editor
xpreva = x
if flying_away {
	x += dcos(ang) * 20
	y -= dsin(ang) * 20
	
	if !in_camera_range_bigger(x,y) {
		instance_destroy()
	}
	return
}
if unlocking {
	
	move_towards_point(target.x,target.y,20)
	if point_distance(x,y,target.x,target.y)<25 {
		
		with target {
			event_user(1)
		}
		audio_play_sound(door_unlock_2,0,false)
		target.closed = false
		flying_away = true
		depth = -2900
		if player_obj.tail_planted && tail_obj.current_obj==target.id {
			player_obj.tail_planted = false
			player_obj.tail_pulling = true
		}
		ang = random_range(0,180)
		hspeed=0
		vspeed=0
		
	}
	return;
}


if following {
	if start {
		x = checkpoint_manager.x - 10
		y = checkpoint_manager.y - 10
		player_obj.xpreva2 = checkpoint_manager.x -9
		player_obj.ypreva2 = checkpoint_manager.y -32
		start = false
	}
	if point_distance(x,y,player_obj.xpreva2,player_obj.ypreva2)<1280 {
		x = lerp(x,player_obj.xpreva2,random_range(0.03,0.07))	
		y = lerp(y,player_obj.ypreva2-32,random_range(0.01,0.05))
	}
	
	if point_distance(x,y,player_obj.x,player_obj.y)>1280 {
		x = player_obj.x-9
		y = player_obj.y-9
	}
	
	image_speed=7
	
	//x = player_obj.x+2+player_obj.hsp
	//y = player_obj.y+2+player_obj.vsp/2
	
}

