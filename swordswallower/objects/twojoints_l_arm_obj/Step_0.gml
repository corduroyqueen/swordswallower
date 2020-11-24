/// @description Insert description here
// You can write your code in this editor


if destroy_arm {
	x=0
	y=0
	arm_hitbox.x = -200 
	arm_hitbox.y = -200 
	elbow_pos_y=0
	hand.x = -200
	hand.y = -200
	return
}

if state==state_idle {
	//elbow_pos_x = lerp(elbow_pos_x,x-100+(player_obj.x-x+900+(offset-400))/1.5,0.2)
	//elbow_pos_x = clamp(elbow_pos_x,x-200,x-20)
	//elbow_pos_y = lerp(elbow_pos_y,y+390,1)
	
	elbow_tarang = clamp(240 + (player_obj.x - (x - 1000))/20 ,240,265) + (offset-400)/20
	elbow_ang = elbow_tarang
	
	elbow_pos_x = x + dcos(elbow_ang) * arm_1_length
	elbow_pos_y = y - dsin(elbow_ang) * arm_1_length
	
	
	
	hand_tar_x = lerp(hand_tar_x,clamp(player_obj.x+offset,x-minclamp,x-200),0.2)
	hand_tar_y = y+300
	
	//timer++
	if timer>100 {
		timer=0
		state=state_anticipation
	}
} else if state==state_lunging {
	//elbow_vel -= 1
	//elbow_hsp += abs(elbow_vel * elbow_vel * elbow_vel * elbow_vel* elbow_vel * elbow_vel) * sign(elbow_vel)
	//elbow_pos_x += elbow_hsp / 10000000000
	//elbow_pos_x = clamp(elbow_pos_x,x-400,x-20)
	
	//elbow_pos_y = lerp(elbow_pos_y,y+390,abs(elbow_hsp)/10000000000000)
	
	//hand_tar = lerp(hand_tar,elbow_pos_x-1000,abs(elbow_hsp)/10000000000000)
	var lerp1
	var lerp2
	timer++
	if timer<40 {
		lerp1 = 0.0025
		lerp2 = 0.00055
		
		if player_obj.grounded {
			elbow_tarang = 195
		} else {
			elbow_tarang = clamp(point_direction(
			mean(mean(elbow_pos_x,x),x),
			mean(mean(elbow_pos_y,y),y),
			player_obj.x,player_obj.y),90,270)
		}
		if player_obj.grounded {
			lel_angle = 175 + 180
		} else {
			lel_angle = point_direction(x,y,player_obj.x,player_obj.y) + 180
		}
		lunge_target_x = x + dcos(elbow_tarang) * 1400
		lunge_target_y = y - dsin(elbow_tarang) * 1400
		lunge_target_y = clamp(lunge_target_y,-50000,y+300)
		
	} else if timer<100 {
		lerp1 = 0.000
		lerp2 = 0.0000
		
	} else {
		var m = (timer - 100)/60
		//lerp1 = 0.008
		//lerp2 = 0.015
		lerp1 = 0.05 * m
		lerp2 = 0.1 * m
		
		var m = 1 + (timer - 100)/3
		//lerp1 = 0.008
		//lerp2 = 0.015
		lerp1 = 0.0005 * m * m
		lerp2 = 0.001 * m * m
	} 
	
	
	elbow_ang = lerp(elbow_ang,elbow_tarang,lerp1)
	elbow_pos_x = x + dcos(elbow_ang) * arm_1_length
	elbow_pos_y = y - dsin(elbow_ang) * arm_1_length
	
	hand_tar_x = lerp(hand_tar_x,lunge_target_x,lerp2)
	hand_tar_y = lerp(hand_tar_y,lunge_target_y,lerp2)
	//if elbow_pos_x<x-399 {
	//	elbow_vel = 0
	//	elbow_hsp = 0
	//	state=state_knockback
	//}
	//if point_distance(x,y,elbow_pos_x,elbow_pos_y)>arm_1_length {
	if point_distance(x,y,hand_tar_x,hand_tar_y)>1100 
	//|| (timer>0 && position_meeting(hand_tar_x,hand_tar_y,wall_parent_obj)) 
	{
		timer=0
		elbow_pos_x = x + dcos(elbow_tarang+15) * arm_1_length
		elbow_pos_y = y - dsin(elbow_tarang+15) * arm_1_length
		arm_pull_ang = elbow_tarang+7
		//hand_tar_x = 
		state=state_knockback
		player_obj.shake_d=15
		player_obj.camera_shake_d = true	
	}
} else if state==state_knockback {
	//elbow_pos_x = x-399
	//elbow_pos_y = lerp(elbow_pos_y,y+390,0.1)
	//hand_tar_x = lerp(hand_tar,x-1500,0.2)
	timer++
	if timer==40 || timer==100 || timer==199 {
		arm_pull_ang = elbow_tarang+20
	}
	arm_pull_ang = lerp(arm_pull_ang,elbow_tarang+7,0.1)
	elbow_pos_x = x + dcos(arm_pull_ang) * arm_1_length
	elbow_pos_y = y - dsin(arm_pull_ang) * arm_1_length
	
	if timer>200 {
		timer=0
		state=state_recovery
		lel_angle = convert_angle(lel_angle)
	}
	
	
} else if state==state_anticipation {
	//elbow_pos_x = lerp(elbow_pos_x,x-20,0.1)
	//elbow_pos_x = clamp(elbow_pos_x,x-200,x-20)
	
	//elbow_pos_y = lerp(elbow_pos_y,y+390,1)
	
	//hand_tar_x = lerp(hand_tar_x,x-200,0.1)
	
	//hand_tar_x = lerp(hand_tar_x,clamp(player_obj.x+offset,x-minclamp,x-200),0.2)
	var a = clamp(point_direction(x,y,player_obj.x,player_obj.y),0,180)
	elbow_tarang = a+90
	elbow_ang = lerp(elbow_ang,elbow_tarang,1)
	
	elbow_pos_x = x + dcos(elbow_ang) * arm_1_length
	elbow_pos_y = y - dsin(elbow_ang) * arm_1_length
	
	hand_tar_x = lerp(hand_tar_x, elbow_pos_x + dcos(a)* 100 , 0.1)
	hand_tar_y = lerp(hand_tar_y, elbow_pos_y - dsin(a)* 100 , 0.1)
	
	timer++
	if timer>40 {
		timer=0
		state = state_lunging
		
		if player_obj.grounded {
			elbow_tarang = 195
		} else {
			elbow_tarang = clamp(point_direction(
			mean(mean(elbow_pos_x,x),x),
			mean(mean(elbow_pos_y,y),y),
			player_obj.x,player_obj.y),90,270)
		}
		
		lunge_target_x = x + dcos(elbow_tarang) * 1400
		lunge_target_y = y - dsin(elbow_tarang) * 1400
	}
} else if state==state_recovery {
	timer++
	//elbow_pos_x = lerp(elbow_pos_x,x-20+offset_diff,0.01)
	//elbow_pos_y = lerp(elbow_pos_y,y+390,0.1)
	
	
	arm_pull_ang = lerp(arm_pull_ang,260,0.03)
	elbow_pos_x = x + dcos(arm_pull_ang) * arm_1_length
	elbow_pos_y = y - dsin(arm_pull_ang) * arm_1_length
	//elbow_pos_x = clamp(elbow_pos_x,x-200,x-20)
	
	hand_tar_x = lerp(hand_tar_x,elbow_pos_x-250,0.08)//0.1)
	hand_vsp+=1+hand_vsp/5
	hand_tar_y+=hand_vsp
	//hand_tar_y = y+400
	if hand_tar_y>y+400 {
		if hand_tar_y>y+405 {
			player_obj.shake_d=15
			player_obj.camera_shake_d = true	
		}
		hand_vsp = 0
		hand_tar_y = y+400
		
	}
	if lel_angle<180 {
		lel_angle= lerp(lel_angle,0,0.2)
	} else {
		lel_angle= lerp(lel_angle,360,0.2)
	}

	if timer>50 {
		timer=0
		state = state_reset
		hand_vsp=0
	}
} else if state==state_defense {
	//elbow_pos_x = lerp(elbow_pos_x,x-20,0.1)
	//elbow_pos_x = clamp(elbow_pos_x,x-200,x-20)
	
	//elbow_pos_y = lerp(elbow_pos_y,y+390,1)
	
	//hand_tar_x = lerp(hand_tar_x,x-200,0.1)
	
	//hand_tar_x = lerp(hand_tar_x,clamp(player_obj.x+offset,x-minclamp,x-200),0.2)
	//var a = point_direction(x,y,player_obj.x,player_obj.y)
	elbow_tarang = 260
	elbow_ang = lerp(elbow_ang,elbow_tarang,1)
	
	elbow_pos_x = x + dcos(elbow_ang) * arm_1_length
	elbow_pos_y = y - dsin(elbow_ang) * arm_1_length
	
	hand_tar_x = lerp(hand_tar_x, elbow_pos_x - 150 , 0.1)
	hand_tar_y =  y + 400
	

} else if state==state_reset {
	
}



elbow_pos_x+=random_range(-4,4)



//hand_tar_y = y+400
	
arm_move_towards_2j(
hand_tar_x,
hand_tar_y,
100,
true,
elbow_pos_x
,
elbow_pos_y)


hand.x = seg_x[2]
hand.y = seg_y[2]

if state==state_knockback || (state==state_lunging && timer>80) || state==state_recovery {
	hand.sprite_index = two_jointed_arm_out_t1
	hand.sprite_index = bosshand1
	hand.mask_index = two_jointed_arm_out_t1
	hand.image_angle = lel_angle
} else {
	hand.sprite_index = two_jointed_arm_t1
	hand.sprite_index = bosshand2
	hand.mask_index = two_jointed_arm_t1
	hand.image_angle = 0
	
	
}


arm_hitbox.image_xscale = 350/2.5
arm_hitbox.image_yscale = 50/3
arm_hitbox.image_angle = point_direction(seg_x[1],seg_y[1],seg_x[2],seg_y[2]) + 180

if state==state_knockback {
	arm_hitbox.x = 600
	arm_hitbox.y = -600
	arm_hitbox.image_xscale = 350/2.5
} else {
	arm_hitbox.x = seg_x[1]
	arm_hitbox.y = seg_y[1]
	arm_hitbox.image_xscale = 350/1.75
}

arm_hitbox.x = seg_x[2]
arm_hitbox.y = seg_y[2]

if state==state_knockback || state==state_recovery {
	arm_weakspot.x = elbow_pos_x
	arm_weakspot.y = elbow_pos_y
} else {
	arm_weakspot.x = 500
	arm_weakspot.y = -600
}

arm_weakspot.image_xscale = 350/2
arm_weakspot.image_yscale = 50/3
arm_weakspot.image_angle = point_direction(elbow_pos_x,elbow_pos_y,seg_x[1],seg_y[1])



//arm_relocate(x,y)
	//arm_fix(wall_obj)
	//arm_apply_force(5,180)
	
	//2743,