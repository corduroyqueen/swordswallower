/// @description Insert description here
// You can write your code in this editor

my_floor = instance_place(x,y+1,wall_obj)
player_floor = player_obj.current_platform

if player_obj.tail_carry {
	met = false	
}

if state!=state_hitting {
	if my_floor==player_floor && my_floor!= -4  {
		state = state_chasing
	} else {
		state = state_idle	
	}
}

if death {
	just_blood(tail_obj.hspeed,tail_obj.vspeed,0.2,80,true,sprite_width/4,sprite_height)
	title_obj.sprite_index = sprite90
	instance_destroy()	
}

if sword_present {
	var lmao
	if facing_right { lmao = 1 } else { lmao = -1 }
	
	
	tail_obj.y = y + sword_hold_y
	tail_obj.x = x + (abs(sword_hold_x) * lmao)
	image_xscale = lmao
	
	var facingdir
	
	if facing_right {
			
		if mouse_check_button_pressed(mb_left) && player_obj.x<x {
			player_obj.tail_held = false
			player_obj.tail_pulling = true
			tail_obj.pull_timer=tail_obj.pull_wall_t
			death = true
			
		}
		facingdir = 1
	} else {
		if mouse_check_button_pressed(mb_left) && player_obj.x>x {
			player_obj.tail_held = false
			player_obj.tail_pulling = true
			tail_obj.pull_timer=tail_obj.pull_wall_t
			death = true
		}
		facingdir=-1
	}
	
	particlect++
	
	if particlect==1 {
		particle = instance_create_depth(x + (abs(sword_hold_x)*facingdir),y+sword_hold_y,-1,blood_obj)
	
		var scalevar = random_range(0.2,2)
		particle.image_xscale = scalevar
		particle.image_yscale = scalevar
		particle.hspeed = random_range(0.01,1) * facingdir + hspeed
		particle.vspeed = random_range(0.01,1) * facingdir + vspeed
		particlect = false
	} 
	if particlect>120{
		particlect=0	
	}
	
}

if state==state_chasing {
	
	if player_obj.x<x {
		hspeed-=h_accel	
		image_xscale = -1
		facing_right = false
	} else {
		hspeed+=h_accel	
		image_xscale = 1
		facing_right = true
	}
	sprite_index = intimidating_walk
	image_speed = 0.75
	
	
} 

if state==state_idle {
	sprite_index = intimidating	
}




if state==state_idle || state==state_hitting {
	if(abs(hspeed) < h_decel){
		hspeed=0;	
	} else {
		hspeed-=sign(hspeed) * h_decel;	
	}
}

if state==state_hitting {
	hit_timer--
	if hit_timer>0 {
		
	} else {
		sprite_index = intimidating_hit
		if image_index<8 {
			image_speed = 1.5
		} else {
			image_speed = 0	
		}
	}
	if hit_timer<-100 {
		sprite_index = intimidating
		
		
		
	}
	if hit_timer<-120 {
		state = state_idle
		hit_timer = 0
	}
} else {
	if abs(x-player_obj.x)<125 {
		state=state_hitting	
		hit_timer = 10
	}	
}

if place_meeting(x,y+1,wall_obj) {
	
} else {
	vspeed+=grav
}

hspeed = clamp(hspeed,-h_max_speed,h_max_speed)