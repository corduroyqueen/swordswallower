
camxlast = camx
camylast = camy
//if kkb {
//	camx = oldcx
//	camy = oldcy
//	kkb = false
//}

if place_meeting(x,y,camera_fix_bounds_parent_obj) {
	camera_fix_bounds = true
	if cam_fix_obj==noone || cam_fix_obj!=instance_place(x,y,camera_fix_bounds_parent_obj) {
		cam_fix_obj = instance_place(x,y,camera_fix_bounds_parent_obj)
	}
} else {
	camera_fix_bounds = false
	cam_fix_obj = noone
}


if intro {
	if !checkpoint_manager.text_bool {
		camx = mean(player_obj.x,sword_swallower.x)-720
		camy = mean(player_obj.y,sword_swallower.y)-450
	} else {
		camx = lerp(camx,player_obj.x-720,0.08)
		camy = lerp(camy,player_obj.y-405,0.08)
	}
	
	camx = 18462
	camy = 13362
	//camera_set_view_size(view_camera[0],,540)
	
	
	
} else if death {

	respawn_timer++
	
	if respawn_timer<60 {
		gpu_set_colorwriteenable(true,true,true,true);
		//instance_activate_object(background)
		
		//camx = lerp(camx,
		//	player_obj.x-cam_width_h,
		//	0.01)
		
		//camy = lerp(camy,
		//	player_obj.y-cam_height_h,
		//	0.01)
		
		//player_obj.shake_d=10
		camera_shake = true
		camera_shake_direc = false
		shake_dir =0
		cam_ang = 0
		
		death_cam_dist = point_distance(
			camx,
			camy,
			checkpoint_manager.checkpoint.x-cam_width_h,
			checkpoint_manager.checkpoint.y-cam_height_h)
		if respawn_timer>=59 {
			instance_activate_object(background)
			gpu_set_colorwriteenable(true,true,true,true);
			deathParticles = sprite_create_from_surface(shockwave_shader.GUI,0,0,surface_get_width(application_surface),surface_get_height(application_surface),0,1,0,0);
			deathParticles2 = sprite_create_from_surface(shockwave_shader.blood_surface,0,0,surface_get_width(application_surface),surface_get_height(application_surface),0,1,0,0);
			deathx = camx
			deathy = camy
			
			
		}
	} else if respawn_timer>=60 {
		
		camera_shake = false
		destx = checkpoint_manager.checkpoint.x-cam_width_h
		desty = checkpoint_manager.checkpoint.y-cam_height_h
		
		ms = 
		(sin(abs((death_cam_dist-point_distance(camx,camy,destx,desty))/death_cam_dist)*3.1415)+0.1)
		* death_cam_dist/33
		
		
		//move_towards_point(destx,desty,ms)
		camx += cos(degtorad(point_direction(camx,camy,destx,desty))) * ms
		camy -= sin(degtorad(point_direction(camx,camy,destx,desty))) * ms
		
		if point_distance(camx,camy,
		checkpoint_manager.checkpoint.x-cam_width_h,
		checkpoint_manager.checkpoint.y-cam_height_h)<50 {
		
			sprite_delete(deathParticles)
			sprite_delete(deathParticles2)
			level1_master.get_deaths = true
			level1_master.death_num++
			level1_master.death_num_p++
			with (checkpoint_manager.checkpoint) {
					savegame_script()	
				}
			respawn_timer=0
			if death {
				if room==subtemple02 {
					if instance_exists(big_boi_time) {
						big_boi_bool = big_boi_time.special_guy
					}
				}
		
			}
		}
		
	}
	
	
		
	
} else if ending_lock {
	
	camx = lerp(camx,
		mean(player_obj.x+1275-cam_width_h,
		player_obj.x+1275-cam_width_h,
		player_obj.x+1275-cam_width_h,
		global.mousepx-cam_height_h),
		0.01)
		
	camy = lerp(camy,
		mean(player_obj.y+300-cam_height_h,
		player_obj.y+300-cam_height_h,
		player_obj.y+300-cam_height_h,
		global.mousepy-cam_height_h),
		0.01)
 
} else if ui_manager.speaking {
	var ctx = mean(ui_manager.friendly_x,player_obj.x)-cam_width_h
	var cty = mean(ui_manager.friendly_y,player_obj.y)-cam_height_h-200
	
	
	camx = lerp(camx,mean(ctx,ctx,ctx,ctx,ctx,ctx,ctx,ctx,global.mousepx),0.13)
	camy = lerp(camy,mean(cty,cty,cty,cty,cty,cty,cty,cty,global.mousepy),0.13)
} else if tail_planted {
	
	
	var xspeed = player_obj.x+(hsp*20)
	var yspeed = player_obj.y+(vsp*20)
	
	//if tail_obj.outside {
	//	camx = lerp(camx,mean(xspeed,xspeed,xspeed,xspeed,xspeed,tail_obj.x,global.mousepx)-cam_width_h,0.05)
	//	camy = lerp(camy,mean(yspeed,yspeed,yspeed,yspeed,yspeed,tail_obj.y,global.mousepy)-cam_height_h,0.05)	
	//} else {
	//	camx = lerp(camx,mean(xspeed,xspeed,xspeed,tail_obj.x,tail_obj.x,global.mousepx)-cam_width_h,0.05)
	//	camy = lerp(camy,mean(yspeed,yspeed,yspeed,tail_obj.y,tail_obj.y,global.mousepy)-cam_height_h,0.05)	
	//}
	
	camx = lerp(camx,mean(xspeed,xspeed,tail_obj.x,global.mousepx)-cam_width_h,0.05)
	camy = lerp(camy,mean(yspeed,yspeed,tail_obj.y,global.mousepy)-cam_height_h,0.05)
	
} else if tail_zooming {
	
	var xspeed = player_obj.x+(hsp*20)
	var yspeed = player_obj.y+(vsp*20)
	
	camx = lerp(camx,mean(xspeed,xspeed,xspeed,global.mousepx)-cam_width_h,0.05)
	camy = lerp(camy,mean(yspeed,yspeed,yspeed,global.mousepy)-cam_height_h,0.05)
	
	
} else if tail_throwing {
	
	var xspeed = player_obj.x+(hsp*20)
	var yspeed = player_obj.y+(vsp*20)
	
	camx = lerp(camx,mean(xspeed,xspeed,global.mousepx,tail_obj.x+tail_obj.hsp*8,tail_obj.x+tail_obj.hsp*8)-cam_width_h,0.03)
	camy = lerp(camy,mean(yspeed,yspeed,global.mousepy,tail_obj.y+tail_obj.vsp*8,tail_obj.y+tail_obj.vsp*8)-cam_height_h,0.03)	
	
	camx = lerp(camx,clamp(camx,player_obj.x-405-cam_width_h,player_obj.x+405-cam_width_h),0.2)
	camy = lerp(camy,clamp(camy,player_obj.y-345-cam_height_h,player_obj.y+345-cam_height_h),0.2)
	
	
} else {
	
	
	var xspeed = x+(hsp*20)
	var yspeed = y+(vsp*20)
	
	
	camx = lerp(camx,mean(xspeed,global.mousepx)-cam_width_h,0.05)
	camy = lerp(camy,mean(yspeed,global.mousepy)-cam_height_h,0.05)	
	
	camx = lerp(camx,clamp(camx,player_obj.x-405-cam_width_h,player_obj.x+495-cam_width_h),0.2)
	camy = lerp(camy,clamp(camy,player_obj.y-345-cam_height_h,player_obj.y+345-cam_height_h),0.2)
	
}

if camera_fix_bounds && !player_obj.death {
	if cam_fix_obj.xtarget>0 {
		camx = lerp(camx,cam_fix_obj.xtarget - cam_width_h,cam_fix_obj.lerpamt)
	} 
	if cam_fix_obj.ytarget>0 {
		camy = lerp(camy,cam_fix_obj.ytarget - cam_height_h,cam_fix_obj.lerpamt)
	} 
}

if camera_shake {
	var rang = random_range(0,360)
	camx += dcos(rang) * 3
	camy += dsin(rang) * 3
	if inv_count>1 {
		camera_shake = false	
	}
}


if camera_shake_direc {
	shake_dir-=10
	camx += cos(cam_ang) * shake_dir
	camy += -sin(cam_ang) * shake_dir
	if shake_dir<1 {
		camera_shake_direc = false	
		shake_dir=0
	}	
}


if camera_shake_d {
	shake_d-=0.5
	camx += random_range(-shake_d,shake_d)
	camy += random_range(-shake_d,shake_d)
	if shake_d<0 {
		camera_shake_d = false	
	}
}


if zoom_timer_bool && !player_obj.death {
	tempadd = 5-(zoom_timer/2)
	tempadd = clamp(tempadd,0,5)
	camx += random_range(-3+tempadd,3+tempadd)
	camy += random_range(-3+tempadd,3+tempadd)
}


if c_slingtimer>0 {
	c_slingtimer-=0.2
	camx += random_range(-c_slingtimer,c_slingtimer)
	camx += random_range(-c_slingtimer,c_slingtimer)
}

if !death {
	camx = floor(camx)
	camy = floor(camy)
}

if init_camera_set {
	camx = checkpoint_manager.checkpoint.x-cam_width_h
	camy = checkpoint_manager.checkpoint.y-cam_height_h
	init_camera_set = false
}

cam_midx = camx + cam_width_h
cam_midy = camy + cam_height_h

camxdiff = camx - camxlast
camydiff = camy - camylast
var cx = camx
var cy = camy
oldcx = camx
oldcy = camy
//var ang = point_direction(cx,cy,player_obj.x-other.cam_width_h,player_obj.y-other.cam_height_h)
//kkb = false
with camera_hitbox_check_obj {
	x = other.cam_midx
	y = other.cam_midy
	//if place_meeting(other.camx,other.camy,camera_bound_obj) {
	//	kkb = true
	//	var inst = instance_place(other.camx,other.camy,camera_bound_obj)
	//	ang = get_angle_plug2(other.cam_midx,other.cam_midy,inst)
	//	sdm("ang")
	//	sdm(ang)
	//	while place_meeting(other.camx,other.camy,camera_bound_obj) {
	//		other.camx+=dcos(ang)
	//		other.camy-=dsin(ang)
	//	}
	//}
	//if cam_fix_obj.xtarget>0 {
	//	camx = lerp(camx,cam_fix_obj.xtarget - cam_width_h,cam_fix_obj.lerpamt)
	//} 
	//if cam_fix_obj.ytarget>0 {
	//	camy = lerp(camy,cam_fix_obj.ytarget - cam_height_h,cam_fix_obj.lerpamt)
	//} 
	if place_meeting(other.cam_midx,other.cam_midy,camera_bound_parent_obj) {
		var boundlist = ds_list_create()
		var list = instance_place_list(other.cam_midx,other.cam_midy,camera_bound_parent_obj,boundlist,false)
		
		var inst// = instance_place(other.cam_midx,other.cam_midy,camera_bound_parent_obj)
		//var sz = ds_list_size(boundlist)
		for(var bl =0;bl<list;bl++) {
			inst = boundlist[|bl]
			with other {
				if inst.xtarget>0 {
					var xdiff = inst.x-cam_midx
					var ydiff = inst.y-cam_midy
					if abs(ydiff)<abs((inst.image_yscale*64)/2 + cam_height_h) - 100 {
				
						camx = lerp(cam_midx,inst.x + ((inst.image_xscale*64)/2 + cam_width_h) * -sign(xdiff),inst.lerpamt)-cam_width_h
					}
				} 
				if inst.ytarget>0 {
					var xdiff = inst.x-cam_midx
					var ydiff = inst.y-cam_midy
					if abs(xdiff)<abs((inst.image_xscale*64)/2 + cam_width_h) - 100 {
						camy = lerp(cam_midy,inst.y + ((inst.image_yscale*64)/2 + cam_height_h) * -sign(ydiff),inst.lerpamt)-cam_height_h
					}
				} 
			}
		}
	}
	//if place_meeting(other.camx,other.camy,camera_bound_obj) {
	//	kkb = true
	//	var b = instance_place(other.camx,other.camy,camera_bound_obj)
	//	while place_meeting(other.camx,other.camylast,camera_bound_obj) {
	//		other.camx-=sign(b.x-other.camxlast)
	//	}
	//	while place_meeting(other.camxlast,other.camy,camera_bound_obj) {
	//		other.camy-=sign(b.y-other.camylast)
	//	}
	//}
}

//camx = clamp(camx,13519,80000)
//camy = clamp(camy,0,20350)

camxdiff = camx - camxlast
camydiff = camy - camylast

camera_set_view_pos(view_camera[0],camx,camy)

