/// @description Insert description here
// You can write your code in this editor
if distance_to_object(player_obj)<750 && in_camera_range_bigger(x,y) {
	if wall_raycast_checker(player_obj) {
		tracking = true
	}
}	
if !in_camera_range_bigger(x,y) {
	tracking = false	
}

if tracking {
	if shooting {
		shooting_timer++
		if shooting_timer>60 {
			henlo = instance_create_depth(
			x+cos(degtorad(lol+90))*50,
			y-sin(degtorad(lol+90))*50
			
			,depth+1,projectile_obj)
			henlo.xoff = player_obj.x-x
			henlo.yoff = player_obj.y-y
			henlo.mspeed = 10
			
			shooting_timer=0
			shooting=false
		}
		
	} else {
		shooting_timer++
		if shooting_timer>100 {
			shooting = true	
			shooting_timer=0
		}
	}
	
	
	
	if !in_camera_range_bigger(x,y) {
		tracking = false	
	}
} else {
	shooting = true	
	shooting_timer = 0
}