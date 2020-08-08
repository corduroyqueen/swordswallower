var gogo
if tail_zooming {
	zoom_ctdn--
	hsp = 0
	vsp = 0
	
	if zoom_ctdn<=0 {
		zspeed = zspeed_normal
		grav_boost = .15//havent changed from size up
		player_obj.camera_shake_direc = true
		player_obj.cam_ang = degtorad(point_direction(0,0,player_obj.hsp,player_obj.vsp))
		player_obj.shake_dir = 25
		
		if tail_obj.inside_flier {
			
			
			
			if instance_exists(tail_obj.current_obj) {
				tail_dest_x = tail_obj.current_obj.x
				tail_dest_y = tail_obj.current_obj.y
			}
			
			
			if zoom_timer_bool && distance_to_object(tail_obj.current_obj)<zoom_dist {
				zspeed = zspeed_enemy
				grav_boost = 0
			}
		}
		
		
		
		//if zoom_timer<=0 {
			
		//	//zoom_speedx = hspeed
		//	//zoom_speedy = vspeed
			
		//	//hspeed = oldspeedx
		//	//vspeed = oldspeedy
		//} 
	
		//dot_product(oldspeedx,oldspeedy,zoom_speedx,zoom_speedy)
	
		//hspeed = zoom_speedx
		//vspeed = zoom_speedy
		
		var ztempspeed = zspeed
		
		if grounded {
			if instance_place(x,y+1,wall_obj)==tail_obj.current_wall {
				tail_dest_y=y	
				ztempspeed=abs(x-player_hitbox_check_obj.x)/5
				ztempspeed = clamp(ztempspeed,-zspeed,zspeed)
			}
		}
		
		//sdm(point_distance(x,y,tail_dest_x,tail_dest_y))
		if point_distance(x,y,tail_dest_x,tail_dest_y)>2 {
			//move_towards_point(tail_dest_x,tail_dest_y,ztempspeed)
			hsp = cos(degtorad(point_direction(x,y,tail_dest_x,tail_dest_y))) * ztempspeed
			vsp = -sin(degtorad(point_direction(x,y,tail_dest_x,tail_dest_y))) * ztempspeed
		} else {
				
		}
		
		speed_temp = get_speed()
		zoom_timer_bool = true
		zoom_timer = 0
	
		tail_zooming = false
		//if !tail_held {
			//tail_pulling = true
		//}
		//zoom_ctdn = 0
		zoom_pause = false
		
		
	}
	
	
}

if zoom_timer_bool {
	
	zooming_particles()
	boosting_collision_check = true
	lerpvar = 0.1
	
	//if distance_to_object(player_hitbox_check_obj)>100{
	//	lerpvar = 0
	//} else if distance_to_object(player_hitbox_check_obj)>70{
	//	lerpvar = 0.1
	//} else if distance_to_object(player_hitbox_check_obj)>40{
	//	lerpvar = 0.2
	//} else if distance_to_object(player_hitbox_check_obj)>15{
	//	lerpvar = 0.3
	//} else {
	//	lerpvar = 0.3	
	//}
	
	//if mouse_check_button_released(mb_right) && !grounded {
		
	//}
	
	
	
	
	//if speed>15{
	//	speed = lerp(speed,14,lerpvar)
	//} 
	
	
	//if zoom_timer>3 {
	//	vspeed += grav_boost
	//}
	zoom_timer++
	if point_distance(x,y,tail_dest_x,tail_dest_y)>37.5 {
		//move_towards_point(tail_dest_x,tail_dest_y,zspeed)
		hsp = cos(degtorad(point_direction(x,y,tail_dest_x,tail_dest_y))) * zspeed
		vsp = -sin(degtorad(point_direction(x,y,tail_dest_x,tail_dest_y))) * zspeed
	}
	//sdm(object_get_name(tail_obj.current_wall.object_index))
	if object_get_name(tail_obj.current_wall.object_index)==impale_circle_moving_obj {
		tail_dest_x = tail_obj.current_wall.x	
		tail_dest_y = tail_obj.current_wall.y
		hsp = cos(degtorad(point_direction(x,y,tail_dest_x,tail_dest_y))) * zspeed
		vsp = -sin(degtorad(point_direction(x,y,tail_dest_x,tail_dest_y))) * zspeed
		//sdm("goooo")
	} else if tail_obj.moving_platform_bool {
		tail_dest_x = tail_obj.x
		tail_dest_y = tail_obj.y
		hsp = cos(degtorad(point_direction(x,y,tail_dest_x,tail_dest_y))) * zspeed
		vsp = -sin(degtorad(point_direction(x,y,tail_dest_x,tail_dest_y))) * zspeed
	}
	
	
	if k_dash_r || !k_dash
	|| k_fire_p {
		zoom_out_of_wall_timer = 20	
	}
	
	if zoom_out_of_wall_timer>0 {
		//reset_intangibility()
	}
	
	if zoom_out_of_wall_timer>0 && !place_meeting(x,y,wall_parent_obj) {
		
		zoom_timer_bool = false
		zoom_timer = 0
		bounce_buff_timer = 6
		out_of_dash_t=10
		reset_intangibility()
		hsp *=0.68
		if vsp>0 {
			vsp *=0.9
		} else {
			vsp *=0.68
		}
		zoom_allow=7
		
		//player_obj.tail_planted = false
		//player_obj.tail_pulling = true
		if place_meeting(x+hsp*2,y+vsp*2,wall_parent_obj) {
			if point_distance(x,y,player_hitbox_check_obj.x,player_hitbox_check_obj.y)<get_speed() {
				x = player_hitbox_check_obj.x
				y = player_hitbox_check_obj.y
				hsp=0
				vsp=0
			} else {
				hsp=0
				vsp=0
			}
		}
		
		
		if distance_to_object(tail_obj)>25 {
			
			//hspeed = clamp(hspeed,-10,10)
			//vspeed = clamp(vspeed,-10,10)
		}	
		
		zoom_out_of_wall_timer = 0
	}
	//if distance_to_object(player_hitbox_check_obj)<5
	//&& !collision_line(player_hitbox_check_obj.x,player_hitbox_check_obj.y,x,y,wall_obj,false,true) {
	//	if !mouse_check_button(mb_right) && !bounced {
	//		zoom_timer_bool = false
	//		zoom_timer = 0
	//		bounced = false
	//		zoom_ctdn = 0
	//		reset_intangibility()
	//		tail_planted = false
	//		tail_pulling = true
	//	}
	//}
	
	
	
	audio_sound_gain(Ice_Projectile_Shoot_03,0.8,0)
	
	
} else {
	zoom_timer=0	
	zoom_particle_timer= 0
	
	//gogo = lerp(gogo,0,0.1
	audio_sound_gain(Ice_Projectile_Shoot_03,0,200)
}

if out_of_dash_t<0 {
	zooming_particles()	
}

bounce_buff_timer--
	
	if bounce_buff_timer<=0 { bounce_buff_timer=0 }