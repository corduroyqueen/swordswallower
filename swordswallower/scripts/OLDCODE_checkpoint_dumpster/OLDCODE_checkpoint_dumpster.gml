/*
if place_meeting(x,y,checkpoint_manager.checkpoint) {
		
	if keyoard_check_pressed(ord("E")) {
		if !instance_place(x,y,checkpoint_manager.checkpoint).setpoint {
			instance_destroy(checkpoint_manager.checkpoint)
			level1_master.checkpoints[checkpoint_num] = 0
			checkpoint_num--
	
			level1_master.available_checkpoints++
			checkpoint_manager.checkpoint = level1_master.checkpoints[checkpoint_num-1]
	
			checkpoint_manager.rx = checkpoint_manager.checkpoint.x
			checkpoint_manager.ry = checkpoint_manager.checkpoint.y
			level1_master.checkpoint_num = checkpoint_num
			start_ckpt_timer=0
			//player_obj.tail_planted = false
			//player_obj.tail_pulling = true
			ckpt_place_toggle = false
				
		}
	}*/
	
//	if in_camera_range(checkpoint_manager.checkpoint.x,checkpoint_manager.checkpoint.y)
/*if point_distance(x,y,checkpoint_manager.checkpoint.x,checkpoint_manager.checkpoint.y)<100
&& !checkpoint_manager.checkpoint.setpoint {
	if keboard_check_pressed(vk_space) {
			
		//if !instance_place(x,y,checkpoint_manager.checkpoint).setpoint {
		checkpoint_particle_script(x,y,24)
		checkpoint_particle_script(checkpoint_manager.checkpoint.x,checkpoint_manager.checkpoint.y,8)
		instance_destroy(checkpoint_manager.checkpoint)
		level1_master.checkpoints[checkpoint_num] = 0
		checkpoint_num--
	
		level1_master.available_checkpoints++
		checkpoint_manager.checkpoint = level1_master.checkpoints[checkpoint_num-1]
	
		checkpoint_manager.rx = checkpoint_manager.checkpoint.x
		checkpoint_manager.ry = checkpoint_manager.checkpoint.y
		level1_master.checkpoint_num = checkpoint_num
		start_ckpt_timer=0
		//player_obj.tail_planted = false
		//player_obj.tail_pulling = true
		ckpt_place_toggle = false
		kyboard_clear(vk_space) 
		//}
	}
		
} else {
	if kyboard_check_pressed(vk_space) && level1_master.available_checkpoints>=1 && 
	grounded  {
		oog = instance_create_depth(x,y,0,checkpoint1)	
		hp=2
		checkpoint_particle_script(x,y,36)
		level1_master.checkpoints[checkpoint_num] = oog
		oog.number = checkpoint_num
		checkpoint_num++
		level1_master.available_checkpoints--
		level1_master.checkpoint_num = checkpoint_num
		start_ckpt_timer=0
		//player_obj.tail_planted = false
		//player_obj.tail_pulling = true
		ckpt_place_toggle = false
		kyboard_clear(vk_space)
	
	}	
}*/

	
if k_fire && grounded && speed<5
&& point_distance(player_obj.x,player_obj.y,tail_obj.x,tail_obj.y)<30
&& ckpt_place_toggle{
	start_ckpt_timer++	
} else {
	start_ckpt_timer = 0
}
	
if k_fire_r {
	ckpt_place_toggle = true	
}

if last_checkpoint == noone || !instance_exists(last_checkpoint)  {
	last_checkpoint  = lelckpt
}
if grounded && !place_meeting(x,y+2,black_wall_obj) && !ckpt_bool {
		
	if !place_meeting(x,y,checkpoint_manager.checkpoint) && !ckpt_bool {
		if gems>=1 && !ckpt_bool {
			if k_ckpt {
				ckpt_place_timer++	
				move_locked = true
				hsp=0
			} else {
				ckpt_place_timer = 0
				move_locked = false
			}
			if ckpt_place_timer>ckpt_place_timer_m {
				ckpt_place_timer=0
				ckpt_bool = true
				last_checkpoint = checkpoint_manager.checkpoint
				oog = instance_create_depth(x,y,0,checkpoint1)	
				hp=2
				checkpoint_particle_script(x,y,36)
					
				level1_master.checkpoints[checkpoint_num] = oog
				oog.number = checkpoint_num
				checkpoint_num++
				//level1_master.available_checkpoints--
				level1_master.checkpoint_num = checkpoint_num
				start_ckpt_timer=0
				//player_obj.tail_planted = false
				//player_obj.tail_pulling = true
				ckpt_place_toggle = false
				keyboard_clear(vk_space)	
				gems-=1
		
				with oog {
					player_obj.hp = 2
					checkpoint_particle_script(x,y,24)
			
					if checkpoint_manager.checkpoint != self || starting_bool {
						audio_sound_gain(fire_sound,audio_sound_get_gain(firecrackle1),0)
						audio_play_sound(firelit1,0,false)	
						audio_play_sound(Ice_Projectile_Shoot_03,0,false)
						starting_bool = false
					}
					savegame_script()
	
					ready = false
				}
			}
		}
	} else if !checkpoint_manager.checkpoint.setpoint && !ckpt_bool {
		if k_ckpt {
			ckpt_place_timer++	
			move_locked = true
			hsp=0
		} else {
			ckpt_place_timer = 0	
			move_locked = false
		}
		if ckpt_place_timer>60 {
			ckpt_place_timer=0
			ckpt_bool = true
			instance_destroy(checkpoint_manager.checkpoint)
			level1_master.checkpoints[checkpoint_num] = 0
			checkpoint_num--
			gems+=1
			//level1_master.available_checkpoints++
			//checkpoint_manager.checkpoint = level1_master.checkpoints[checkpoint_num-1]
				
			if last_checkpoint == noone || !instance_exists(last_checkpoint)  {
				last_checkpoint  = lelckpt
			}
			checkpoint_manager.checkpoint = last_checkpoint
			checkpoint_manager.rx = checkpoint_manager.checkpoint.x
			checkpoint_manager.ry = checkpoint_manager.checkpoint.y
			level1_master.checkpoint_num = checkpoint_num
			//start_ckpt_timer=0
			//player_obj.tail_planted = false
			//player_obj.tail_pulling = true
			//ckpt_place_toggle = false
		}
	}
} else {
	ckpt_place_timer = 0	
	if ckpt_bool && !k_ckpt {
		
		ckpt_bool = false	
		ckpt_place_timer=0
	}
}
	
