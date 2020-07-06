/// @description Insert description here
// You can write your code in this editor

if locked {
	vspeed=0
	hspeed=0
} else {
	vspeed+=0.5
	if position_meeting(x,y+vspeed+1,wall_obj) {
		 alarm[0] = random_range(100,200)
		locked = true
		//y-=vspeed
		vspeed=0
	}
}
