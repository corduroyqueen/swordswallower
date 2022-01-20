//fuck yes
if _state==STATE_DEFAULT {
	
	
	
} else if _state==STATE_IDLE {
	throw_timer++
	if throw_timer>100 && wall_raycast_checker(player_obj) {
		obj_boomerang.x = x
		obj_boomerang.y = y+100
		throw_timer=0
		_state = STATE_THROWING_BOOMERANG
	}
	
} else if _state==STATE_THROWING_BOOMERANG {
	timer_throw_boomerang_t++
	if timer_throw_boomerang_t<70 {
		obj_boomerang.hsp = 15
	} else if timer_throw_boomerang_t<110 {
		obj_boomerang.hsp-=0.4
		obj_boomerang.vsp=-7
		y -= 6
	} else if timer_throw_boomerang_t<150 {
		obj_boomerang.hsp-=0.6
		obj_boomerang.vsp=-7
		y -= 6
	} else if timer_throw_boomerang_t<320 {
		obj_boomerang.vsp=0
		y = room_center_y - 200
	}
	
	if timer_throw_boomerang_t>50 && distance_to_object(obj_boomerang)<10 {
		_state = STATE_IDLE
		obj_boomerang.x=0
		obj_boomerang.y=0
		timer_throw_boomerang_t=0
	}
	
	with obj_boomerang {
		x += hsp
		y += vsp
	}
	
	
}