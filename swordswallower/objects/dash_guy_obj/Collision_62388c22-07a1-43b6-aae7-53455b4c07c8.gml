/// @description Insert description here
// You can write your code in this editor
if !other.zoom_timer_bool && !sword_lock{
	damage_script(10,sign(player_obj.x-x),5,-1)	
	death = true
} else if other.zoom_timer_bool {
	other.hspeed*=0.5
	other.vspeed*=0.5
	other.hspeed = clamp(other.hspeed,-other.zspeed,other.zspeed)
	other.vspeed = clamp(other.vspeed,-other.zspeed,other.zspeed)
	//sdm("FLY collision")
	
	//hit_pause = 10
	
	other.tail_planted = false
	other.tail_pulling = true
	
	death = true
	sword_lock = false
	
	//tail_carry = true
	other.zoom_timer_bool = false
	other.zoom_timer = 0
	
	other.bounce_buff_timer=0	
	reset_intangibility()
}