/// @description Insert description here
// You can write your code in this editor
if death {
	just_blood(tail_obj.hsp,tail_obj.vsp,0.2,30,false,sprite_width/4,sprite_height)
	instance_destroy(id)
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
		hsp-=h_accel	
		image_xscale = -1
	} else {
		hsp+=h_accel	
		image_xscale = 1
	}
} 

if state==state_idle {
	if(abs(hsp) < h_decel){
		hsp=0;	
	} else {
		hsp-=sign(hsp) * h_decel;	
	}
}


//vsp+=grav
hsp=0

hsp = clamp(hsp,-h_max_speed,h_max_speed)