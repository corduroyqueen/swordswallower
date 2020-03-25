/// @description Insert description here
// You can write your code in this editor
if (bounce_buff_timer>0 || zoom_timer_bool) && other.met {
	
	hspeed*=0.5
	vspeed*=0.5
	hspeed = clamp(hspeed,-zspeed,zspeed)
	vspeed = clamp(vspeed,-zspeed,zspeed)
	//sdm("FLY collision")
	
	//hit_pause = 10
	
	tail_planted = false
	tail_pulling = true
	
	other.sword_lock = false
	
	//tail_carry = true
	zoom_timer_bool = false
	zoom_timer = 0
	
	bounce_buff_timer=0
	
} else if (bounce_buff_timer>0 || zoom_timer_bool) {
	
	reset_intangibility()
	
	zoom_timer_bool = false
	zoom_timer = 0
	hspeed*=0.5
	vspeed*=0.5
	hspeed = clamp(hspeed,-zspeed,zspeed)
	vspeed = clamp(vspeed,-zspeed,zspeed)
	//default_collision(other)
} else  {
	
	default_collision(other)
}