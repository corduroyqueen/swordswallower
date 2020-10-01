/// @description Insert description here
// You can write your code in this editor


if state==state_idle {
	//elbow_pos_x = lerp(elbow_pos_x,x-100+(player_obj.x-x+900+(offset-400))/1.5,0.2)
	//elbow_pos_x = clamp(elbow_pos_x,x-200,x-20)
	//elbow_pos_y = lerp(elbow_pos_y,y+390,1)
	
	elbow_tarang = clamp(240 + (player_obj.x - (x - 1000))/20 ,240,265) + (offset-400)/20
	elbow_ang = elbow_tarang
	
	elbow_pos_x = x + dcos(elbow_ang) * arm_1_length
	elbow_pos_y = y - dsin(elbow_ang) * arm_1_length
	
	
	
	hand_tar_x = lerp(hand_tar_x,clamp(player_obj.x+offset,x-minclamp,x-200),0.2)
	hand_tar_y = y+400
	
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
	
	elbow_ang = lerp(elbow_ang,elbow_tarang,0.05)
	elbow_pos_x = x + dcos(elbow_ang) * arm_1_length
	elbow_pos_y = y - dsin(elbow_ang) * arm_1_length
	
	hand_tar_x = lerp(hand_tar_x,lunge_target_x,0.1)
	hand_tar_y = lerp(hand_tar_y,lunge_target_y,0.1)
	//if elbow_pos_x<x-399 {
	//	elbow_vel = 0
	//	elbow_hsp = 0
	//	state=state_knockback
	//}
	//if point_distance(x,y,elbow_pos_x,elbow_pos_y)>arm_1_length {
	if abs(elbow_tarang-elbow_ang)<10 {
		elbow_pos_x = x + dcos(elbow_ang) * arm_1_length
		elbow_pos_y = y - dsin(elbow_ang) * arm_1_length
		state=state_knockback
	}
} else if state==state_knockback {
	//elbow_pos_x = x-399
	//elbow_pos_y = lerp(elbow_pos_y,y+390,0.1)
	//hand_tar_x = lerp(hand_tar,x-1500,0.2)
	timer++
	if timer>100 {
		timer=0
		state=state_recovery
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
	if timer>100 {
		timer=0
		state = state_lunging
		elbow_tarang = clamp(point_direction(x,y,player_obj.x,player_obj.y),190,270)
		lunge_target_x = player_obj.x
		lunge_target_y = player_obj.y
	}
} else if state==state_recovery {
	elbow_pos_x = lerp(elbow_pos_x,x-20+offset_diff,0.01)
	elbow_pos_y = lerp(elbow_pos_y,y+390,0.1)
	//elbow_pos_x = clamp(elbow_pos_x,x-200,x-20)
	
	hand_tar_x = lerp(hand_tar_x,elbow_pos_x-650,1)//0.1)
	timer++
	if timer>50 {
		timer=0
		state = state_idle
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
	
//arm_relocate(x,y)
	//arm_fix(wall_obj)
	//arm_apply_force(5,180)
	
	//2743,