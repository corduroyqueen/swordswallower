var facing
facing = sign(image_xscale)

ang = 0
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
	
	draw_sprite_ext(sword4,0,x-2,y+3,-facing,1,ang,c_white,1)
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
	
	draw_sprite_ext(sword4,0,x+11*facing,y+1,-facing,1,ang,c_white,1)	
}