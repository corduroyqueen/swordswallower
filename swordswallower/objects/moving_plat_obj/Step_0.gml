/// @description Insert description here
// You can write your code in this editor

timer++
if timer>200 {
	timer = 0
	vsp = -sign(vsp) * mspeed
}

if in_camera_range_bigger(x,y) {
	moving_plat_move(hsp,vsp)
} else {
	moveZoomX(hsp)	
	moveZoomY(vsp)	
}