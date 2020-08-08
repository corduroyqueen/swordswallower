/// @description Insert description here
// You can write your code in this editor

if locked {
	vsp=0
	hsp=0
} else {
	vsp+=0.5
	if position_meeting(x,y+vsp+1,wall_obj) {
		 alarm[0] = random_range(100,200)
		locked = true
		//y-=vsp
		vsp=0
	}
}
