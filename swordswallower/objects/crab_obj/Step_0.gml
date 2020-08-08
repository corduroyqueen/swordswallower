/// @description Insert description here
// You can write your code in this editor
if fly_hp<=0 {
	death = true
	
}
if last_fly_hp==fly_hp {
	
} else if fly_hp <= last_fly_hp-1 {
	for(i=0;i<last_fly_hp-fly_hp;i++){
		just_blood(random_range(-10,10),random_range(-10,10),0.2,80,true,sprite_width/4,sprite_height)
	}
	audio_manager(false,0,false,3)
} 

if writhing = true {
	falling = false
	walk_dir = 0	
	walk_perp = 0
	if place_meeting(x,y+1,wall_obj) || place_meeting(x,y+1,break_wall_obj) || place_meeting(x,y+1,door_obj) {
		hsp = lerp(hsp,0,0.2)
		vsp = 0
	}
	
	if fallingoverride {
		if place_meeting(x,y,tail_obj) && !player_obj.tail_carry && override_killready {
			death = true
		}
	} else if place_meeting(x,y,tail_obj) && !player_obj.tail_carry {
		death = true	
	}
	
}

if !fallingoverride {
	if (player_obj.tail_throwing || tail_obj.pull_timer>=tail_obj.pull_wall_t) && !met && !death {
		if place_meeting(x,y,tail_obj) {
			crab_wall_checker()
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

walk_dir = clamp(walk_dir,-h_max_speed,h_max_speed)	
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
		hsp*=0.5
		if dir_ground {
			vsp-=2	
		}
		if dir_ceiling {
			vsp*=0.5	
		}
		
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
	instance_destroy()	
	
}

if !fallingoverride {

	if dir_ground {
		if !place_meeting(x,y+1,wall_obj) && !place_meeting(x,y+1,break_wall_obj) && !place_meeting(x,y+1,door_obj) {
			walk_perp += grav
			walk_dir = 0
			falling = true
		} else {
			falling = false
		}
	}

	if dir_ceiling && writhing == false {
		if !place_meeting(x,y-1,wall_obj) && !place_meeting(x,y-1,break_wall_obj) && !place_meeting(x,y-1,door_obj) {
			walk_perp += grav
			walk_dir = 0
			falling = true
			if place_meeting(x,y+1,wall_obj) && !place_meeting(x,y+1,break_wall_obj) && !place_meeting(x,y+1,door_obj) {
				writhing = true
			}
		}	
	}

//if dir_lwall | dir_rwall {
//	if !place_meeting(x,y+1,wall_obj) && !place_meeting(x,y+1,break_wall_obj) && !place_meeting(x,y+1,door_obj) {
//		walk_perp += grav
//		walk_dir = 0
//		falling = true
//	} else {
//		falling = false
//	}
//}

	if !falling && !writhing {
		if going_right {
			walk_dir+=h_accel
			if dir_ground || dir_lwall {
				image_xscale = -1
			} else {
				image_xscale = 1
			}
			switch_direction(1,dir_ground,70,false,crab_obj)
			//if !going_right { return }
		} else {
			walk_dir-=h_accel	
			if dir_ground || dir_lwall {
				image_xscale = 1
			} else {
				image_xscale = -1
			}
	
			switch_direction(-1,dir_ground,70,true,crab_obj)
			//if going_right { return }
		}
	}
	
	if dir_ground || dir_ceiling {
		hsp = walk_dir
		vsp = walk_perp
	
	} else {
		hsp = walk_perp
		vsp = walk_dir
	}
} else {
	vsp+=grav
	
	if place_meeting(x,y+1,wall_obj) && !place_meeting(x,y+1,break_wall_obj) && !place_meeting(x,y+1,door_obj) {
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

