x_tar = argument0
y_tar = argument1

tarang = point_direction(player_obj.x-150+arm_pin_x,player_obj.y-150+arm_pin_y,x_tar,y_tar)
if point_distance(player_obj.x-150+arm_pin_x,player_obj.y-150+arm_pin_y,x_tar,y_tar)>arm_max_length-1 {
	//tarang = point_direction(player_obj.x-150+arm_pin_x,player_obj.y-150+arm_pin_y,x_tar,y_tar)
	arm_hand_x = lerp(arm_hand_x,arm_pin_x+cos(degtorad(tarang))*arm_max_length,arm_lerp_speed)
	arm_hand_y = lerp(arm_hand_y,arm_pin_y-sin(degtorad(tarang))*arm_max_length,arm_lerp_speed)
} else {
	arm_hand_x = lerp(arm_hand_x,x_tar-player_obj.x+arm_pin_x,arm_lerp_speed)
	arm_hand_y = lerp(arm_hand_y,y_tar-player_obj.y+arm_pin_y,arm_lerp_speed)
}


arm_angle_2 = clamp(-1, (sqr(arm_hand_x-arm_pin_x)+sqr(arm_hand_y-arm_pin_y)-sqr(arm_seg_length_1)-sqr(arm_seg_length_2)) / (2 * arm_seg_length_1 * arm_seg_length_2) , 1)

arm_angle_2 = (darccos(arm_angle_2)) * sign(player_obj.x-tail_obj.x)
arm_angle_2 = convert_angle(arm_angle_2)
arm_angle_1 = (darctan((arm_hand_y-arm_pin_y)/(arm_hand_x-arm_pin_x)) - darctan((arm_seg_length_2 * dsin(arm_angle_2)) / (arm_seg_length_1 + arm_seg_length_2 * dcos(arm_angle_2))))
arm_angle_1 = convert_angle(arm_angle_1)

if arm_hand_x<arm_pin_x {
	arm_angle_1	= 180 - arm_angle_1
} else {
	arm_angle_1	= -arm_angle_1
}
arm_angle_1 = convert_angle(arm_angle_1)

//arm_angle_1 = arctan(arm_hand_y/arm_hand_x) - arctan(