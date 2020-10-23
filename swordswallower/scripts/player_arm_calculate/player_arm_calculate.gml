x_tar = argument0
y_tar = argument1
shoulder_x = player_obj.x-150+arm_pin_x;
shoulder_y = player_obj.y-150+arm_pin_y;
var tarang = point_direction(shoulder_x,shoulder_y,x_tar,y_tar);
var tar_dist = max(point_distance(shoulder_x,shoulder_y,x_tar,y_tar),0.0000000000000001)
var bicep_ang = arccos(clamp((power(tar_dist, 2) + power(arm_seg_length_1, 2) - power(arm_seg_length_2, 2)) / (2 * tar_dist * arm_seg_length_1), -1, 1));
bicep_ang = radtodeg(bicep_ang);

var elbow_x = shoulder_x + dcos(tarang + bicep_ang ) * arm_seg_length_1;
var elbow_y = shoulder_y - dsin(tarang + bicep_ang) * arm_seg_length_1;

arm_angle_1 = point_direction(shoulder_x, shoulder_y, elbow_x, elbow_y)
//arm_angle_2 = point_direction(elbow_x,elbow_y,x_tar,y_tar)

var direc = -player_sprite_obj.image_xscale
var diff = 0

//arm_angle_1+=360
//tarang+=360

if direc>0 {
	if arm_angle_1>tarang {
		diff = arm_angle_1 - tarang
		arm_angle_1 -= diff * 2
	}
} else {
	if arm_angle_1<tarang {
		diff = arm_angle_1 - tarang
		arm_angle_1 -= diff * 2
	}
}
//arm_angle_1 = convert_angle(arm_angle_1)
//tarang = convert_angle(tarang)

elbow_pos_x = arm_pin_x + dcos(arm_angle_1) * arm_seg_length_1// * -sign(player_obj.x-tail_obj.x)
elbow_pos_y = arm_pin_y - dsin(arm_angle_1) * arm_seg_length_1 //* sign(player_obj.x-tail_obj.x) 

draw_sprite_ext(toparm,0,arm_pin_x,arm_pin_y,1,1,point_direction(arm_pin_x,arm_pin_y,elbow_pos_x,elbow_pos_y),c_white,1)

if player_obj.tail_pulling || player_obj.zoom_timer_bool {
	outline_start(3,global.magic_color,botarm)
}

draw_sprite_ext(botarm,0,elbow_pos_x,elbow_pos_y,1,1,point_direction(elbow_pos_x,elbow_pos_y,x_tar-player_obj.x +150,y_tar-player_obj.y +150),c_white,1)


if player_obj.tail_pulling || player_obj.zoom_timer_bool {
	outline_end()
}





/*Mathf.Acos(Mathf.Clamp((Mathf.Pow(a, 2f) + Mathf.Pow(b, 2.0f) - Mathf.Pow(c, 2.0f)) / (2.0f * a * b),
                   -1.0f, 1.0f)) * Mathf.Rad2Deg;

/*if point_distance(player_obj.x-150+arm_pin_x,player_obj.y-150+arm_pin_y,x_tar,y_tar)>arm_max_length-1 {
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

//arm_angle_1 = arctan(arm_hand_y/arm_hand_x) - arctan(*/