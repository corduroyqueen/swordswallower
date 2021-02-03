/// @description Insert description here
// You can write your code in this editor
if hp<=0 {
	instance_destroy(id)
}

if state==state_idle {
	if distance_to_object(player_obj)<1250 && in_camera_range(x,y) {
		if wall_raycast_checker(player_obj) {
			state = state_preparing
		}
	}
} else {
	if !wall_raycast_checker(player_obj) && !in_camera_range(x,y) {
		state=state_idle
		shoot_timer_t = 0
	}
	if state==state_preparing {
		shoot_timer_t++
		if shoot_timer_t>shoot_timer_t_m {
			state = state_attacking
			shoot_timer_t = 0
		}
	} else if state==state_attacking {
		ang = point_direction(x,y,player_obj.x,player_obj.y)
		var degstep = 60
		for(i=0;i<3;i++) {
			
			proj = instance_create_depth(x,y,depth+1,spore_plant_proj_obj)
			proj.x = x + cos(degtorad((ang-degstep)+(i*degstep)))*50
			proj.y = y - sin(degtorad((ang-degstep)+(i*degstep)))*50
			proj.targetx = x + cos(degtorad((ang-degstep)+(i*degstep)))*220
			proj.targety = y - sin(degtorad((ang-degstep)+(i*degstep)))*220
			proj.parent = self
			
		}
		state=state_preparing
	}
}

if hit {
	hp-=1
	just_blood(0,0,0.2,10,false,sprite_width,sprite_height)	
	audio_manager(false,0,false,3)
	hit = false
}