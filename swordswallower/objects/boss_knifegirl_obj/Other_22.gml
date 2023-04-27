_substate = 0
timer = 0
switch _state {
	case _state_dummy:
	break
	case _state_idle:
	break
	case _state_defensive:
	break
	case _state_guarddown:
	break
	case _state_tele_plunge:
		x = selected_knife.x
		y = selected_knife.y
		while place_meeting(x,y,wall_parent_obj) {
			y+=1
		}
		instance_activate_object(hitbox_1)
		hitbox_1.image_xscale = 3
		hitbox_1.image_yscale = 3
		hitbox_1.x = x
		hitbox_1.y = y
		held_knives++
		selected_knife.current_obj = noone
		instance_deactivate_object(selected_knife)
		
	break
	case _state_tele_aoe:
	break
	case _state_tele_jump:
	break
	case _state_laser:
		ok = instance_create_depth(x,y,0,gathering_power_animation_obj)
		ok.lifespan = 80
		ok.alarm[0] = ok.lifespan
		
		ok = instance_create_depth(selected_knife.x,selected_knife.y,0,gathering_power_animation_obj)
		ok.lifespan = 80
		ok.alarm[0] = ok.lifespan
	break
	case _state_knife_magnet:
	break
	case _state_swipe:
	break
	case _state_spawn_second_knife:
	break
	case _state_second_tele_jump:
	break
	case _state_second_tele_laser:
	break
	case _state_second_tele_ordered:
	break
	case _state_throw:
		_substate = 0
		instance_activate_object(selected_knife)
		selected_knife.x=x
		selected_knife.y=y
		var ang = random_range(pi/4, pi * 0.75)
		selected_knife.hsp = cos(ang) * knife_throw_speed
		selected_knife.vsp = -sin(ang) * knife_throw_speed
		held_knives--
	break
	case _state_knockback:
		facing = sign(tail_obj.x - x)
		hsp = 30 * -facing
	break
	
}