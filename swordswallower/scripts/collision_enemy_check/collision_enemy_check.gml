checkx = argument0;
checky = argument1;
obj = argument2;

if(!place_meeting(checkx,checky,obj)){
	return false;
}

local_obj = instance_place(checkx, checky, obj);


if (player_obj.tail_throwing || player_obj.tail_pulling) && !local_obj.met {
	oldx = x
	oldy = y
	x = checkx;
	y = checky;
	bleh = false
	
	if obj==tear_nograv_obj {
		local_obj.death = true
		return false	
	}

	if obj==nucrab_obj || obj==handbug_obj {
		
		if local_obj.pickedup {
			x = oldx
			y = oldy
			player_obj.shake_d=7.5
			player_obj.camera_shake_d = true
			return false
		}
	}
	if obj==snakehead_obj {
		sword_reject_script()
		local_obj.parent.headhit = true
		if player_obj.fire_active {
			local_obj.parent.death = true	
		}
		return false
		
	}
	if obj==thirsty_ghoul_obj {
		local_obj.met = true
		if local_obj.charging {
			local_obj.hit = true
		} else {
			local_obj.charge_state_t_m-=20
			local_obj.hspeed += cos(tail_obj.hspeed) * 0.5
			local_obj.vspeed -= sin(tail_obj.vspeed) * 0.5
			sword_reject_script()
		}
		return false
		
	}
	
	
	
	if obj==arcing_knight_obj {
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
	
	
	if obj==fly_obj || obj==flyfree_obj || obj==doublefly_obj {
		if local_obj.inv_timer>0 || local_obj.death {
			player_obj.tail_planted = false
			x = oldx
			y = oldy
			
			return false	
		}
		with local_obj {
			sprite_index = eyebat_flying3
			shatter_mb_input_script(sprite_width/2)	
		}
		player_obj.shake_d=4.5
		player_obj.camera_shake_d = true
		audio_play_sound(Knife_Pull_140,0,false)
		
		var ok = sword_thud_1
		audio_sound_gain(ok,random_range(0.1,0.2),0)
		audio_sound_pitch(ok,random_range(1.1,1.3))
		audio_play_sound(ok,0,false)
			
		local_obj.death = true	
		player_obj.tail_planted = false
		x = xpreva
		y = ypreva
		//hitpause = true
	} else if obj==flyswarm_obj {
		if local_obj.inv_timer>0 || local_obj.death || local_obj.swarming {
			player_obj.tail_planted = false
			x = oldx
			y = oldy
			
			return false	
		}
		with local_obj {
			sprite_index = eyebat_flying3
			shatter_mb_input_script(sprite_width/2)	
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
	} else if obj==fatfly2_obj || obj==bombfly_diagonal_obj|| obj==bombfly_fat_obj {
		player_obj.shake_d=3
		player_obj.camera_shake_d = true
		audio_play_sound(Knife_Pull_140,0,false)
		
		local_obj.hp--
		if local_obj.hp>0 {
			with local_obj {
				just_blood(tail_obj.hspeed,tail_obj.vspeed,0.2,30,false,sprite_width/4,sprite_height)	
			}
		}
		player_obj.tail_planted = false
		x = xpreva
		y = ypreva
		local_obj.met = true
		hitpause = true
		
	} else if obj==kill_back_obj {
		
		audio_play_sound(Knife_Pull_140,0,false)
		local_obj.death = true	
		player_obj.tail_planted = false
		hitpause = true
		
	} else if obj==snakeheart_obj {
		if !local_obj.parent.headhit {
			local_obj.death = true
			x = xpreva
			y = ypreva
			player_obj.shake_d=5
			player_obj.camera_shake_d = true
			hitpause = true
			
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
				x+=local_obj.parent.head.hspeed*2
				y+=local_obj.parent.head.vspeed*2
			}
		}
		//local_obj.death = true
		//	x = xpreva
		//	y = ypreva
		//	player_obj.shake_d=5
		//	player_obj.camera_shake_d = true
		//	hitpause = true
	} else if obj==fly_pod_obj {
		local_obj.death = true
		x = xpreva
		y = ypreva
		player_obj.shake_d=5
		player_obj.camera_shake_d = true
		hitpause = true
	} else if obj==green_guy_obj {
		
		audio_play_sound(Knife_Pull_140,0,false)
		local_obj.death = true	
		x = oldx
		y = oldy
		player_obj.tail_planted = false
		player_obj.gem_active = true
		player_obj.gem_thrown = false
		hitpause = true
	} else if obj==wooden_fly_dart_obj {
		audio_play_sound(Knife_Pull_140,0,false)
		local_obj.death = true	
		x = oldx
		y = oldy
		player_obj.tail_planted = false	
		hitpause = true
	} else if obj==eye_obj {
		local_obj.hp-=1	
		local_obj.image_blend = c_red
		local_obj.met = true
		player_obj.shake_d=7
		player_obj.camera_shake_d = true
		hitpause = true
		
	} else if obj==cryptkeeper_obj || obj==cryptkeeper_ceiling_obj {
		x = oldx
		y = oldy
		audio_play_sound(Knife_Pull_140,0,false)
		var ok = sword_thud_1
		audio_sound_gain(ok,random_range(0.18,0.26),0)
		audio_sound_pitch(ok,random_range(0.9,1.1))
		audio_play_sound(ok,0,false)
		
		ok = choose(zomb_death1,zomb_death2,zomb_death3,zomb_death4)
		audio_sound_pitch(ok,random_range(0.8,1.2))
		audio_sound_gain(ok,0.5,0)
		audio_play_sound(ok,0,false)
		with local_obj {
			//shatter_mb_input_script(6)
			if audio_is_playing(idle_sound) {
				audio_stop_sound(idle_sound)	
			}
		}
		
		
		local_obj.death = true	
		player_obj.tail_planted = false
		player_obj.shake_d=5
		player_obj.camera_shake_d = true
		audio_manager(false,0,false,3)
		hitpause = true
		
	} else if obj==dash_guy_obj {
		if local_obj.sprite_index == follow_guy_angry {
			local_obj.death = true
			
		} else {
			local_obj.sword_lock = true
			local_obj.swordx = x - local_obj.x
			local_obj.swordy = y - local_obj.y
			
			current_obj = local_obj	
			
			hspeed = 0
			vspeed = 0
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
		hitpause = true
		local_obj.met = true
		return false
	} else if obj==charger_obj {
		//hitpause = true
		if local_obj.hp-10<0 && local_obj.state==local_obj.state_knockback {
			audio_play_sound(Knife_Pull_140,0,false)
			local_obj.death = true	
			hitpause = true
			audio_manager(false,0,false,3)
			audio_play_sound(bulldeath,0,false)
			var ok = sword_thud_1
			audio_sound_gain(ok,random_range(0.18,0.25),0)
			audio_sound_pitch(ok,random_range(0.9,1.1))
			audio_play_sound(ok,0,false)
			
			var bruh = lettuce_chop
			audio_sound_pitch(bruh,random_range(0.75,1.25))
			audio_play_sound(bruh,0,false)
			
			return false
			
		} else if local_obj.state!=local_obj.state_knockback {
			//sword_reject_script()
			//x = oldx
			//x += local_obj.hspeed*5
			
			//local_obj.met = true
			//audio_manager(false,0,false,3)
			if player_obj.tail_pulling {
				if round(local_obj.hspeed)==0 {
					with local_obj {
						while place_meeting(x,y,tail_obj) {
							other.x+=sign(other.hspeed)
						}
					}
				} else {
					x += 1 + local_obj.hspeed*5 * sign(local_obj.hspeed*hspeed)
				}
			}
			if player_obj.tail_throwing {
				if round(local_obj.hspeed)==0 {
					with local_obj {
						while place_meeting(x,y,tail_obj) {
							other.x+=sign(other.hspeed)
						}
					}
				}
			}
			return false
		} else {
			player_obj.shake_d=5
			player_obj.camera_shake_d = true
			tail_obj.charger_bool = true
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
				
				80,true,sprite_width/4,sprite_height/4)
		
				state = state_chasing
				charge_timer=0
				charging = false	
			}
			
			//local_obj.sword_lock = true
			//local_obj.swordx = x - local_obj.x
			//local_obj.swordy = y - local_obj.y
			
			//current_obj = local_obj
			////audio_manager(false,0,false,3)
			
			//additional_enemy_script()
		}
		
		
		
		
	} else {
		
		
		dist_moved = 0;
		new_x = x;
		while (dist_moved < abs(hspeed)) {
			new_x -= sign(hspeed);
			dist_moved++;
			if (!place_meeting(new_x, y, local_obj)) {
				if obj==crab_obj || obj==nucrab_obj || obj==handbug_obj {
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
				//hspeed = 0
				//vspeed = 0
				
				additional_enemy_script()
			
				audio_manager(false,0,false,3)
			
				return;
			}
		}


		dist_moved = 0;
		new_y = y;
		while (dist_moved < abs(vspeed)) {
			new_y -= sign(vspeed);
			dist_moved++;
			if (!place_meeting(x, new_y, local_obj)) {
				if obj==crab_obj || obj==nucrab_obj || obj==handbug_obj {
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
				//hspeed = 0
				//vspeed = 0;
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
//	while (dist_moved < abs(hspeed)) {
//		new_x -= sign(hspeed);
//		dist_moved++;
//		if (!place_meeting(new_x, y, local_obj)) {
//			x = new_x
//			hspeed = 0
//			return;
//		}
//	}


//	dist_moved = 0;
//	new_y = y;
//	while (dist_moved < abs(vspeed)) {
//		new_y -= sign(vspeed);
//		dist_moved++;
//		if (!place_meeting(x, new_y, local_obj)) {
//			y = new_y;
//			vspeed = -1;
//			return;
//		}
//	}
	
//}

return true;
