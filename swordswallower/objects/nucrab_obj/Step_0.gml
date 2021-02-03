/// @description Insert description here
// You can write your code in this editor
if fly_hp<=0 {
	death = true
	
}

if place_meeting(x,y,tar_obj) {
	vsp=0.3	
	hsp = lerp(hsp,0,0.2)
	tartimer++
	if tartimer>200 {
		death = false	
	}
} else {
	tartimer=0	
}
if last_fly_hp==fly_hp {
	
} else if fly_hp <= last_fly_hp-1 {
	for(i=0;i<last_fly_hp-fly_hp;i++){
		just_blood(random_range(-10,10),random_range(-10,10),0.2,80,true,sprite_width/4,sprite_height)
	}
	audio_manager(false,0,false,3)
} 

if h_max_speed<2.4 {
	h_max_speed = lerp(h_max_speed,2.5,0.04)
}

if writhing = true {
	falling = false
	if place_meeting(x,y+1,wall_obj) || 
	place_meeting(x,y+1,break_wall_obj) || 
	place_meeting(x,y+1,door_obj) ||
	place_meeting(x,y+1,black_wall_obj) {
		hsp = lerp(hsp,0,0.2)
		vsp = 0
	}
	if !heldbymonster {
		if fallingoverride {
			if place_meeting(x,y,tail_obj) && !player_obj.tail_carry && override_killready {
				death = true
			}
		} else if place_meeting(x,y,tail_obj) && !player_obj.tail_carry {
			death = true	
		}
	}
	
}

if !fallingoverride {
	if (player_obj.tail_throwing || tail_obj.pull_timer>=tail_obj.pull_wall_t) && !met && !death {
		if place_meeting(x,y,tail_obj) {
			lang = image_angle
			while lang>360 {
				lang-=360	
			}
			while lang<0 {
				lang+=360
			}
			
			if 
			
			((player_obj.tail_throwing && abs(point_direction(player_obj.start_throw_x,player_obj.start_throw_y,tail_obj.x,tail_obj.y)-walkang)>90) 
			||
			(player_obj.tail_pulling && abs(point_direction(tail_obj.x,tail_obj.y,player_obj.x,player_obj.y)-walkang)<90))
			{
				
				sword_present = true
				sword_hold_x = (tail_obj.x-x)
				sword_hold_y = (tail_obj.y-y)
				audio_manager(gsound.s_sword_hit_shell,0,false,0)
				player_obj.tail_throwing = false
				player_obj.tail_pulling = false
				player_obj.tail_planted = true
			} else {
				
				sword_present = true
				sword_hold_x = (tail_obj.x-x)
				sword_hold_y = (tail_obj.y-y)
				audio_manager(gsound.s_sword_hit_shell,0,false,0)
				player_obj.tail_throwing = false
				player_obj.tail_pulling = false
				player_obj.tail_planted = true
			}
		}
		
	} 
}


if player_obj.tail_carry {
	met = false	
}



if place_meeting(x,y+1,wall_obj) {
	
} else {
	//vsp+=grav
}

if sword_present {
	var lmao
	if going_right { lmao = -1 } else { lmao = 1 }
	
	met = true
	tail_obj.hsp = 0
	tail_obj.vsp = 0
	tail_obj.y = y + sword_hold_y
	tail_obj.x = x + (sword_hold_x * lmao)
	tail_obj.inside_flier = true
	tail_obj.current_obj = self
	
	if player_obj.tail_pulling {
		sword_present = false	
		audio_play_sound(Knife_Pull_140,0,false)	
		fallingoverride = true
		hsp = 0
		vsp = 0
		move_towards_point(player_obj.x,player_obj.y,6)
		hsp*=0.2
		vsp-=2
		
	}
}

if death {
	just_blood(tail_obj.hsp,tail_obj.vsp,0.1,20,true,sprite_width,sprite_height)
	audio_manager(false,0,false,3)
	if sword_present {
		player_obj.tail_planted = false
		player_obj.tail_pulling = true
	}
	//audio_manager(gsound.s_sword_hit_shell,0,false,0)
	instance_destroy(id)	
	
}

if !fallingoverride {
	offsetx = -20 * cos(degtorad(walkang))
	offsety = 20 * sin(degtorad(walkang))
	
	if !place_meeting(x+offsetx,y+offsety,wall_obj) && 
	!place_meeting(x+offsetx,y+offsety,break_wall_obj) && 
	!place_meeting(x+offsetx,y+offsety,door_obj) && 
	!place_meeting(x+offsetx,y+offsety,black_wall_obj) {
		falling = true
		if (place_meeting(x+offsetx,y+offsety,wall_obj) && 
		!place_meeting(x+offsetx,y+offsety,break_wall_obj) && 
		!place_meeting(x+offsetx,y+offsety,door_obj)) ||
		(place_meeting(x+offsetx,y+offsety,black_wall_obj) && 
		!place_meeting(x+offsetx,y+offsety,break_wall_obj) && 
		!place_meeting(x+offsetx,y+offsety,door_obj)) {
			writhing = true
		}
	}	

//if dir_lwall | dir_rwall {
//	if !place_meeting(x,y+1,wall_obj) && !place_meeting(x,y+1,break_wall_obj) && !place_meeting(x,y+1,door_obj) {
//		 += grav
//		walk_dir = 0
//		falling = true
//	} else {
//		falling = false
//	}
//}

	if !falling && !writhing {
		if going_right {
			hsp = lerp(hsp,h_max_speed * sin(degtorad(walkang)),0.1)
			vsp = lerp(vsp,h_max_speed * cos(degtorad(walkang)),0.1)
			//if !going_right { return }
			image_xscale = -1
		} else {
			
			hsp = lerp(hsp,h_max_speed * -sin(degtorad(walkang)),0.1)
			vsp = lerp(vsp,h_max_speed * -cos(degtorad(walkang)),0.1)
			image_xscale = 1
			
			//if going_right { return }
		}
		if wall_detect(x+hsp*10,y+vsp*10)
		|| !place_meeting(
		x+hsp*20+(-10 * cos(degtorad(walkang))),
		y+vsp*20+(10 * sin(degtorad(walkang))),
		local_obj)
		 {
				going_right = !going_right
		}
	}
	
	
} else {
	while place_meeting(x,y,local_obj) {
		x+=cos(degtorad(walkang))
		y+=-sin(degtorad(walkang))
	}
	vsp+=grav
	
	if (place_meeting(x,y+1,wall_obj) && 
	!place_meeting(x,y+1,break_wall_obj) && 
	!place_meeting(x,y+1,door_obj)) ||
	(place_meeting(x,y+1,black_wall_obj) && 
	!place_meeting(x,y+1,break_wall_obj) && 
	!place_meeting(x,y+1,door_obj)){
		writhing = true
	}
	if player_obj.tail_carry {
		override_killready = true	
	}
	
	image_angle = lerp(image_angle,180,0.15)
	
}

last_fly_hp = fly_hp

//if(abs(hsp) < h_decel){
//	hsp=0;	
//} else {
//	hsp-=sign(hsp) * h_decel;	
//}

