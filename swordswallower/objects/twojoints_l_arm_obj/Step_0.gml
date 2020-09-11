/// @description Insert description here
// You can write your code in this editor


if state==state_idle {
	elbow_pos_x = lerp(elbow_pos_x,x-100+(player_obj.x-x+900+(offset-400))/1.5,0.2)
	elbow_pos_x = clamp(elbow_pos_x,x-200,x-20)
	
	elbow_pos_y = lerp(elbow_pos_y,y+390,1)
	
	hand_tar = lerp(hand_tar,clamp(player_obj.x+offset,x-minclamp,x-200),0.2)
	
	timer++
	if timer>100 {
		timer=0
		state=state_anticipation
	}
} else if state==state_lunging {
	elbow_vel -= 1
	elbow_hsp += abs(elbow_vel * elbow_vel * elbow_vel * elbow_vel* elbow_vel * elbow_vel) * sign(elbow_vel)
	elbow_pos_x += elbow_hsp / 1000000000
	elbow_pos_x = clamp(elbow_pos_x,x-400,x-20)
	
	elbow_pos_y = lerp(elbow_pos_y,y+390,abs(elbow_hsp)/10000000000000)
	
	hand_tar = lerp(hand_tar,elbow_pos_x-1000,abs(elbow_hsp)/1000000000000)
	
	if elbow_pos_x<x-399 {
		elbow_vel = 0
		elbow_hsp = 0
		state=state_knockback
	}
} else if state==state_knockback {
	elbow_pos_x = x-399
	elbow_pos_y = lerp(elbow_pos_y,y+390,0.1)
	hand_tar = lerp(hand_tar,x-1500,0.2)
	timer++
	if timer>100 {
		timer=0
		state=state_recovery
	}
} else if state==state_anticipation {
	elbow_pos_x = lerp(elbow_pos_x,x-20,0.1)
	elbow_pos_x = clamp(elbow_pos_x,x-200,x-20)
	
	elbow_pos_y = lerp(elbow_pos_y,y+390,1)
	
	hand_tar = lerp(hand_tar,x-200,0.1)
	timer++
	if timer>50 {
		timer=0
		state = state_lunging
	}
} else if state==state_recovery {
	elbow_pos_x = lerp(elbow_pos_x,x-20+offset_diff,0.01)
	elbow_pos_y = lerp(elbow_pos_y,y+390,0.1)
	//elbow_pos_x = clamp(elbow_pos_x,x-200,x-20)
	
	hand_tar = lerp(hand_tar,elbow_pos_x-650,1)//0.1)
	timer++
	if timer>100 {
		timer=0
		state = state_idle
	}
} 



elbow_pos_x+=random_range(-4,4)




	
arm_move_towards_2j(
hand_tar,
y+400,
100,
true,
elbow_pos_x
,
elbow_pos_y)
	
//arm_relocate(x,y)
	//arm_fix(wall_obj)
	//arm_apply_force(5,180)
	
	//2743,