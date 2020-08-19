var facing
facing = sign(image_xscale)

ang = 0


var temp_pin_x = arm_pin_x - 150 + player_obj.x
var temp_pin_y = arm_pin_y - 150 + player_obj.y

var dist = point_distance(sword_pos_x,sword_pos_y,temp_pin_x,temp_pin_y)

if !player_obj.grounded || sword_pos_y<temp_pin_y+30 {
	sword_pos_y+=4
} else {
	
}

if (dist > arm_max_length) //If the distance is less than the radius, it is already within the circle.
{
	var fromOriginToObject_x = sword_pos_x - temp_pin_x; //~GreenPosition~ - *BlackCenter*
	var fromOriginToObject_y = sword_pos_y - temp_pin_y; //~GreenPosition~ - *BlackCenter*
	fromOriginToObject_x *= arm_max_length / dist; 
	fromOriginToObject_y *= arm_max_length / dist; 
	
	sword_pos_x = temp_pin_x + fromOriginToObject_x
	sword_pos_y = temp_pin_y + fromOriginToObject_y
	
}

if abs(temp_pin_x-sword_pos_x) > 28 {
	sword_facing = sign(temp_pin_x-sword_pos_x)
}
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