if player_obj.k_fire_p && !player_obj.tail_planted && !player_obj.tail_throwing {
	arm_hand_x = arm_pin_x
	arm_hand_y = arm_pin_y-25
	arm_lerp_speed = 0.0
	player_arm_calculate(tail_obj.x,tail_obj.y)
} else if player_obj.tail_pulling {
	arm_lerp_speed = 0.23
	player_arm_calculate(tail_obj.x,tail_obj.y)
} else if player_obj.tail_carry  {
	arm_lerp_speed = 0.25
	player_arm_calculate(sword_pos_x,sword_pos_y)
} else if  player_obj.tail_planted {
	arm_lerp_speed = 0.025
	player_arm_calculate(player_obj.x + 20 * -image_xscale,player_obj.y+70)
} else if player_obj.tail_throwing {
	arm_lerp_speed = 0.45
	player_arm_calculate(tail_obj.x,tail_obj.y)
} else  {
	arm_lerp_speed = 0.1
	player_arm_calculate(tail_obj.x,tail_obj.y)
}

var elbow_pos_x = arm_pin_x + dcos(arm_angle_1) * arm_seg_length_1 * -sign(player_obj.x-tail_obj.x)
var elbow_pos_y = arm_pin_y - dsin(arm_angle_1) * arm_seg_length_1 * sign(player_obj.x-tail_obj.x) 





draw_circle(arm_pin_x,arm_pin_y,2,false)

draw_line(arm_pin_x,arm_pin_y,elbow_pos_x,elbow_pos_y)

draw_circle(elbow_pos_x,elbow_pos_y,2,false)

draw_line(elbow_pos_x,elbow_pos_y,arm_hand_x,arm_hand_y)

draw_circle(arm_hand_x,arm_hand_y,2,false)

