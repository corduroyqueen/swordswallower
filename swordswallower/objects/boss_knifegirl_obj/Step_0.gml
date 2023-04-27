//fuck yes
mask_index = knifegirl_walking_hitbox


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
	sprite = knifegirl_idle_test
	if wall_raycast_checker(player_obj) {
		ui_manager.health_bar_obj = id
		ui_manager.health_bar_active = true
		_state = _state_defensive
		event_user(12)
	}
}
else if _state == _state_defensive 
{
	sprite = knifegirl_idle_test
	subimg = held_knives
	
	dmg_to_take = 0
	
	hsp = 1 * sign(player_obj.x-x)
	
	if point_distance(x,y,player_obj.x,player_obj.y) < 150 {
		_state = _state_swipe
		subimg = 0
	}
	
	if hit {
		//defense_sword_addition *= -1
		
		//if sign(tail_obj.hsp)==facing {
		//	timer = 0
		//	_state = _state_knockback
		//	defense -= 10
		//	event_user(12)
		//}
	}
	
	initiate_attack_timer++
	if total_knives == 1 {
		if held_knives == 0 {
			if abs(player_obj.x-knife_1.x)<20 {
				_state = _state_tele_plunge
				selected_knife = knife_1
				timer = 0
				event_user(12)
			}
		
			if initiate_attack_timer>120 {
				initiate_attack_timer = 0
				subimg = 0
				timer = 0
			
				_state = _state_laser
				event_user(12)
			}
		} else {
			if initiate_attack_timer > 120 {
				initiate_attack_timer = 0
				subimg = 0
				//_state = _state_leapandplunge
				//_state = choose(_state_lunge,_state_leapandplunge,_state_shockwave)
				if held_knives>0 {
					selected_knife = knife_1
					_state = _state_throw
					event_user(12)
				}
			}
		}
	} else if total_knives == 2 {
		
	}
	
	
	
} else if _state == _state_guarddown {
	
	
} else if _state == _state_throw {
	hsp = 0
	sprite = knifegirl_throw_test
	if _substate == 0 {
		timer++
		if timer > 60 {
			_substate = 0
			_state = _state_defensive
			event_user(12)
		}
	} 
	
	
} else if _state == _state_tele_plunge {
	hsp = 0
	dmg_to_take = 2
	if _substate == 0 {
		sprite = knifegirl_plunge_test	
		subimg+=0.2
		if subimg>1.999 {
			subimg = 0
		}
		vsp = 40
	
		hitbox_1.x = x
		hitbox_1.y = y
	
		if grounded {
			_substate = 1
			
		}
	} else if _substate == 1 {
		sprite = knifegirl_idle_test
		instance_deactivate_object(hitbox_1)
		timer++
		if timer > 40 {
			_state = _state_defensive
			vsp = 0
			event_user(12)
		}
	}
	
	
} else if _state == _state_tele_aoe {
	
	
} else if _state == _state_tele_jump {
	
	
} else if _state == _state_laser {
	hsp = 0
	dmg_to_take = 5
	if _substate == 0 {
		timer++
		
		if timer>120 {
			selected_knife = knife_1
			selected_knife.laser = true
			selected_knife.shoot_angle = point_direction(selected_knife.x,selected_knife.y,player_obj.x,player_obj.y)
			_substate = 1
			timer = 0
		}
	} else if _substate == 1 {
		timer++
		if timer>120 {
			selected_knife.laser = false
			selected_knife.laser_obj.x = 0
			selected_knife.laser_obj.y = 0
			timer = 0
			_substate = 0
			_state = _state_defensive
			event_user(12)
		}
		
	}
	
} else if _state == _state_knife_magnet {
	
	
} else if _state == _state_swipe {
	hsp = 0
	if _substate == 0 {
		sprite = knifegirl_idle_test
		image_blend = c_red
		
		_substate = 1
		instance_activate_object(hitbox_1)
		hitbox_1.image_xscale = 3
		hitbox_1.image_yscale = 3
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
			image_blend = c_white
		}
		
	}
	
} else if _state == _state_spawn_second_knife {
	
	
} else if _state == _state_second_tele_jump {
	
	
} else if _state == _state_second_tele_laser {
	
	
} else if _state == _state_second_tele_ordered {
	
	
} else if _state == _state_knockback {
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

mask_index = knifegirl_sword_hitbox