//fuck yes

head.x = x - 15
head.y = y - 30
head.image_angle = 0
head.image_index = 0
if docile {
	if player_obj.y>2783 && player_obj.x>66486 {
		docile = false
	}
	return
}


if player_obj.tail_carry {
	met = false
}
//sdm("hi")
//sdm(phase_n_i)
if state==state_idle {
	if sprite_index!=boss_idle {
		image_speed = -2
		if image_index<=1 {
			sprite_index = boss_idle
			image_speed = 1
		}
	} else {
		sprite_index = boss_idle
	}
	
	h1_lerp = 0
	h2_lerp = 50
	h3_lerp = -30
	
	state_timer++
	hands_ceiling_a = false
	hands_wall_a = false
	
	if state_timer>40 {
		
		if rightarm.destroy_arm {
			
			phase_n =2
			phase_n_i++
			if phase_n_i>=ds_list_size(phase3_atk) {
				phase_n_i = 0
			}
			attack = phase3_atk[| phase_n_i]
			
		} else if leftarm.destroy_arm {
			phase_n =1
			phase_n_i++
			if phase_n_i>=ds_list_size(phase2_atk) || phase_n_i>=6 {
				phase_n_i = 0
			}
			attack = phase2_atk[| phase_n_i]
			//attack = 1
			//attack = 2
		} else {
			phase_n =0
			phase_n_i++
			if phase_n_i>=ds_list_size(phase1_atk) {
				phase_n_i = 0
			}
			attack = phase1_atk[| phase_n_i]
			//attack = 5
			//attack = 1
		}
		//attack = 6
		
		state_timer=0
		state=state_attacking
	}
	
} else if state==state_attacking {
	
	if attack!=attack_left_lunge && attack!=attack_right_lunge{
		if ht<7 {
			anim_spr_i+=0.2
			var doot = 15
			if anim_spr_i>doot {
				anim_spr_i=0
			}
			anim_spr_i = clamp(anim_spr_i,0,doot-0.1)
		} else {
			sprite_index = boss_idle 
			image_speed = 1
		}
	} else {
		sprite_index = boss_leanback
		if leftarm.state == leftarm.state_anticipation || rightarm.state == rightarm.state_anticipation {
		
			anim_spr_i+=0.2
			anim_spr_i = clamp(anim_spr_i,0,2.9)
		} else if (leftarm.state==leftarm.state_lunging && leftarm.timer>80)
		|| (rightarm.state==rightarm.state_lunging && rightarm.timer>80) {
			anim_spr_i-=0.2
			anim_spr_i = clamp(anim_spr_i,0,2.9)
		} else if leftarm.state==leftarm.state_knockback || rightarm.state==rightarm.state_knockback  {
			anim_spr_i+=0.2
			var doot = 15
			if anim_spr_i>doot {
				anim_spr_i=0
			}
			anim_spr_i = clamp(anim_spr_i,3,doot-0.1)
		} else if leftarm.state==leftarm.state_recovery || rightarm.state==rightarm.state_recovery  {
			anim_spr_i = 0
		}
		image_index = floor(anim_spr_i)
	}
	
	
	
	if attack==attack_left_lunge {
		rightarm.state = rightarm.state_defense
		if leftarm.state == leftarm.state_idle {
			leftarm.state = leftarm.state_anticipation
		}
		
		
		if leftarm.state == leftarm.state_reset || leftarm.destroy_arm {
			state = state_idle
			rightarm.state = rightarm.state_idle
			leftarm.state = leftarm.state_idle
			leftarm.timer=0
		}
	} else if attack==attack_right_lunge {
		leftarm.state = leftarm.state_defense
		if rightarm.state == rightarm.state_idle {
			rightarm.state = rightarm.state_anticipation
		}
		if rightarm.state == rightarm.state_reset || rightarm.destroy_arm {
			state = state_idle
			rightarm.state = rightarm.state_idle
			rightarm.timer=0
		}
	} else if attack==attack_cough_flies {
		head.image_index = 1
		var spawn_num = floor(random_range(2,6))
		for(var i=0;i<spawn_num;i++) {
			fly1 = instance_create_depth(x-200,y-100,depth,flyfree_obj)
			
			var ang = random_range(170,240)
			var spd = random_range(14,28)
			fly1.hsp = dcos(ang) * spd
			fly1.vsp = -dsin(ang) * spd
			fly1.inv_timer=0
			fly1.state = 1
			fly1.spawn = true
			fly1.eyespr = choose(greeneye,pinkeye)
		}
		if leftarm.destroy_arm && rightarm.destroy_arm {
			state = state_mouthopen
		} else {
			state = state_idle
		}
	} else if attack==attack_cough_tar {
		head.image_index = 1
		var spawn_num = 5
		var sx = head.x-200
		var sy = head.y-100
		for(var i=0;i<spawn_num;i++) {
			var tar1 = instance_create_depth(sx,sy,depth+1,projectile_arcing_obj)
			tar1.start_x = sx
			tar1.start_y = sy
			tar1.end_x = sx - 175 - (230 * i)
			tar1.end_y = sy - 200
			tar1.fall_speed = 8
			tar1.timer_m = 120 - i * 10
		}
		if leftarm.destroy_arm && rightarm.destroy_arm {
			state = state_mouthopen
		} else {
			state = state_idle
			state_timer = -100
		}
	} else if attack==attack_wall_hands {
		if ht < 1 {
			chosen_wall = choose(h1,h3)
			if phase_n==0 && phase_n_i<2 {
				chosen_wall = h1
			}
			if chosen_wall==h1 {
				hands_ceiling_a = true
				hands_wall_a = false
			} else {
				hands_wall_a = true
				hands_ceiling_a = false
			}
		}
		if !player_obj.tail_pulling {
			ht++
		}
		//h1.visible = true
		//h2.visible = true
		if ht>170 {
			
			ht=0
			if leftarm.destroy_arm && rightarm.destroy_arm {
				state = state_mouthopen
			} else {
				state = state_idle
				state_timer = 30
			}
			
		} else if ht>130 {
			
			chosen_wall.x = 1000
			chosen_wall.y = -1000
			h2.x = 1000
			h2.y = -1000
			//h3.x = 1000
			//h3.y = -1000
			
			chosen_wall.mask_index = nothing1
			h2.mask_index = nothing1
			//h3.mask_index = nothing1
			
		} else if ht>100 {
			chosen_wall.mask_index = sprite54
			h2.mask_index = sprite54
			//h3.mask_index = sprite54
			//h1.image_alpha = 1
			//h2.image_alpha = 1
		} else {
			chosen_wall.mask_index = nothing1
			h2.mask_index = nothing1
			//h3.mask_index = nothing1
			
			chosen_wall.image_alpha = 0
			h2.image_alpha = 0
			//h3.image_alpha = 0
			
			chosen_wall.x = chosen_wall.sx
			chosen_wall.y = chosen_wall.sy
			h2.x = h2_x
			h2.y = h2_y
			//h3.x = h3_x
			//h3.y = h3_y
		}
		
		
	} else if attack==attack_wall_hands_switch {
		if ht < 1 {
			hand_switch_init = true
			chosen_wall = choose(h1,h3)
			if chosen_wall==h1 {
				hands_ceiling_a = true
				hands_wall_a = false
			} else {
				hands_wall_a = true
				hands_ceiling_a = false
			}
		}
		if !player_obj.tail_pulling {
			ht++
		}
		//h1.visible = true
		//h2.visible = true
		if ht>150 {
			
			//ht=0
			
			if end_hand_switch {
				//h2_lerp = 50
				if leftarm.destroy_arm && rightarm.destroy_arm {
					state = state_mouthopen
					
				} else {
					state = state_idle
					state_timer = 20
				}
				end_hand_switch = false
				ht=0
			} else {
				if hands_ceiling_a {
					hands_ceiling_a = false
					hands_wall_a = true
					chosen_wall = h3
				} else {
					hands_ceiling_a = true
					hands_wall_a = false
					chosen_wall = h1
				}
				end_hand_switch = true
				ht = 1
			}
			
		} else if ht>130 {
			
			if end_hand_switch {
				chosen_wall.x = 1000
				chosen_wall.y = -1000
			}
			h2.x = 1000
			h2.y = -1000
			//h3.x = 1000
			//h3.y = -1000
			
			chosen_wall.mask_index = nothing1
			
			if end_hand_switch {
				h2.mask_index = nothing1
			}
			//h3.mask_index = nothing1
			hand_switch_init = false
		} else if ht>100 {
			chosen_wall.mask_index = sprite54
			h2.mask_index = sprite54
			
			//h3.mask_index = sprite54
			//h1.image_alpha = 1
			//h2.image_alpha = 1
		} else {
			
			chosen_wall.mask_index = nothing1
			if hand_switch_init {
				h2.mask_index = nothing1
				
			}
			//h3.mask_index = nothing1
			
			chosen_wall.image_alpha = 0
			h2.image_alpha = 0
			//h3.image_alpha = 0
			
			chosen_wall.x = chosen_wall.sx
			chosen_wall.y = chosen_wall.sy
			h2.x = h2_x
			h2.y = h2_y
			//h3.x = h3_x
			//h3.y = h3_y
		}
		
		
	} 
	
	
} else if state==state_swallowing {
	
	timer++
	sprite_index = boss_hurt
	image_speed = 1
	if timer>150 {
		head.image_index = 0
		tail_obj.stuck_check = false
		
		tail_obj.visible = true
		tail_obj.x = x
		tail_obj.y = y + 400
		if player_obj.k_fire_p {
			timer=0
			tail_obj.planted_rejecting = false
			go = instance_create_depth(x,y,0,snakeheaddead_obj)
			go.sprite_index = boss_head
			go.hsp = -8
			go.vsp = -5
			go.spinspeed = 10
			//go.spurt_bool = true
			
			//just_blood_speed_input(-0.75,-1.5,0.2,30,true,x,y+200)
			//just_blood_speed_input(-0.75,-1.5,0.2,30,true,x,y+250)
			//just_blood_speed_input(-1.2,-1.2,0,30,true,x,y+300)
			//just_blood_speed_input(-1.2,-1.2,0,30,true,x,y+350)
			//just_blood_speed_input(-0.75,0,0.2,30,true,x,y+400)
			//just_blood_speed_input(-0.75,0,0.2,30,true,x,y+450)
			just_blood_speed_input(-0.75,-1.5,0.2,30,true,tail_obj.x,tail_obj.y-100)
			just_blood_speed_input(-0.75,-1.5,0.2,30,true,tail_obj.x,tail_obj.y+50)
			just_blood_speed_input(-1.2,-1.2,0,30,true,tail_obj.x,tail_obj.y-200)
			just_blood_speed_input(-1.2,-1.2,0,30,true,tail_obj.x,tail_obj.y)
			just_blood_speed_input(-0.75,0,0.2,30,true,tail_obj.x,tail_obj.y+20)
			just_blood_speed_input(-0.75,0,0.2,30,true,tail_obj.x,tail_obj.y-40)
			
			
			just_blood_speed_input(-0.5,-1,0.2,50,true,tail_obj.x,tail_obj.y)
			
			sword_pull_check()
			
			instance_create_depth(x,y,-999999999999,title_screen_obj)	
			instance_create_depth(x,y,depth,boss_corpse_obj)	
			player_obj.zoom_on = true
			instance_destroy(leftarm)
			
			instance_destroy(rightarm)
			instance_destroy(head)
			instance_destroy()
		}
		if tail_obj.pull_timer>tail_obj.pull_wall_t || player_obj.tail_carry {
			
			instance_destroy()
			
			instance_destroy(leftarm)
			
			instance_destroy(rightarm)
			instance_destroy(head)
		}
	} else {
		head.image_index = 1
		tail_obj.stuck_check = true
		player_obj.zoom_on = false
		tail_obj.x = x
		tail_obj.y = y
		player_obj.tail_planted = true
		player_obj.tail_pulling = false
		
	}
	
} else if state==state_mouthopen {
	leftarm.state = leftarm.state_defense
	rightarm.state = rightarm.state_defense
	sprite_index = boss_openmouth
	
	image_index = clamp(round(timer/7),0,6)
	
	head.image_index = 1
	timer++
	if timer>100 && !player_obj.tail_throwing {
		leftarm.state = leftarm.state_idle
		rightarm.state = rightarm.state_idle
		state = state_idle
		timer=0
	}
	var lel = false
	var a = id
	
	with head {
		if place_meeting(x,y,tail_obj) {
			lel = true
			var e = id
			tail_obj.planted_rejecting = true
			with tail_obj {
				x = a.x
				y = a.y + 400
				visible = false
				sword_plant(e)
				
			}
		}
	}
	if lel {
		timer=0
		leftarm.state = leftarm.state_idle
		rightarm.state = rightarm.state_idle
		state = state_swallowing
	}
}
if instance_exists(head) {
	if state==state_mouthopen {
		head.image_angle = lerp(head.image_angle,-160,0.1)
		//head.mask_index = nothing
		head.sword_reject = false
		head.met = true
	} else {
		head.image_angle = lerp(head.image_angle,0,0.1)
		//head.mask_index = head.sprite_index
		head.sword_reject = true
	}
}

