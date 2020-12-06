/// @description Insert description here
// You can write your code in this editor
if death {
	x = tail_obj.x
	y = tail_obj.y
	just_blood(tail_obj.hsp,tail_obj.vsp,0.2,30,false,tail_obj.x,tail_obj.y)
	parent.death = true
	audio_manager(false,0,false,3)
	instance_destroy()
}
met = parent.met