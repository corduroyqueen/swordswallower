//fuck yes
mask_index = dada_guard_walking_hitbox


if wall_detect(x,y+1) {
	grounded = true
} else {
	grounded = false
}


if player_obj.tail_carry {
	met = false
}

if !facing_lock {
	facing = sign(player_obj.x-x)
}
health_proportion = defense/starting_defense

if _state == _state_dummy 
{
	sprite = dada_guard_idle_test
}
else if _state == _state_idle 
{
	dmg_to_take = 0
	sprite = dada_guard_idle_test
	if wall_raycast_checker(player_obj) {
		ui_manager.health_bar_obj = id
		ui_manager.health_bar_active = true
		_state = _state_defensive
		event_user(12)
	}
}
else if _state == _state_defensive 
{
	sprite = dada_guard_defensive_test
	
	dmg_to_take = 0
	
	hsp = 1 * sign(player_obj.x-x)
	
	if point_distance(x,y,player_obj.x,player_obj.y) < 150 {
		_state = _state_swipe
		subimg = 0
	}
	
	if hit {
		defense_sword_addition *= -1
		
		if sign(tail_obj.hsp)==facing {
			timer = 0
			_state = _state_knockback
			defense -= 10
			event_user(12)
		}
	}
	
	subimg += 0.4 * defense_sword_addition
	subimg = clamp(subimg,0,2.9999)
	
	initiate_attack_timer++
	if initiate_attack_timer > 120 {
		initiate_attack_timer = 0
		subimg = 0
		//_state = _state_leapandplunge
		_state = choose(_state_lunge,_state_leapandplunge,_state_shockwave)
		event_user(12)
	}
	
}
else if _state == _state_guarddown
{
	sprite = dada_guard_idle_test
	
	timer++
	
	if sword_present {
		player_obj.tail_dest_x = x
		player_obj.tail_dest_y = y
	}
	
	if timer>300 {
		_state = _state_defensive
		defense = 20
		
		if sword_present {
			sword_present = false
			player_obj.tail_planted = false
			player_obj.tail_pulling = true
		}
		
		event_user(12)
	}
	
}
else if _state == _state_lunge
{
	sprite = dada_guard_lunge_test
	
	if _substate == 0 
	{
		hsp = 0
		subimg = 0
		timer++
		dmg_to_take = 2
		if timer>50 {
			timer = 0
			subimg = 1
			_substate = 1
		}
	}
	else if _substate == 1 
	{
		subimg += 0.2
		dmg_to_take = 5
		if subimg > 4 {
			subimg = 3
			facing_lock = true
			_substate = 2
			
			instance_activate_object(hitbox_1)
			hitbox_1.image_xscale = 6.5
			hitbox_1.image_yscale = 3
		}
	}
	else if _substate == 2
	{
		subimg = 4
		hsp = 80 * facing
		timer++
		dmg_to_take = 0
		
		hitbox_1.x = x
		hitbox_1.y = y
		if abs(timer*hsp) > 600 {
			hsp = 0
			timer = 0
			_substate = 3
			
			
			
			hitbox_1.x = x + facing * 200
			
			arm_visible = true
			arm_angle = point_direction(x,y,player_obj.x,player_obj.y)
			arm_sprite = dada_guard_lunge_test
			arm_sprite_i = 6
			arm_off_x = 140
			arm_off_y = -15
		}
	}
	else if _substate == 3 
	{
		// logic might be fucked up here... say player hits them on the same frame that they enter substate 3
		// damage will be run before this code, so they won't take 10 damage
		// but the "if hit" below this will still be run.
		// check later
		dmg_to_take = 10
		subimg = 5 
		timer++
		if timer > 4 && timer < 6 {
			instance_deactivate_object(hitbox_1)
		}
		if hit {
			timer = 0
			facing_lock = false
			_state = _state_knockback
			if timer < 5 {
				instance_deactivate_object(hitbox_1)
			}
			arm_visible = false
			event_user(12) 
		}
		if timer>40 {
			timer = 0
			facing_lock = false
			_state = _state_defensive
			arm_visible = false
			event_user(12) 
		}
		
	}
	
	
}
else if _state == _state_poke
{
	
	dmg_to_take = 0
	
	
}
else if _state == _state_knockback
{
	sprite = dada_guard_idle_test
	dmg_to_take = 0
	hsp = lerp(hsp,0,0.2)
	image_blend = c_red
	timer++
	if timer>8 || hit {
		hsp = 0
		image_blend = c_white
		_state = _state_defensive
		event_user(12) 
	}
}
else if _state == _state_leapandplunge {
	sprite = dada_guard_leapandplunge
	if place_meeting(x,y,player_obj) {
		player_hit_during_plunge = true
	}
	
	if _substate == 0 { //crouch
		
		dmg_to_take = 2
		timer++
		facing = sign(player_obj.x-x)
		subimg = 0
		hsp = 0
		if timer>30 {
			timer = 0
			subimg = 1
			hsp = facing * 5
			vsp = -50
			_substate = 1
		}
		
	}
	else if _substate == 1 { //jumpin
		dmg_to_take = 3
		hsp *= 1.02
		vsp *= 0.9
		grav = 0
		subimg += 0.2
		if subimg>=3 {
			subimg = 1
		}
		if abs(player_obj.x + player_obj.hsp - x)<50 || abs(hsp)>200 {
			
			hsp = 0
			vsp = 0
			_substate = 2
			
			if queue_plunge_shockwave {
				timer = -20
			}
		}
	} else if _substate == 2 { // pause over the player
		dmg_to_take = 5
		subimg = 3
		timer++
		if queue_plunge_shockwave {
			image_blend = c_orange
		}
		if timer> 5 {
			subimg = 4
		}
		if timer>12 {
			grav = startgrav
			timer = 0
			vsp = 100
			_substate = 3
			image_blend = c_white
			
			instance_activate_object(hitbox_1)
			hitbox_1.image_xscale = 3
			hitbox_1.image_yscale = 7
			hitbox_1.x = x
			hitbox_1.y = y
		}
		
	} else if _substate == 3 { //go down
		dmg_to_take = 0
		subimg = 5
		hitbox_1.x = x
		hitbox_1.y = y
		
		if vsp == 0 {
			_substate = 4
			player_obj.shake_d=9
			player_obj.camera_shake_d = true
			
			player_obj.camera_shake_direc = true
			player_obj.cam_ang = degtorad(270)
			player_obj.shake_dir = 45
			instance_deactivate_object(hitbox_1)
			times_plunged++
			
			if queue_plunge_shockwave {
				shockwave1 = instance_create_depth(x,y+125,0,atk_shockwave_obj)
				shockwave1.local_obj = instance_place(x,y+10,wall_parent_obj)
				with shockwave1 {
					hsp = 15
					vsp = 0
					event_user(5)
				}
				shockwave2 = instance_create_depth(x,y+125,0,atk_shockwave_obj)
				shockwave2.hsp = -10
				shockwave2.local_obj = instance_place(x,y+10,wall_parent_obj)
				with shockwave2 {
					hsp = -15
					vsp = 0
					event_user(5)
				}
			}
		}
	} else if _substate == 4 { // release
		dmg_to_take = 10
		subimg = 6
		timer++
		if hit {
			timer = 0
			_state = _state_knockback
			event_user(12) 
		}
		if timer>20 {
			timer = 0
			_substate = 0
			
			if queue_plunge_shockwave {
				queue_plunge_shockwave = false
				_state = _state_defensive
				times_plunged = 0
			} else if times_plunged > 1 {
				_state = _state_leapandplunge
				queue_plunge_shockwave = true
			} else if player_hit_during_plunge { // if player was hit, stop plunging
				player_hit_during_plunge = false
				_state = _state_defensive
				times_plunged = 0
			} else {
				_state = choose(_state_leapandplunge,_state_defensive)
				if _state == _state_defensive {
					queue_plunge_shockwave = false
					times_plunged = 0
				}
			}
		}
	}
}
else if _state == _state_superthrow {
	
} else if _state == _state_shockwave {
	if _substate == 0 {
		sprite = dada_guard_shockwave_test
		hsp = 0
		dmg_to_take = 3
		image_blend = c_orange
		if timer<31 {
			subimg+=0.2
			subimg = min(subimg,2)
			timer++
		} else {
			subimg+=0.4
			subimg = min(subimg,5)
			if subimg == 5 {
				image_blend = c_white
				timer = 0
				_substate = 1
				grav = 0
				
				shockwave1 = instance_create_depth(x,y+125,0,atk_shockwave_obj)
				shockwave1.local_obj = instance_place(x,y+10,wall_parent_obj)
				with shockwave1 {
					hsp = 15
					vsp = 0
					event_user(5)
				}
				shockwave2 = instance_create_depth(x,y+125,0,atk_shockwave_obj)
				shockwave2.hsp = -10
				shockwave2.local_obj = instance_place(x,y+10,wall_parent_obj)
				with shockwave2 {
					hsp = -15
					vsp = 0
					event_user(5)
				}
				vsp = -100
			}
		}
	} 
	else if _substate == 1 {
		dmg_to_take = 3
		sprite = dada_guard_shockwave_test
		subimg = 5
		vsp = lerp(vsp,0,0.15)
		if place_meeting(x,y-50,wall_parent_obj) {
			_substate = 2
			vsp = -5
		}
	} 
	else if _substate == 2 {
		sprite = dada_guard_lunge_test
		subimg += 0.05
		dmg_to_take = 5
		if subimg > 4 {
			subimg = 3
			facing_lock = true
			_substate = 3
			
			instance_activate_object(hitbox_1)
			hitbox_1.image_xscale = 6
			hitbox_1.image_yscale = 3
		}
	}
	else if _substate == 3
	{
		subimg = 4
		hsp = 50 * facing
		timer++
		dmg_to_take = 0
		
		hitbox_1.x = x
		hitbox_1.y = y
		if place_meeting(x+facing,y,wall_parent_obj) {
			facing_lock = false
			instance_deactivate_object(hitbox_1)
			_substate = 4
		}
	}
	else if _substate == 4 {
		vsp = 6
		sprite = dada_guard_idle_test
		dmg_to_take = 10
		subimg = 0
		if hit {
			timer = 0
			_state = _state_knockback
			grav = startgrav
			event_user(12) 
		}
		if grounded {
			timer = 0
			_substate = 0
			_state = _state_defensive
		}
	}
}
else if _state == _state_swipe {
	hsp = 0
	if _substate == 0 {
		sprite = dada_guard_swipe_test
		
		_substate = 1
		instance_activate_object(hitbox_1)
		hitbox_1.image_xscale = 4
		hitbox_1.image_yscale = 4
		hitbox_1.x = x
		hitbox_1.y = y
		
	} 
	else if _substate == 1 {
		
		subimg += 0.12
		subimg = min(subimg,3.9999)
		
		timer++
		if timer>10 {
			instance_deactivate_object(hitbox_1)
		}
		if timer>50 || hit {
			
			_substate = 0
			_state = _state_defensive
			timer = 0
		}
		
	}
}

if grounded {
	vsp = min(vsp,0)
} else {
	vsp+=grav
}


moveX(hsp)
moveY(vsp)


if defense < 0 {
	defense = 0
	hsp = 0
	facing = sign(player_obj.x-x)
	_state = _state_guarddown
	event_user(12) 
}

mask_index = dada_guard_sword_hitbox