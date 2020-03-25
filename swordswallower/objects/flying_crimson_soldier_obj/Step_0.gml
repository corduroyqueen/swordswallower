/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if player_detected {
	
	vspeed-=(0.5 + random_range(-0.3,0.3))
	if preparing_sniper {
		preparing_sniper_timer++
		if preparing_sniper_timer>preparing_sniper_timer_m {
			if !(point_distance(x,y,player_obj.x,player_obj.y)<200 &&
			player_obj.zoom_timer_bool) {
				preparing_sniper = false
				preparing_sniper_timer=0
				sniping_timer = 0
				targetx = player_obj.x
				targety = player_obj.y
			}
		}
		floatspeed = floatspeed_reloading
	} else {
		sniping_timer++
		targetx = lerp(targetx,player_obj.x+player_obj.hspeed*3,0.1)
		targety = lerp(targety,player_obj.y+player_obj.vspeed*3,0.1)
		if sniping_timer>sniping_timer_m {
			shoot = true
			sniping_timer=0
			preparing_sniper = true
		}
		floatspeed = floatspeed_aiming
	}
	
	if go_home {
		hspeed = lerp(hspeed,floatspeed,0.1)	
	} else {
		hspeed = lerp(hspeed,-floatspeed,0.1)	
	}
	
	if wall_checker_enemy(x+4,y) {
		go_home = false	
	}
	if wall_checker_enemy(x-4,y) {
		go_home = true
	}
	
	if shoot {
		bullet = instance_create_depth(x,y,depth+1,bullet_obj)
		bullet.endx = targetx
		bullet.endy = targety
		shoot = false
	}
} else {
	preparing_sniper = false
	
	if go_home {
		if point_distance(x,y,startx,starty)>idle_speed + 0.1 {
			move_towards_point(startx,starty,idle_speed)
		} else {
			move_towards_point(startx,starty,idle_speed)
			sniping_timer++
			if sniping_timer>100 {
				go_home = false
				ang = random_range(0,360)
				idle_targetx = startx + cos(degtorad(ang))*70
				idle_targety = starty + sin(degtorad(ang))*70
				sniping_timer=0
			}
		}
		
	} else {
		if point_distance(x,y,idle_targetx,idle_targety)>idle_speed + 0.1 {
			move_towards_point(idle_targetx,idle_targety,idle_speed)
		} else {
			move_towards_point(idle_targetx,idle_targety,idle_speed)
			sniping_timer++
			if sniping_timer>100 {
				go_home = true
				sniping_timer=0
			}
		}
	}
}

if !wall_checker(x,y+10) {
	vspeed+=0.5
}
if player_obj.grounded {
	if y>player_obj.y-50 {
		vspeed=lerp(vspeed,-3,0.15)	
	}
}