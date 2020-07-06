/// @description Insert description here
// You can write your code in this editor



elbow_pos = lerp(elbow_pos,x-100+(player_obj.x-x+900+(offset-400))/1.5,0.2)
elbow_pos = clamp(elbow_pos,x-200,x-20)
elbow_pos+=random_range(-4,4)


hand_tar = lerp(hand_tar,clamp(player_obj.x+offset,x-minclamp,x-200),0.2)

arm_move_towards_2j(
	hand_tar,
	player_obj.y+48,
	100,
	true,
	
	elbow_pos
	
	,y+390)
	
//arm_relocate(x,y)
	arm_fix(wall_obj)
	//arm_apply_force(5,180)
	
	//2743,