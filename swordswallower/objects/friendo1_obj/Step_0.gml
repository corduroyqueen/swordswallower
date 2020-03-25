/// @description Insert description here
// You can write your code in this editor
if death {
	just_blood(tail_obj.hspeed,tail_obj.vspeed,0.2,30,false,sprite_width/4,sprite_height)
	instance_destroy()
}

my_floor = instance_place(x,y+1,wall_obj)
player_floor = player_obj.current_platform

if my_floor==player_floor {
	state = state_chasing
} else {
	state = state_idle	
}

if state==state_chasing {
	if player_obj.x<x {
		hspeed-=h_accel	
		image_xscale = -1
	} else {
		hspeed+=h_accel	
		image_xscale = 1
	}
} 

if state==state_idle {
	if(abs(hspeed) < h_decel){
		hspeed=0;	
	} else {
		hspeed-=sign(hspeed) * h_decel;	
	}
}


//vspeed+=grav
hspeed=0

hspeed = clamp(hspeed,-h_max_speed,h_max_speed)