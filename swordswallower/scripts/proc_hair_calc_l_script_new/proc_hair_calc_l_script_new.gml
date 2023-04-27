var hair_p = 15

var temp_image_index = image_index
var pin_x = head_pos_table_x[image_index]
var pin_y = head_pos_table_y[image_index]

hair_p_l_x[|0] = pin_x + 145
hair_p_l_y[|0] = pin_y + 110

var farx = player_obj.x-150
var fary = player_obj.y-150

var ground 
if player_obj.grounded {
	ground =1
} else {ground=0}

var target_for_pt_x, target_for_pt_y
var time = current_time/250 + 0.61395
var timec = sin(time) * 60
var gravhair = 25

target_for_pt_x = lengthdir_x(hair_p,180 + timec)
target_for_pt_y = lengthdir_y(hair_p,180 + timec)

var time_offset = 0.8
var point_step = 1.5

//hair_p_l_x[|1] = lerp(hair_p_l_x[|1],hair_p_l_x[|0] + target_for_pt_x,1)
//hair_p_l_y[|1] = lerp(hair_p_l_y[|1],hair_p_l_y[|0] + target_for_pt_y,1)
var windx, windy, lengthwind
for(var pts=1;pts<6;pts++) {
	var phsp=0
	var pvsp=0
	var px = hair_p_l_x[|pts]
	var py = hair_p_l_y[|pts]
	
	
	
	
	var tang = point_direction(px,py,hair_p_l_x[|pts-1],hair_p_l_y[|pts-1])
	
	
	
	phsp -= (player_obj.x - player_obj.xpreva)
	pvsp += -(player_obj.y - player_obj.ypreva) + (gravhair + pts * 5)
	
	lengthwind = (sin(pts * point_step + time + time_offset)+2) * 30
	windx = lengthdir_x(lengthwind,170)
	windy = lengthdir_y(lengthwind,170)
	
	phsp += windx
	pvsp += windy
	
	px += phsp
	py += pvsp
	
	
	/*if player_obj.grounded && !(player_obj.k_left || player_obj.k_right) {
		while abs(px+farx-player_obj.x)<5+(pts*10) {
			px+=sign(image_xscale)
		}
	} else {
		if abs(px+farx-player_obj.x)<5+(pts*10) {
			px+=sign(image_xscale)*2
		}
	}
	if round(pts)==1 && (player_obj.k_left || player_obj.k_right) {
		if player_obj.k_left {
			while px<165 {
				px+=1
			}
		} else if player_obj.k_right {
			
			while px>125 {
				px-=1
			}
		}
		
		
	}*/
	hair_p_l_x[|pts] = px
	hair_p_l_y[|pts] = py
	
}


for(var pts=1;pts<6;pts++) {
	
	
	var pox = hair_p_l_x[|pts]
	var poy = hair_p_l_y[|pts]
	var ptx = hair_p_l_x[|pts-1]
	var pty = hair_p_l_y[|pts-1]
	
	if point_distance(pox,poy,ptx,pty)>hair_p {
		hair_p_l_x[|pts] = fix_point_to_pointx(pox,poy,ptx,pty,hair_p)
		hair_p_l_y[|pts] = fix_point_to_pointy(pox,poy,ptx,pty,hair_p)
	}
}
	
	
//	hair_p_l_x[|pts] = px
//	hair_p_l_y[|pts] = py
	
//}