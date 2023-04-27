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
		if instance_exists(shockwave1) {
			instance_destroy(shockwave1)
		}
		if instance_exists(shockwave2) {
			instance_destroy(shockwave2)
		}
	break
	case _state_lunge:
		timer=0
		substate = 0
	break
	case _state_poke:
	break
	case _state_knockback:
		facing = sign(tail_obj.x - x)
		hsp = 30 * -facing
	break
	
}