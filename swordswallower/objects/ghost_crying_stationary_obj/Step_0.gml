/// @description Insert description here
// You can write your code in this editor
tear_timer++
if tear_timer>tear_timer_spawn {
	tear_timer=0
	instance_create_depth(x,y+32,depth+1,tear_obj)
}