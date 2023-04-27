var hair_p = 10

var pin_x = head_pos_table_x[image_index]
var pin_y = head_pos_table_y[image_index]
var point_amount = 5

var farx = player_obj.x-150
var fary = player_obj.y-150

var psp = pythag(player_obj.hsp,player_obj.vsp)

hair_p_l_x[|0] = pin_x + 150
hair_p_l_y[|0] = pin_y + 130

for (var pts = 1; pts<point_amount; pts++) {
	var phsp=0
	var pvsp=0
	var px = hair_p_l_x[|pts]
	var py = hair_p_l_y[|pts]
	
	//var tang = point_direction(px,py,hair_p_l_x[|pts-1],hair_p_l_y[|pts-1])
	
	//phsp -= (player_obj.x - player_obj.xpreva) + (floor(cape_p_l_wind_timer[|pts])*dcos(tang+90*-sign(phsp)) * (2 + power(pts,1.5)) * psp/2)
	//pvsp += -(player_obj.y - player_obj.ypreva) + 8 - (floor(cape_p_l_wind_timer[|pts])*dsin(tang+90*-sign(phsp)) * (2 + power(pts,1.5)) * psp/2)//(10+pts)
	
	phsp -= (player_obj.x - player_obj.xpreva) + temp_wind_velocity_x
	pvsp += -(player_obj.y - player_obj.ypreva) + temp_wind_velocity_y
	
	px += phsp
	py += pvsp
	
	//if !place_meeting(farx+px,fary+py-25+5,wall_parent_obj) {
	//	py += pvsp
	//}
	
	//if player_obj.grounded && !(player_obj.k_left || player_obj.k_right) {
	//	while abs(px+farx-player_obj.x)<5+(pts*10) {
	//		px+=sign(image_xscale)
	//	}
	//} else {
	//	if abs(px+farx-player_obj.x)<5+(pts*10) {
	//		px+=sign(image_xscale)*2
	//	}
	//}
	//if round(pts)==1 && (player_obj.k_left || player_obj.k_right) {
	//	if player_obj.k_left {
	//		while px<165 {
	//			px+=1
	//		}
	//	} else if player_obj.k_right {
			
	//		while px>125 {
	//			px-=1
	//		}
	//	}
	//}
	
	hair_p_l_x[|pts] = px
	hair_p_l_y[|pts] = py
}


for(var pts=1;pts<point_amount;pts++) {
	
	
	var pox = hair_p_l_x[|pts]
	var poy = hair_p_l_y[|pts]
	var ptx = hair_p_l_x[|pts-1]
	var pty = hair_p_l_y[|pts-1]
	
	if point_distance(pox,poy,ptx,pty)>hair_p {
		hair_p_l_x[|pts] = fix_point_to_pointx(pox,poy,ptx,pty,hair_p)
		hair_p_l_y[|pts] = fix_point_to_pointy(pox,poy,ptx,pty,hair_p)
	}
}