/// @description Insert description here
// You can write your code in this editor

timer--

if timer<=0 {
	
	beep = instance_create_depth(x,y,0,fatfly_obj)
	beep.move_right = true
	
	timer = timer_start
}