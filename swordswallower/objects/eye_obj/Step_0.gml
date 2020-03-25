/// @description Insert description here
// You can write your code in this editor



if player_obj.tail_carry {
	hp = 2	
}
if hp <=0 {
	death = true	
}

if death {
	instance_destroy()	
	for (i=0;i<24;i++){
		yo = instance_create_depth(x,y,101,fire_particle_obj)	
		yo.rval = irandom_range(3,4)
		yo.hspeed = cos(degtorad(i*30)) * 5 + tail_obj.hspeed/20
		yo.vspeed = sin(degtorad(i*30)) * 5 + tail_obj.vspeed/20
		yo.deprate=0.1
	}
} else {
	if hp>1 {
		sprite_index = twohit_guy
	} else {
		sprite_index = twohit_guy_wounded
	}
	 
	if player_obj.tail_pulling && met {
	
		//tail_obj.pull_timer=tail_obj.pull_wall_t
	
		player_obj.pull_timer = 0
		sword_lock = false
		hspeed = tail_obj.hspeed/7
		vspeed = tail_obj.vspeed/7
	
	}

	if player_obj.tail_carry {
		sword_lock = false
		if !player_obj.zoom_timer_bool {
			met = false	
		}
	}

	if player_obj.tail_planted {
		met = false	
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
				hspeed = lerp(hspeed,hs_max,0.1)
				if place_meeting(x+100,y,wall_obj) || (x-player_obj.x)>400 {
					go_right = false	
				}
			} else {
				hspeed = lerp(hspeed,-hs_max,0.1)	
				if place_meeting(x-100,y,wall_obj) || (x-player_obj.x)<-400  {
					go_right = true	
				}
			}
			if go_down {
				vspeed = lerp(vspeed,vs_max,0.1)
				if distance_to_object(player_obj)<100 || place_meeting(x,y+150,wall_obj) {
					go_down = false	
				}
			} else {
				vspeed = lerp(vspeed,-vs_max,0.1)
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