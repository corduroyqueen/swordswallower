/// @description Insert description here
// You can write your code in this editor

if death {
	instance_destroy()	
	for (i=0;i<24;i++){
		yo = instance_create_depth(x,y,101,fire_particle_obj)	
		yo.rval = irandom_range(3,4)
		yo.hsp = cos(degtorad(i*30)) * 5 + tail_obj.hsp/20
		yo.vsp = sin(degtorad(i*30)) * 5 + tail_obj.vsp/20
		yo.deprate=0.1
	}
}
 else {
if player_obj.tail_pulling && met {
	
	//tail_obj.pull_timer=tail_obj.pull_wall_t
	
	player_obj.pull_timer = 0
	sword_lock = false
	hsp = tail_obj.hsp/7
	vsp = tail_obj.vsp/7
	
}

if player_obj.tail_carry {
	sword_lock = false
	if !player_obj.zoom_timer_bool {
		met = false	
	}
}

if met {
	if mouse_check_button_pressed(mb_left) {
		audio_play_sound(Knife_Pull_140,0,false)	
	}
}
if sword_lock {
	tail_obj.x = x + swordx
	tail_obj.y = y + swordy
	tail_obj.inside_flier = true
	tail_obj.current_obj = self
	if player_obj.gem_active {
		sword_lock = false
		player_obj.tail_planted=false
		tail_obj.inside_flier = false
		player_obj.tail_pulling = true
		death = true	
	}
}


if active {
	if x>player_obj.x {
		image_xscale = 1
	} else {
		image_xscale = -1
	}
	
	
	if distance_to_object(player_obj)>600 {
		move_towards_point(player_obj.x,player_obj.y,9)	
	} else {
		atk_timer++
		if atk_timer>200 {
			dart=instance_create_depth(x,y+10,101,wooden_fly_dart_obj)
			atk_timer=0
		}
		if go_right {
			hsp = lerp(hsp,hs_max,0.1)
			if place_meeting(x+100,y,wall_obj) || (x-player_obj.x)>400 {
				go_right = false	
			}
		} else {
			hsp = lerp(hsp,-hs_max,0.1)	
			if place_meeting(x-100,y,wall_obj) || (x-player_obj.x)<-400  {
				go_right = true	
			}
		}
		if go_down {
			vsp = lerp(vsp,vs_max,0.1)
			if distance_to_object(player_obj)<100 || place_meeting(x,y+150,wall_obj) {
				go_down = false	
			}
		} else {
			vsp = lerp(vsp,-vs_max,0.1)
			if distance_to_object(player_obj)>500 || place_meeting(x,y-50,wall_obj) {
				go_down = true
			}
		}
	}
	
	
	
} else {
	
	if distance_to_object(player_obj)<700 {
		if collision_line(x,y,player_obj.x,player_obj.y,wall_obj,false,true)==noone 
		&& collision_line(x,y,player_obj.x,player_obj.y,door_obj,false,true)==noone 
		&& collision_line(x,y,player_obj.x,player_obj.y,break_wall_obj,false,true)==noone {
			active = true
			if x>player_obj.x {
				go_right=false
			} else {
				go_right = true
			}
		}
	}
	
}
 }