checkx = argument0;
checky = argument1;
obj = argument2;

if(!place_meeting(checkx,checky,obj)){
	return false;
}
//sdm("enemy detec")
local_obj = instance_place(checkx, checky, obj);
if object_get_parent(local_obj.object_index)==killalways_parent_obj
&& local_obj.object_index!=twojoints_hand_obj
&& local_obj.object_index!=snakehead_obj {
	return
}

//sdm("ok")
//sdm(object_get_name(local_obj.object_index))
if (player_obj.tail_throwing || player_obj.tail_pulling) && !local_obj.met {
	oldx = x
	oldy = y
	x = checkx;
	y = checky;
	bleh = false
	//sdm("g1")
	
	if local_obj.object_index==tear_nograv_obj {
		local_obj.death = true
		return false	
	}
	
	if local_obj.object_index==twojoints_weakspot_obj {
		 with local_obj {
			 death_blood_spawn_x = x
			 death_blood_spawn_y = y
			 instance_destroy()
		 }
		return false	
	}
	//sdm("g2")
	if local_obj.object_index==nucrab_obj || local_obj.object_index==handbug_obj {
		
		if local_obj.pickedup {
			x = oldx
			y = oldy
			player_obj.shake_d=7.5
			player_obj.camera_shake_d = true
			return false
		}
	}
	if local_obj.object_index==snakehead_obj {
		if  player_obj.tail_throwing {
			sword_reject_script()
			local_obj.parent.headhit = true
			if player_obj.fire_active {
				local_obj.parent.death = true	
			}
			var thsp = local_obj.hsp
			var tvsp = local_obj.vsp
			x = oldx
			y = oldy
			local_obj.met = true
			//itpause = false
			return
		} else {
			x = oldx
				y = oldy
			local_obj.met = true
		}
	}
	//sdm("g3")
	if local_obj.sword_reject {
		if  player_obj.tail_throwing {
			sword_reject_script()
			var thsp = local_obj.hsp
			var tvsp = local_obj.vsp
			x = oldx
			y = oldy
			local_obj.met = true
			//itpause = false
			return
		} else {
			x = oldx
				y = oldy
			local_obj.met = true
		}
	}
	if local_obj.object_index==thirsty_ghoul_obj {
		local_obj.met = true
		if local_obj.charging {
			local_obj.hit = true
		} else {
			local_obj.charge_state_t_m-=20
			local_obj.hsp += cos(tail_obj.hsp) * 0.5
			local_obj.vsp -= sin(tail_obj.vsp) * 0.5
			sword_reject_script()
		}
		return false
		
	}
	
	//sdm("g4")
	
	if local_obj.object_index==arcing_knight_obj {
		if ((y<local_obj.y-64 && abs(x-local_obj.x)<=56)
		//|| sign(local_obj.x-x)==local_obj.xs
		)
		
		&& local_obj.state<3 {
			local_obj.death = true
			bleh = true
		}
	}
	if bleh {
		return false	
	}
	if object_get_parent(local_obj.object_index)==powerup_bug_obj {
		with local_obj {
			//sprite_index = eyebat_flying3
			hp-=10
			death_blood_spawn_x = x
			death_blood_spawn_y = y
			death = true	
			met = true
			//sdm("fly dead")
			//shatter_mb_input_script(sprite_width/2)	
		}
		sword_hitpause(local_obj,2)
		player_obj.shake_d=4.5
		player_obj.camera_shake_d = true
		audio_play_sound(Knife_Pull_140,0,false)
		
		x = oldx
		y = oldy
			
		var ok = sword_thud_1
		audio_sound_gain(ok,random_range(0.1,0.2),0)
		audio_sound_pitch(ok,random_range(1.1,1.3))
		audio_play_sound(ok,0,false)
		audio_manager(false,0,false,3)
		
		var bruh = lettuce_chop
			audio_sound_pitch(bruh,random_range(0.75,1.25))
			audio_sound_gain(bruh,0.32,0)
			audio_play_sound(bruh,0,false)
			
			bruh = sword_crunch_1
			audio_sound_pitch(bruh,random_range(2,3))
			audio_sound_gain(bruh,random_range(0.3,0.6),0)
			audio_play_sound(bruh,0,false)
		
		player_obj.tail_planted = false
	}
	//sdm("g6")
	if local_obj.object_index==flyfree_obj || local_obj.object_index==doublefly_obj {
		//sdm("fly collision")
		if local_obj.inv_timer>0 || local_obj.death {
			player_obj.tail_planted = false
			x = oldx
			y = oldy
			
			return false	
		}
		with local_obj {
			sprite_index = eyebat_flying3
			
			death_blood_spawn_x = x
			death_blood_spawn_y = y
			death = true	
			met = true
			//sdm("fly dead")
			//shatter_mb_input_script(sprite_width/2)	
		}
		sword_hitpause(local_obj,2)
		player_obj.shake_d=4.5
		player_obj.camera_shake_d = true
		audio_play_sound(Knife_Pull_140,0,false)
		
		
			
		var ok = sword_thud_1
		audio_sound_gain(ok,random_range(0.1,0.2),0)
		audio_sound_pitch(ok,random_range(1.1,1.3))
		audio_play_sound(ok,0,false)
		
		player_obj.tail_planted = false
		//x = xpreva
		//y = ypreva
		return false	
		//hitpause = true
	} else if local_obj.object_index==flyswarm_obj {
		if local_obj.inv_timer>0 || local_obj.death || local_obj.swarming {
			player_obj.tail_planted = false
			x = oldx
			y = oldy
			
			return false	
		}
		with local_obj {
			sprite_index = eyebat_flying3
			shatter_mb_input_script(sprite_width/2)	
			death_blood_spawn_x = x
			death_blood_spawn_y = y
		}
		player_obj.shake_d=4.5
		player_obj.camera_shake_d = true
		audio_play_sound(Knife_Pull_140,0,false)
		
		var ok = sword_thud_1
		audio_sound_gain(ok,random_range(0.1,0.2),0)
		audio_sound_pitch(ok,random_range(1.1,1.3))
		audio_play_sound(ok,0,false)
			
		local_obj.hp--
		local_obj.swarming = true
		local_obj.met = true
		if player_obj.fire_active {
			local_obj.hp-=20	
		}
		player_obj.tail_planted = false
		x = xpreva
		y = ypreva
			
			
		
		//hitpause = true
	} else if local_obj.object_index==fatfly2_obj || local_obj.object_index==bombfly_diagonal_obj|| local_obj.object_index==bombfly_fat_obj {
		player_obj.shake_d=3
		player_obj.camera_shake_d = true
		audio_play_sound(Knife_Pull_140,0,false)
		
		local_obj.hp--
		if local_obj.hp>0 {
			with local_obj {
				just_blood(tail_obj.hsp,tail_obj.vsp,0.2,30,false,sprite_width/4,sprite_height)	
			}
		}
		player_obj.tail_planted = false
		x = xpreva
		y = ypreva
		local_obj.met = true
		sword_hitpause(local_obj)
		
	} else if local_obj.object_index==kill_back_obj {
		
		audio_play_sound(Knife_Pull_140,0,false)
		local_obj.death = true	
		player_obj.tail_planted = false
		sword_hitpause(local_obj)
		
	} else if local_obj.object_index==snakeheart_obj {
		if !local_obj.parent.headhit {
			local_obj.death = true
			local_obj.death_blood_spawn_x = local_obj.x
			local_obj.death_blood_spawn_y = local_obj.y
			x = xpreva
			y = ypreva
			player_obj.shake_d=5
			player_obj.camera_shake_d = true
			sword_hitpause(local_obj)
			
			audio_play_sound(Knife_Pull_140,0,false)
			
			var ok = sword_thud_1
			audio_sound_gain(ok,random_range(0.3,0.35),0)
			audio_sound_pitch(ok,random_range(0.9,1.1))
			audio_play_sound(ok,0,false)
			
			var bruh = lettuce_chop
			audio_sound_pitch(bruh,random_range(0.75,1.25))
			audio_sound_gain(bruh,0.32,0)
			audio_play_sound(bruh,0,false)
			
			bruh = sword_crunch_1
			audio_sound_pitch(bruh,random_range(2,3))
			audio_sound_gain(bruh,random_range(0.3,0.6),0)
			audio_play_sound(bruh,0,false)
			
			bruh = venus_die_1
			audio_sound_pitch(bruh,random_range(0.8,1.2))
			audio_sound_gain(bruh,random_range(0.3,0.6),0)
			audio_play_sound(bruh,0,false)
		} else {
			x = xpreva
			y = ypreva
			if instance_exists(local_obj.parent.head) {
				x+=local_obj.parent.head.hsp*2
				y+=local_obj.parent.head.vsp*2
			}
		}
		//local_obj.death = true
		//	x = xpreva
		//	y = ypreva
		//	player_obj.shake_d=5
		//	player_obj.camera_shake_d = true
		//	hitpause = true
	} else if local_obj.object_index==fly_pod_obj {
		local_obj.death = true
		x = xpreva
		y = ypreva
		player_obj.shake_d=5
		player_obj.camera_shake_d = true
		sword_hitpause(local_obj)
	} else if local_obj.object_index==green_guy_obj {
		
		audio_play_sound(Knife_Pull_140,0,false)
		local_obj.death = true	
		x = oldx
		y = oldy
		player_obj.tail_planted = false
		player_obj.gem_active = true
		player_obj.gem_thrown = false
		sword_hitpause(local_obj)
	} else if local_obj.object_index==wooden_fly_dart_obj {
		audio_play_sound(Knife_Pull_140,0,false)
		local_obj.death = true	
		x = oldx
		y = oldy
		player_obj.tail_planted = false	
		sword_hitpause(local_obj)
	} else if local_obj.object_index==eye_obj {
		local_obj.hp-=1	
		local_obj.image_blend = c_red
		local_obj.met = true
		player_obj.shake_d=7
		player_obj.camera_shake_d = true
		sword_hitpause(local_obj)
		
	} else if local_obj.object_index==cryptkeeper_obj || local_obj.object_index==cryptkeeper_ceiling_obj {
		with local_obj {
			//shatter_mb_input_script(6)
			if audio_is_playing(idle_sound) {
				audio_stop_sound(idle_sound)	
			}
			death_blood_spawn_x = x
			death_blood_spawn_y = y
		}
		//x = oldx
		//y = oldy
		audio_play_sound(Knife_Pull_140,0,false)
		var ok = sword_thud_1
		audio_sound_gain(ok,random_range(0.18,0.26),0)
		audio_sound_pitch(ok,random_range(0.9,1.1))
		audio_play_sound(ok,0,false)
		
		ok = choose(zomb_death1,zomb_death2,zomb_death3,zomb_death4)
		audio_sound_pitch(ok,random_range(0.8,1.2))
		audio_sound_gain(ok,0.4,0)
		audio_play_sound(ok,0,false)
		
		
		var ello = impact_2
		audio_sound_gain(ello,0.25,0)
		audio_sound_pitch(ello,random_range(1.4,1.7))
		audio_play_sound(ello,0,false)
		
		local_obj.death = true	
		player_obj.tail_planted = false
		player_obj.shake_d=5
		player_obj.camera_shake_d = true
		audio_manager(false,0,false,3)
		sword_hitpause(local_obj)
		
	} else if local_obj.object_index==dash_guy_obj {
		if local_obj.sprite_index == follow_guy_angry {
			local_obj.death = true
			
		} else {
			local_obj.sword_lock = true
			local_obj.swordx = x - local_obj.x
			local_obj.swordy = y - local_obj.y
			
			current_obj = local_obj	
			
			hsp = 0
			vsp = 0
			planted=true
			player_obj.tail_dest_x = local_obj.x
			player_obj.tail_dest_y = local_obj.y
			player_obj.tail_planted = true
			player_obj.tail_throwing = false
			audio_manager(false,0,false,3)
			inside_flier = true
			image_angle = point_direction(player_obj.start_throw_x,player_obj.start_throw_y,x,y) - 90
			audio_manager(false,0,false,3)
		} 
		sword_hitpause(local_obj)
		local_obj.met = true
		return false
	} else if local_obj.object_index==charger_obj {
		//hitpause = true
		if local_obj.hp-10<0 {
			audio_play_sound(Knife_Pull_140,0,false)
			local_obj.death = true	
			sword_hitpause(local_obj)
			audio_manager(false,0,false,3)
			audio_play_sound(bulldeath,0,false)
			var ok = sword_thud_1
			audio_sound_gain(ok,random_range(0.18,0.25),0)
			audio_sound_pitch(ok,random_range(0.9,1.1))
			audio_play_sound(ok,0,false)
			
			var bruh = lettuce_chop
			audio_sound_pitch(bruh,random_range(0.75,1.25))
			audio_play_sound(bruh,0,false)
			local_obj.met = true
			local_obj.death_blood_spawn_x = local_obj.x
			local_obj.death_blood_spawn_y = local_obj.y
			return false
			
		} else if local_obj.state==local_obj.state_idle {
			//sword_reject_script()
			//x = oldx
			//x += local_obj.hsp*5
			
			local_obj.met = true
			//audio_manager(false,0,false,3)
			
			
			return false
		} else {
			local_obj.met= true
			player_obj.shake_d=5
			player_obj.camera_shake_d = true
			tail_obj.charger_bool = true
			sword_reject_script()
			//audio_play_sound(sword_thud_1,0,false)
			//planted = true
			with local_obj {
				hp-=10	
				ang = point_direction(x,y,player_obj.x,player_obj.y)
			
				audio_play_sound(bullsword,0,false)
				
				var bruh = lettuce_chop
				audio_sound_pitch(bruh,random_range(0.75,1.25))
				audio_play_sound(bruh,0,false)
				
				audio_manager(0,false,0,3)
				
				var ok = sword_thud_1
				audio_sound_gain(ok,random_range(0.18,0.25),0)
				audio_sound_pitch(ok,random_range(0.9,1.1))
				audio_play_sound(ok,0,false)
			
			
				just_blood_input(cos(degtorad(ang))*30,-sin(degtorad(ang))*30,
				
				tail_obj.throwxs * -0.1,
				-5,
				
				80,true,x,y)
		
				state = state_chasing
				charge_timer=0
				charging = false	
			}
			return false
			//local_obj.sword_lock = true
			//local_obj.swordx = x - local_obj.x
			//local_obj.swordy = y - local_obj.y
			
			//current_obj = local_obj
			////audio_manager(false,0,false,3)
			
			//additional_enemy_script()
		}
		
		
		
		
	} else if local_obj.object_index=twojoints_hand_obj {
		x = oldx
			y = oldy
		return
	} else {
		
		
		dist_moved = 0;
		new_x = x;
		while (dist_moved < abs(hsp)) {
			new_x -= sign(hsp);
			dist_moved++;
			if (!place_meeting(new_x, y, local_obj)) {
				if local_obj.object_index==crab_obj || local_obj.object_index==nucrab_obj || local_obj.object_index==handbug_obj {
					if local_obj.fallingoverride {
						local_obj.death = true
						player_obj.shake_d=3
						player_obj.camera_shake_d = true
					} else {
						player_obj.shake_d=7
						player_obj.camera_shake_d = true
						local_obj.h_max_speed=0.2
					}
					return
				}
				
				
				local_obj.sword_lock = true
				local_obj.swordx = x - local_obj.x
				local_obj.swordy = y - local_obj.y
			
				current_obj = local_obj
				
				x = new_x
				
				image_angle = point_direction(player_obj.start_throw_x,player_obj.start_throw_y,x,y) - 90
				//hsp = 0
				//vsp = 0
				
				additional_enemy_script()
			
				audio_manager(false,0,false,3)
			
				return;
			}
		}


		dist_moved = 0;
		new_y = y;
		while (dist_moved < abs(vsp)) {
			new_y -= sign(vsp);
			dist_moved++;
			if (!place_meeting(x, new_y, local_obj)) {
				if local_obj.object_index==crab_obj || local_obj.object_index==nucrab_obj || local_obj.object_index==handbug_obj {
					if local_obj.fallingoverride {
						local_obj.death = true
						player_obj.shake_d=3
						player_obj.camera_shake_d = true
					} else {
						player_obj.shake_d=7
						player_obj.camera_shake_d = true
						local_obj.h_max_speed=0.2
					}
					return
				}
				
				local_obj.sword_lock = true
				local_obj.swordx = x - local_obj.x
				local_obj.swordy = y - local_obj.y
			
				current_obj = local_obj
			
				y = new_y;
				
				image_angle = point_direction(player_obj.start_throw_x,player_obj.start_throw_y,x,y) - 90
				//hsp = 0
				//vsp = 0;
				player_obj.tail_dest_x = x
				player_obj.tail_dest_y = y
				player_obj.tail_planted = true
			
			
				additional_enemy_script()
			
			
				audio_manager(false,0,false,3)
			
				return;
			}
		}
	}
}
//} else {
	
//	dist_moved = 0;
//	new_x = x;
//	while (dist_moved < abs(hsp)) {
//		new_x -= sign(hsp);
//		dist_moved++;
//		if (!place_meeting(new_x, y, local_obj)) {
//			x = new_x
//			hsp = 0
//			return;
//		}
//	}


//	dist_moved = 0;
//	new_y = y;
//	while (dist_moved < abs(vsp)) {
//		new_y -= sign(vsp);
//		dist_moved++;
//		if (!place_meeting(x, new_y, local_obj)) {
//			y = new_y;
//			vsp = -1;
//			return;
//		}
//	}
	
//}

return true;
