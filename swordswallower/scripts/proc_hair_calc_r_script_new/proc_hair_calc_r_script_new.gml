var hair_p = 15

var temp_image_index = image_index
var add=0
var pin_x = head_pos_table_x[image_index]
var pin_y = head_pos_table_y[image_index]

if !(player_obj.k_left || player_obj.k_right) {
	add=5
}

hair_p_r_x[|0] = pin_x + 145
hair_p_r_y[|0] = pin_y + 110


var farx = player_obj.x-150
var fary = player_obj.y-150
var ground 
if player_obj.grounded {
	ground =1
} else {ground=0}
var psp = pythag(player_obj.hsp,player_obj.vsp)
var add_y_grav = 0
if player_obj.grounded && abs(player_obj.hsp)>0.01 {
	add_y_grav=2
}

var target_for_pt_x, target_for_pt_y
var time = current_time/250 + 0.15316
var timec = sin(time) * 60
var gravhair = 25
var point_step = 1.5

target_for_pt_x = lengthdir_x(hair_p,300 + timec)
target_for_pt_y = lengthdir_y(hair_p,360 + timec)

//hair_p_r_x[|1] = lerp(hair_p_r_x[|1],hair_p_r_x[|0] + target_for_pt_x,1)
//hair_p_r_y[|1] = lerp(hair_p_r_y[|1],hair_p_r_y[|0] + target_for_pt_y,1)
var windx, windy, lengthwind
for(var pts=1;pts<6;pts++) {
	var phsp=0
	var pvsp=0
	var px = hair_p_r_x[|pts]
	var py = hair_p_r_y[|pts]
	
	var tang = point_direction(px,py,hair_p_r_x[|pts-1],hair_p_r_y[|pts-1])
	
	phsp -= (player_obj.x - player_obj.xpreva)
	pvsp += -(player_obj.y - player_obj.ypreva) + (gravhair + pts * 5)
	
	lengthwind = (sin(pts * point_step + time)+2) * 30
	windx = lengthdir_x(lengthwind,10)
	windy = lengthdir_y(lengthwind,10)
	
	phsp += windx
	pvsp += windy
	
	px += phsp
	py += pvsp//+add_y_grav
	
	/*if player_obj.grounded && abs(pvsp)<0.01 {
		while abs(px+farx-player_obj.x)<3+(pts*3) {
			px-=sign(image_xscale)
		}
	} else if !player_obj.grounded {
		if abs(px+farx-player_obj.x)<5+(pts*10) {
			px-=sign(image_xscale)
		}
	}*/
	hair_p_r_x[|pts] = px
	hair_p_r_y[|pts] = py
	
}


for(var pts=1;pts<6;pts++) {
	
	
	var pox = hair_p_r_x[|pts]
	var poy = hair_p_r_y[|pts]
	var ptx = hair_p_r_x[|pts-1]
	var pty = hair_p_r_y[|pts-1]
	
	if point_distance(pox,poy,ptx,pty)>hair_p {
		hair_p_r_x[|pts] = fix_point_to_pointx(pox,poy,ptx,pty,hair_p)
		hair_p_r_y[|pts] = fix_point_to_pointy(pox,poy,ptx,pty,hair_p)
	}
}
//	hair_p_r_x[|pts] = px
//	hair_p_r_y[|pts] = py
	
//}