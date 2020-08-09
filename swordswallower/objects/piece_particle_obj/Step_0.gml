/// @description Insert description here
// You can write your code in this editor

if locked {
	vsp=0
	hsp=0
} else {
	if step==0 {
		step=0.5	
	}
	vsp+=step
	
	moveX(hsp)
	if vsp>=0 && moveBoolY(vsp) {
		locked = true	
	}
}
