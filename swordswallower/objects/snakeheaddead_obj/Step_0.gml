/// @description Insert description here
// You can write your code in this editor
if !wall_checker(x,y+1) {
	vspeed+=0.6
} else {
	vspeed=0
	
	if(abs(hspeed) < h_decel){
		hspeed=0;	
	} else {
		hspeed-=sign(hspeed) * h_decel;	
	}
	
}
if abs(spinspeed)>3 {
	image_angle+=spinspeed
	spinspeed-=sign(spinspeed)
	if wall_checker(x+1,y) || wall_checker(x-1,y) {
		spinspeed=0	
	}
}

