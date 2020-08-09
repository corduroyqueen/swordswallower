/// @description Insert description here
// You can write your code in this editor

if locked {
	vsp=0
	hsp=0
} else {
	vsp+=0.5
	moveX(hsp)
	if vsp>=0 && moveBoolY(vsp) {
		alarm[0] = random_range(100,200)
		locked = true
	}
}
