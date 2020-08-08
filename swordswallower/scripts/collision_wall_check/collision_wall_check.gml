checkx = argument0;
checky = argument1;
obj = argument2;
i = argument3;
xcorner = argument4
ycorner = argument5

if(!place_meeting(checkx,checky,obj) || (hsp==0 && vsp==0)){
	return false;
}

local_obj = instance_place(checkx, checky, obj);

//if !place_meeting(checkx+hsp,checky+vsp,local_obj)
//&& !collision_line(checkx,checky,checkx+hsp,checky+vsp,local_obj,false,true) {
//	return false
//}

if obj==switch_wall_switch_obj && !local_obj.hit {
	local_obj.enabled = !local_obj.enabled
	local_obj.hit = true
	
	return false
} else if obj==switch_wall_switch_obj {
	return false	
}

if obj==break_wall_obj {
	//local_obj.broken = true
	//hitpause = true
	//return false
}

if obj==breakable_decoration_obj {
	if !local_obj.met {
		with local_obj {
			if d_type==0 {
				shatter_mb_script()
				
				if !audio_is_playing(Ice_Break__Shatter__Smash_03) {
					//audio_play_sound(Ice_Break__Shatter__Smash_03,0,false)
				}
				destroy = true
			} else if d_type==1 {
				sever_particle_script()
			} else if d_type==2 {
				sever_g_particle_script()
			} else if d_type==3 {
				destroy = true
				
			}
		}
		local_obj.met = true
	}
	return true
}

/*
if place_meeting(checkx,checky,obj) && 
!place_meeting(xcorner,ycorner,obj) &&
abs(point_direction(checkx,checky,local_obj.x,local_obj.y)-point_direction(xcorner,ycorner,local_obj.x,local_obj.y))<90 
{
	if abs(get_angle_plug(checkx,checky,local_obj)-get_angle_plug(xcorner,ycorner,local_obj))<91
	|| (get_angle_plug(checkx,checky,local_obj)==270 && get_angle_plug(xcorner,ycorner,local_obj)==0)
	|| (get_angle_plug(checkx,checky,local_obj)==0 && get_angle_plug(xcorner,ycorner,local_obj)==270)
	{
		
		
	}
	return false
	
}*/
if obj==key_door_obj {
	
	if ds_list_size(player_obj.keylist)>=local_obj.lock && !lockcheck && local_obj.closed {
		var yikes = ds_list_size(player_obj.keylist)
		for(i=0;i<local_obj.lock;i++) {
			instance_destroy(player_obj.keylist[| i])
		}
		var k = 0
		templist = ds_list_create()
		while k<yikes-local_obj.lock {
			ds_list_add(templist,player_obj.keylist[|k+local_obj.lock])
			k++
		}
		player_obj.keylist = templist
			
		local_obj.closed = false
		hitpause = true
		lockcheck=true
		audio_play_sound(door_unlock_2,0,false)
		sword_reject_script()
	}	
	
	ok = sword_reject_1
	audio_sound_gain(ok,0.15,0)
	audio_play_sound(ok,0,false)
}
if lockcheck {
	return false	
}

if obj==wood_wall_obj && player_obj.fire_active {
	local_obj.death = true
	return false;	
}
if obj==black_wall_obj   {
	sword_reject_script()
	with (eye_obj) {
		met = false	
	}
	return false
}

if obj==snake_head || obj==snakehead_obj {
	sword_reject_script()
	return false
		
}

if player_obj.fire_active {
	if obj==burn_wall_obj {
		with local_obj {
			instance_destroy()	
		}
		return false
	}
}


ogx=x
ogy=y
x = checkx;
y = checky;


if abs(checkx-player_obj.start_throw_x)<6 and
abs(checky-player_obj.start_throw_y)<6 and
i<5 {
	//sdmn()
	//return false
}

if obj==falling_rock_rope_obj {
	local_obj.death = true
	return false;
}

//sdm("ACK");

//tempang = arctan((player_obj.start_throw_y-y)/(player_obj.start_throw_x-x))
player_obj.shake_d=7
player_obj.camera_shake_d = true
pickup_timer = 20

if obj==stinky_pile_obj {
	
	if !local_obj.lit {
		if stinky {
			local_obj.lit = true	
			stinky = true	
			stinky_when_thrown = false	
		}
	} else {
		stinky = true	
		stinky_when_thrown = false	
	}
	player_obj.tail_dest_x = local_obj.x
	player_obj.tail_dest_y = local_obj.y
	//sdm("ooP")
}


//r = local_obj.x,local_obj.y

//dx = dot_product(tarx,tary,direcxh,direcyh)
//ux = direcxh,direcyh

//dy = dot_product(tarx,tary,direcxh,direcyh)
//uy = direcxv,direcyv

//vector p = r + dx*ux + dy*uy;
//vector p = r + a(dx*ux.x,dx*ux.y) + b(dy*uy.x,dy*uy.y);



//ax = dx * direcxh
//ay = dx * direcyh

//bx = dy * direcxv
//by = dy * direcyv

//px = local_obj.x + ax + bx
//py = local_obj.y + ay + by

//normx = cos(degtorad(point_direction(px,py,x,y)));
//normy = -sin(degtorad(point_direction(px,py,x,y)));

//ang = point_direction(px,py,x,y)



oldx = x
oldy = y
dist_moved = 0;
new_x = x;
while (dist_moved < abs(hsp)) {
	new_x -= sign(hsp);
	dist_moved++;
	if (!place_meeting(new_x, y, local_obj)) {
		x = new_x
		//get_angle()
		insert_hs = hsp
		insert_vs = vsp
		
		wall_particle_tail_script(hsp/2,vsp/2,0.2,5,true,2,2,rubble_s1)
		
		hsp = 0
		vsp = 0
		planted=true
		
		player_hitbox_check_obj.go = true
		
		
		//player_obj.tail_dest_x = player_hitbox_check_obj.x
		//player_obj.tail_dest_y = player_hitbox_check_obj.y
		
		current_wall = local_obj
		current_wallx = local_obj.x
		current_wally = local_obj.y
		
		
		player_obj.tail_throwing = false
		player_obj.tail_planted = true
		player_obj.left_click_buffer = 0
		//ang = 0
		
		image_angle = point_direction(player_obj.start_throw_x,player_obj.start_throw_y,x,y) - 90
		
		//ang = tempang
		if obj==impale_circle_obj {
			audio_play_sound(sword_reject_1,0,false)	
		}
		if obj==impale_circle_moving_obj {
			local_obj.sword_present = true
			
			local_obj.swordx = (x-local_obj.x)
			local_obj.swordy = (y-local_obj.y)
			player_obj.tail_dest_x = local_obj.x
			player_obj.tail_dest_y = local_obj.y
			audio_play_sound(sword_reject_1,0,false)
			moving_platform_bool = true
			
		}
		if (obj==moving_platform_obj || obj==falling_rock_obj 
		|| obj==switch_wall_obj || obj==skiff_obj
		|| obj==mach_moving_wall_obj
		|| obj==close_wall_obj || obj==sinking_platform_obj) && obj!=skiff_obj{
			local_obj.sword_present = true
			local_obj.swordx = (x-local_obj.x)
			local_obj.swordy = (y-local_obj.y)
			audio_play_sound(sword_reject_1,0,false)
			moving_platform_bool = true
		}
		if obj==circle_friend_obj {
			local_obj.active = true
			local_obj.xoff = x-local_obj.x
			local_obj.yoff = y-local_obj.y
		}
		if obj==hummingbird_obj {
			local_obj.sword_present = true
		}
		
		if obj==kill_back_wall_obj {
			with local_obj {
				ang = point_direction(x,y,tail_obj.x,tail_obj.y)-image_angle
				
				dist = point_distance(x,y,tail_obj.x,tail_obj.y)
				sword_present = true	
			}
			//local_obj.swordang = point_direction(player_obj.start_throw_x,player_obj.start_throw_y,x,y) - 90
		}
		if stinky {
			if obj==wall_obj {
				
				if !place_meeting(x,y,grass_obj) {
					sir = instance_create_depth(oldx,oldy,250,grass_obj)	
					sir.image_angle = ang-90
					dist = sir.sprite_width
				}
				
				if !place_meeting(x+cos(degtorad(ang-90))*dist,y-sin(degtorad(ang-90))*dist,grass_obj) {
					sir = instance_create_depth(
					oldx+cos(degtorad(ang-90))*dist,
					oldy-sin(degtorad(ang-90))*dist,
					250,grass_obj)	
					sir.image_angle = ang-90	
				}
				if !place_meeting(x-cos(degtorad(ang-90))*dist,y+sin(degtorad(ang-90))*dist,grass_obj) {
					sir = instance_create_depth(
					oldx-cos(degtorad(ang-90))*dist,
					oldy+sin(degtorad(ang-90))*dist,
					250,grass_obj)	
					sir.image_angle = ang-90	
				}
			}
		}
		
		audio_sound_pitch(gsound.s_sword_hit_metal_wall,random_range(0.9,1.1))
		//audio_manager(gsound.s_sword_hit_metal_wall,0,false,0)
		var cx = player_obj.camx + player_obj.cam_width_h
		var cy = player_obj.camy + player_obj.cam_height_h
		audio_play_sound_at(gsound.s_sword_hit_metal_wall,
			mean(cx,cx,cx,cx,cx,cx,tail_obj.x),
			mean(cy,cy,cy,cy,cy,cy,tail_obj.y),
			10,100,300,1,false,0)
		//mean(cx,cx + cx - tail_obj.x),
		//mean(cy,cy + cy - tail_obj.y),
		
		audio_sound_pitch(Emergency_Sandbag_Heavy_Hitting_Rocks_02,random_range(0.9,1.1))
		//audio_manager(Emergency_Sandbag_Heavy_Hitting_Rocks_02,0,false,0)
		audio_play_sound_at(Emergency_Sandbag_Heavy_Hitting_Rocks_02,
			mean(cx,cx,cx,cx,cx,cx,tail_obj.x),
			mean(cy,cy,cy,cy,cy,cy,tail_obj.y),
			10,100,300,1,false,0)
		
		
		audio_manager(clink1mp332,0,false,0)
		
		return;
	}
}


dist_moved = 0;
new_y = y;
while (dist_moved < abs(vsp)) {
	new_y -= sign(vsp);
	dist_moved++;
	if (!place_meeting(x, new_y, local_obj)) {
		y = new_y;
	//	get_angle()
		insert_hs = hsp
		insert_vs = vsp
		
		wall_particle_tail_script(hsp/2,vsp/2,0.2,5,true,2,2,rubble_s1)
		
		hsp = 0
		vsp = 0;
		planted=true
		//player_obj.tail_dest_x = x
		//player_obj.tail_dest_y = y
		
		player_hitbox_check_obj.go = true
		
		current_wall = local_obj
		current_wallx = local_obj.x
		current_wally = local_obj.y
		
		player_obj.tail_throwing = false
		player_obj.tail_planted = true
		player_obj.left_click_buffer = 0
		//ang = 270
		
		image_angle = point_direction(player_obj.start_throw_x,player_obj.start_throw_y,x,y) - 90
		
		//ang = tempang
		
		if obj==impale_circle_obj {
			audio_play_sound(sword_reject_1,0,false)	
		}
		
		if obj==impale_circle_moving_obj {
			local_obj.sword_present = true
			
			local_obj.swordx = (x-local_obj.x)
			local_obj.swordy = (y-local_obj.y)
			player_obj.tail_dest_x = local_obj.x
			player_obj.tail_dest_y = local_obj.y
			audio_play_sound(sword_reject_1,0,false)
			moving_platform_bool = true
		}
		
		if (obj==moving_platform_obj || obj==falling_rock_obj 
		|| obj==switch_wall_obj || obj==skiff_obj
		|| obj==mach_moving_wall_obj
		|| obj==close_wall_obj || obj==sinking_platform_obj) && obj!=skiff_obj {
			local_obj.sword_present = true
			local_obj.swordx = (x-local_obj.x)
			local_obj.swordy = (y-local_obj.y)
			audio_play_sound(sword_reject_1,0,false)
			moving_platform_bool = true
		}
		if obj==circle_friend_obj {
			local_obj.active = true
			local_obj.xoff = x-local_obj.x
			local_obj.yoff = y-local_obj.y
		}
		if obj==hummingbird_obj {
			local_obj.sword_present = true
		}
		if obj==kill_back_wall_obj {
			with local_obj {
				ang = point_direction(x,y,tail_obj.x,tail_obj.y)-image_angle
			
				dist = point_distance(x,y,tail_obj.x,tail_obj.y)
				sword_present = true	
			}
			//local_obj.swordang = point_direction(player_obj.start_throw_x,player_obj.start_throw_y,x,y) - 90
		}
		if stinky {
			if obj==wall_obj {
				var go = false
				if !place_meeting(x,y,grass_obj) {
					sir = instance_create_depth(oldx,oldy,250,grass_obj)	
					sir.image_angle = ang-90
					dist = sir.sprite_width
					go = true
				}
				if go {
					if !place_meeting(x+cos(degtorad(ang-90))*dist,y-sin(degtorad(ang-90))*dist,grass_obj) {
						sir = instance_create_depth(
						oldx+cos(degtorad(ang-90))*dist,
						oldy-sin(degtorad(ang-90))*dist,
						250,grass_obj)	
						sir.image_angle = ang-90	
					}
					if !place_meeting(x-cos(degtorad(ang-90))*dist,y+sin(degtorad(ang-90))*dist,grass_obj) {
						sir = instance_create_depth(
						oldx-cos(degtorad(ang-90))*dist,
						oldy+sin(degtorad(ang-90))*dist,
						250,grass_obj)	
						sir.image_angle = ang-90	
					}
				}
				
			}
		}
		audio_sound_pitch(gsound.s_sword_hit_metal_wall,random_range(0.94,1.06))
		audio_manager(gsound.s_sword_hit_metal_wall,0,false,0)
		audio_sound_pitch(Emergency_Sandbag_Heavy_Hitting_Rocks_02,random_range(0.94,1.06))
		audio_manager(Emergency_Sandbag_Heavy_Hitting_Rocks_02,0,false,0)
		audio_manager(clink1mp332,0,false,0)
			
		return;
	}
}



return true;

