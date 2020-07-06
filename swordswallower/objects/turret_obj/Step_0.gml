/// @description Insert description here
// You can write your code in this editor
//if distance_to_object(player_obj)<1800 && in_camera_range_bigger(x,y) {
//	if wall_raycast_checker(player_obj) {
//		tracking = true
//	}
//}	
if !in_camera_range_bigger(x,y) {
	//tracking = false	
}


if death {
	if death_timer< 1 {
		if player_obj.zoom_timer_bool {
			just_blood(player_obj.hspeed,player_obj.vspeed*2,0.3,10,false,sprite_width/4,sprite_height)
		} else {
			just_blood(tail_obj.hspeed,tail_obj.vspeed,0.2,10,false,sprite_width/4,sprite_height)	
		}
		
		audio_manager(false,0,false,3)
	}
	//if spawn {
	instance_destroy()
}


if shooting {
	shooting_timer++
	if shooting_timer>30 {
		henlo = instance_create_depth(
		x+cos(degtorad(image_angle+90))*50,
		y-sin(degtorad(image_angle+90))*50
			
		,depth+1,fire_projectile_obj)
		henlo.xoff = cos(degtorad(image_angle+90))*50
		henlo.yoff = -sin(degtorad(image_angle+90))*50
		henlo.mspeed = 6
			
		shooting_timer=0
		shooting=false
	}
		
} else {
	shooting_timer++
	if shooting_timer>timer_max {
		shooting = true	
		shooting_timer=0
	}
}
	
	
	