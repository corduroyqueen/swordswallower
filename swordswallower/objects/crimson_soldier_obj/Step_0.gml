/// @description Insert description here
// You can write your code in this editor
dont_attack = false	
if hp<=0 {
	just_blood(player_obj.hsp,player_obj.vsp,0.65,30,true,sprite_width/4,sprite_height)
	instance_destroy()
	reset_intangibility()
} else {
	
	if distance_to_object(player_obj)<750 && !player_detected {
		if wall_raycast_checker(player_obj) {
			player_detected = true	
			hspeed=0
			vspeed=0
			targetx = player_obj.x
			targety = player_obj.y
			sniping_timer=0
			go_home = choose(0,1)
		}
	} else if !in_camera_range(x,y) && !wall_raycast_checker(player_obj){
		player_detected = false	
	}
	
	if sword_lock {
		player_detected = true
		var lmao = sign(image_xscale)
		met = true
		tail_obj.hspeed = 0
		tail_obj.vspeed = 0
		tail_obj.y = y + swordy
		tail_obj.x = x + (swordx * lmao)
		player_obj.tail_dest_x = x
		player_obj.tail_dest_y = y
		tail_obj.inside_flier = true
		tail_obj.current_obj = self
	
		if player_obj.zoom_timer_bool {
			if point_distance(x,y,player_obj.x,player_obj.y)<200 {
				dont_attack = true	
			}
		
		}
	
		if player_obj.tail_pulling {
			sword_lock = false	
			audio_play_sound(Knife_Pull_140,0,false)
			move_towards_point(player_obj.x,player_obj.y,5)
		
		
		}
	}

	if player_obj.tail_carry {
		sword_lock = false
		met = false	
	
	}

	if met {
		if mouse_check_button_pressed(mb_left) {
			audio_play_sound(Knife_Pull_140,0,false)	
		}
	}
}


