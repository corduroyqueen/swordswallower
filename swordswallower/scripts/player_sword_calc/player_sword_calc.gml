var facing
facing = sign(image_xscale)

ang = 0


var temp_pin_x = arm_pin_x - 150 + player_obj.x
var temp_pin_y = arm_pin_y - 150 + player_obj.y
var temp_hand_x = arm_hand_x - 150 + player_obj.x
var temp_hand_y = arm_hand_y - 150 + player_obj.y

var dist = point_distance(sword_pos_x,sword_pos_y,temp_pin_x,temp_pin_y)



if player_obj.tail_planted || player_obj.held_position {
	sword_s=sword_s_planted
	sword_pos_x = tail_obj.hilt_x
	sword_pos_y = tail_obj.hilt_y
	sword_ang = convert_angle(tail_obj.image_angle)
	sword_tx = tail_obj.x
	sword_ty = tail_obj.y
	

}
if player_obj.held_position {
	sword_planted_held = true	
}

if abs(temp_pin_x-sword_pos_x) > 30 {
	sword_facing = sign(temp_pin_x-sword_pos_x)
}

//this clamps the sword hilt within the arm's radius
if (dist > arm_max_length && sword_s!=sword_s_planted) //If the distance is less than the radius, it is already within the circle.
{
	var fromOriginToObject_x = sword_pos_x - temp_pin_x; //~GreenPosition~ - *BlackCenter*
	var fromOriginToObject_y = sword_pos_y - temp_pin_y; //~GreenPosition~ - *BlackCenter*
	fromOriginToObject_x *= arm_max_length / dist; 
	fromOriginToObject_y *= arm_max_length / dist; 
	
	sword_pos_x = temp_pin_x + fromOriginToObject_x
	sword_pos_y = temp_pin_y + fromOriginToObject_y
	
}

if sword_s==sword_s_planted {
	sword_planted_bounds = true
	if player_obj.tail_carry {
		if point_distance(sword_pos_x,sword_pos_y,temp_pin_x,temp_pin_y)<200 {
			sword_planted_bounds = true
		}	
		////var lelx = arm_hand_x - 150 + player_obj.x
		////var lely = arm_hand_y - 150 + player_obj.y
		var angs = degtorad(point_direction(sword_tx,sword_ty,temp_pin_x,temp_pin_y))	
		var length = point_distance(sword_tx,sword_ty,sword_pos_x,sword_pos_y)
		//sdm(point_distance(sword_pos_x,sword_pos_y,temp_pin_x,temp_pin_y))
		if point_distance(sword_pos_x,sword_pos_y,temp_pin_x,temp_pin_y)>80 { sword_planted_held = false }
		if point_distance(sword_pos_x,sword_pos_y,temp_pin_x,temp_pin_y)>80  { sword_planted_bounds = false }
		if point_distance(sword_pos_x,sword_pos_y,temp_pin_x,temp_pin_y)>24 
		&& !sword_planted_held 
		&& !sword_planted_bounds { 
		
			if player_obj.grounded {
				sword_s=sword_s_dragging
				if (dist > arm_max_length && sword_s!=sword_s_planted) //If the distance is less than the radius, it is already within the circle.
				{
					var fromOriginToObject_x = sword_pos_x - temp_pin_x; //~GreenPosition~ - *BlackCenter*
					var fromOriginToObject_y = sword_pos_y - temp_pin_y; //~GreenPosition~ - *BlackCenter*
					fromOriginToObject_x *= arm_max_length / dist; 
					fromOriginToObject_y *= arm_max_length / dist; 
	
					sword_pos_x = temp_pin_x + fromOriginToObject_x
					sword_pos_y = temp_pin_y + fromOriginToObject_y
	
				}
			} else {
				sword_s=sword_s_air	
				sword_ang = convert_angle(sword_ang)
			}
		} else {
			if sword_planted_held  {
				sword_pos_x = lerp(sword_pos_x,sword_tx + cos(angs) * length,1)
				sword_pos_y = lerp(sword_pos_y,sword_ty + -sin(angs) * length,1)
				sword_ang = radtodeg(angs) + 90
			} else if sword_planted_bounds {
				
				sword_pos_x = lerp(sword_pos_x,sword_tx + cos(angs) * length,1)
				sword_pos_y = lerp(sword_pos_y,sword_ty + -sin(angs) * length,1)
				sword_ang = radtodeg(angs) + 90	
			} 
		}
	}
	
}
	
if sword_s==sword_s_air {
	//sdm("AH")
	
	if player_obj.grounded {
		sword_s=sword_s_dragging
		return
	}
	
	sword_pos_y+=player_obj.vsp
	if abs(temp_pin_x-sword_pos_x) > 30 {
		sword_facing = sign(temp_pin_x-sword_pos_x)
	}
	//sword_pos_y+=15
	//sword_facing = 1
	//this is applying "gravity" so to speak
	
	if sword_ang>0 {
		sword_ang = convert_angle(sword_ang)
		sword_ang = lerp(sword_ang,180,0.04)// * random_range(0.9,1.1))
	} else {
		sword_ang = -convert_angle(sword_ang)
		sword_ang = lerp(sword_ang,-180,0.04)// * random_range(0.9,1.1))
	}
	//sword_ang = lerp(sword_ang,180,0.1)
	
	
	//this clamps the sword hilt within the arm's radius
	if (dist > arm_max_length && sword_s!=sword_s_planted) //If the distance is less than the radius, it is already within the circle.
	{
		var fromOriginToObject_x = sword_pos_x - temp_pin_x; //~GreenPosition~ - *BlackCenter*
		var fromOriginToObject_y = sword_pos_y - temp_pin_y; //~GreenPosition~ - *BlackCenter*
		fromOriginToObject_x *= arm_max_length / dist; 
		fromOriginToObject_y *= arm_max_length / dist; 
	
		sword_pos_x = temp_pin_x + fromOriginToObject_x
		sword_pos_y = temp_pin_y + fromOriginToObject_y
	
	}
	
} 
if sword_s==sword_s_dragging {
	if sword_pos_y<temp_pin_y+30  {
		sword_pos_y+=6
	} 
	sword_angle_calc()	
	
} 







//sword angle calc



//sword_pos_x = x
//sword_pos_y = y

//sword_pos_x = clamp(
//draw_sprite_ext(newsword_hilt,0,x-2,y+3,-facing,1,ang,c_white,1)
/*
if sprite_index==player_idle_s_n {
	//93 32
	//91 34
	
	//68 64
	pointx = 68 * facing + x
	pointy=0
	for (i=0;i<48;i+=2) {
		if wall_detect(pointx,y-16+i) || place_meeting(pointx,y-16+i,thin_floor_obj) {
			pointy = y+i
			break
		}
	}
	if pointy==0 {
		for (i=128;i>0;i-=2) {
			if !wall_detect(pointx,y-32+i) && !place_meeting(pointx,y-32+i,thin_floor_obj) {
				pointy = y+i-5
				break
			}
		}
	}
	
	ang = point_direction(x+2*facing,y+3,pointx,pointy)-90
	
	draw_sprite_ext(newsword_hilt,0,x-2,y+3,-facing,1,ang,c_white,1)
} else {
	pointx = 78 * facing + x
	pointy=0
	for (i=0;i<48;i+=2) {
		if wall_detect(pointx,y-16+i) || place_meeting(pointx,y-16+i,thin_floor_obj) {
			pointy = y+i
			break
		}
	}
	if pointy==0 {
		for (i=128;i>0;i-=2) {
			if !wall_detect(pointx,y-32+i) && !place_meeting(pointx,y-32+i,thin_floor_obj) {
				pointy = y+i-5
				break
			}
		}
	}
	
	//for (i=0;i<180;i+=2) {
	//	degree = degtorad(270+i*facing)
		
	//	if !collision_line(
	//	x+7*facing,y+1,
	//	cos(degree)*60,
	//	sin(degree)*60,
	//	wall_obj,false,true) {
	//		pointy = sin(degree)*60
	//		break
	//	}
	//}
	
	
	
	ang = point_direction(x+11*facing,y+1,pointx,pointy)-90
	
	draw_sprite_ext(newsword_hilt,0,x+11*facing,y+1,-facing,1,ang,c_white,1)	
}