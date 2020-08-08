/// @description Insert description here
// You can write your code in this editor
if player_obj.tail_carry || player_obj.tail_planted {
	met = false
}

if idle {
	if distance_to_object(player_obj)<1000 && in_camera_range(x,y) {
		//sdm("ok?")
		if wall_raycast_checker(player_obj) {
			///sdm("ok2???")
			idle = false
			
			targetx = x+(600+random_range(-100,100))*seek_dir
			targety = y+random_range(-100,100)
			if !collision_line(x,y,targetx,targety,all,0,true) {
				traveling = true
			} else {
				ok = collision_line_first(x,y,targetx,targety,all,0,true)
				targetx = ok[1]
				targety = ok[2]
			}
			traveling = true
		}
	}
	return	
}



if hit {
	
	if player_obj.zoom_timer_bool {
		just_blood(player_obj.hsp,player_obj.vsp*2,0.3,10,false,sprite_width/4,sprite_height)
	} else {
		just_blood(tail_obj.hsp,tail_obj.vsp,0.2,10,false,sprite_width/4,sprite_height)	
	}
	//audio_stop_sound(s_fly_buzz)
		
	audio_sound_pitch(eye_scream,random_range(0.6,2))
	audio_play_sound_at(eye_scream,x,y,0,0,0,0,false,0)
		
	audio_manager(false,0,false,3)
	instance_destroy()
	
} else if charging {
	hsp = lerp(hsp,0,0.05)
	vsp = lerp(vsp,0,0.05)
	tear_timer++
	if tear_timer>tear_timer_spawn {
		tear_timer=0
		//instance_create_depth(x,y+32,depth+1,tear_obj)
		spawn_projectiles = true
		charging = false
		charge_state_t_m = 40 + random_range(-20,20)
	}	
} else if dodging {
	
	if dodge_init {
		ang = arctan(tail_obj.vsp/tail_obj.hsp) + pi/2
		tempx = cos(ang) * sign(tail_obj.hsp)
		tempy = sin(ang)  * sign(-tail_obj.hsp)
		
		
		//var tx= y/(tail_obj.vsp/tail_obj.hsp)
		pol = sign(x-player_obj.tail_dest_x)
		
		hsp = tempx * dspeed * pol
		vsp = tempy * dspeed * -sign(tempy) * 0.25
		
		dodge_init = false
	}
	
	speed = lerp(speed,0,0.25)
	if abs(speed)<2 {
		traveling = true
		dodging = false
		seek_dir = sign(hsp)
	}
} else if traveling {
	
	move_towards_point(targetx,targety,mspeed)
	if point_distance(x,y,targetx,targety)<60 {
		
		if seek_dir==1 {
			seek_dir=-1	
		} else {
			seek_dir=1
		}
		
		targetx = x+(600+random_range(-100,100))*seek_dir
		targety = y+random_range(-100,100)
		if !collision_line(x,y,targetx,targety,all,0,true) {
			traveling = true
		} else {
			ok = collision_line_first(x,y,targetx,targety,all,0,true)
			targetx = ok[1]
			targety = ok[2]
		}
	}
	
	charge_state_t++
	if charge_state_t>charge_state_t_m {
		charging = true
		charge_state_t = 0
		charge_state_t_m = 40 + random_range(-20,20)
	}
	
	
	//dodge_init = true
	//if player_obj.tail_throwing {
	//	var tpx = image_xscale
	//	image_xscale*=2
	//	with tail_obj {
	//		if collision_line(x,y,x+hsp*4,y+vsp*4,other,false,true) {
	//			other.dodging = true
	//			other.tear_timer=100
	//			other.tear_timer_spawn=100
	//		}
	//	}
	//	image_xscale = tpx
	//}
	
} 




if spawn_projectiles {
	
	var ang = point_direction(x,y,player_obj.x,player_obj.y)
	hallo = instance_create_depth(
	x+cos(degtorad(ang))*5,
	y+sin(degtorad(ang))*5,
	depth+1,
	tear_nograv_obj)
	
	hallo.xoff = cos(degtorad(ang))
	hallo.yoff = -sin(degtorad(ang))
	hallo.mspeed = 25
	hallo.sprite_index = thirsty_ghoul_proj_t
	
	
	spawn_projectiles = false
}

