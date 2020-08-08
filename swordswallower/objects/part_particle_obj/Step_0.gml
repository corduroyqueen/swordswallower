/// @description Insert description here
// You can write your code in this editor

if locked {
	vsp=0
	hsp=lerp(hsp,0,0.15)
} else {
	if step==0 {
		step=0.5	
	}
	vsp+=step
	if place_meeting(x,y,wall_obj) {
		rotation_speed/=5
		while(place_meeting(x,y,wall_obj)) {
			x-=hsp/2
			y-=vsp/2
		}
	}
	if place_meeting(x,y+1,wall_obj) {
		locked = true	
	}
	
}

if rotation_speed>0 {
	rotation_speed-=random_range(0.01,0.05)	
}
rotation_speed = max(0,rotation_speed)
image_angle+= rotation_speed * rotation_dir
