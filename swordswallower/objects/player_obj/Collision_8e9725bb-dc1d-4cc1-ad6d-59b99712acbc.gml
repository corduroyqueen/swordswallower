/// @description Insert description here
// You can write your code in this editor


if other.state = 0 {
	if (bounce_buff_timer>0 || zoom_timer_bool) && other.met {
	
		hsp*=0.5
		vsp*=0.5
		hsp = clamp(hsp,-zspeed,zspeed)
		vsp = clamp(vsp,-zspeed,zspeed)
		//sdm("FLY collision")
	
		//hit_pause = 10
	
		tail_planted = false
		tail_pulling = true
	
		other.death = true
		other.sword_lock = false
	
		//tail_carry = true
		zoom_timer_bool = false
		zoom_timer = 0
	
		bounce_buff_timer=0
	
	} else if (bounce_buff_timer>0 || zoom_timer_bool) {
	
		reset_intangibility()
	
		other.death = true
		zoom_timer_bool = false
		zoom_timer = 0
		hsp*=0.5
		vsp*=0.5
		hsp = clamp(hsp,-zspeed,zspeed)
		vsp = clamp(vsp,-zspeed,zspeed)
		//default_collision(other)
	} 
}