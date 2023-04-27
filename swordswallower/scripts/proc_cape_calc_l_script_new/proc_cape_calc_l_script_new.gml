var cape_p = 22

var temp_image_index = image_index
var add=0
if !(player_obj.k_left || player_obj.k_right) {
	add=5
}
var gravcape = 25

cape_p_l_x[|0] = 150 + (5*image_xscale) + (arm_pos_table_x[temp_image_index]-arm_add_f) * -image_xscale
if sprite_index==s_player_idle_e {
	cape_p_l_x[|0]+=(8 * image_xscale)
	gravcape = 25
} else {
	gravcape = 0.5
}


cape_p_l_y[|0] = 155 + arm_pos_table_y[temp_image_index] - 2 - add

if player_obj.k_down && player_obj.grounded {
	cape_p_l_y[|0]+=25
}


var farx = player_obj.x-150
var fary = player_obj.y-150
var ground 
if player_obj.grounded {
	ground =1
} else {ground=0}
var psp = pythag(player_obj.hsp,player_obj.vsp)

var target_for_pt_x, target_for_pt_y
var time = current_time/500
var timec = sin(time) * 60

target_for_pt_x = lengthdir_x(cape_p,180 + timec)
target_for_pt_y = lengthdir_y(cape_p,180 + timec)

var time_offset = 0.8
var point_step = 1.5

//cape_p_l_x[|1] = lerp(cape_p_l_x[|1],cape_p_l_x[|0] + target_for_pt_x,1)
//cape_p_l_y[|1] = lerp(cape_p_l_y[|1],cape_p_l_y[|0] + target_for_pt_y,1)
var windx, windy, lengthwind
for(var pts=1;pts<7;pts++) {
	var phsp=0
	var pvsp=0
	var px = cape_p_l_x[|pts]
	var py = cape_p_l_y[|pts]
	
	
	
	
	cape_p_l_wind_timer[|pts]+=0.05
	var tang = point_direction(px,py,cape_p_l_x[|pts-1],cape_p_l_y[|pts-1])
	
	
	
	phsp -= (player_obj.x - player_obj.xpreva) + (floor(cape_p_l_wind_timer[|pts])*dcos(tang+90*-sign(phsp)) * (2 + power(pts,1.5)) * psp/2 * ground)
	pvsp += -(player_obj.y - player_obj.ypreva) + (gravcape + pts * 5) - (floor(cape_p_l_wind_timer[|pts])*dsin(tang+90*-sign(phsp)) * (2 + power(pts,1.5)) * psp/2 * ground)//(10+pts)
	
	// badmvc
	if sprite_index==s_player_idle_e {
		lengthwind = (sin(pts * point_step + time + time_offset)+2) * 4 * pts * (pts/2)
		windx = lengthdir_x(lengthwind,170)
		windy = lengthdir_y(lengthwind,170)
	
		phsp += windx
		pvsp += windy
	}
	
	if cape_p_l_wind_timer[|pts] >=1 {
		cape_p_l_wind_timer[|pts]=0
	}
	
	px += phsp
	py += pvsp
	
	
	if player_obj.grounded && !(player_obj.k_left || player_obj.k_right) {
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
		
		
	}
	//if round(pts)==3 {
	//	while abs(px+farx-player_obj.x)<25 {
	//		px+=sign(image_xscale)
	//	}
	//}
	//if round(pts)==4 {
	//	while abs(px+farx-player_obj.x)<34 {
	//		px+=sign(image_xscale)
	//	}
	//}
	
	//draw_set_color(c_green)
	//draw_circle(farx+px,fary+py,5,false)
	//draw_set_color(c_white)
	/*if pvsp>0 && (fary+py-25>player_obj.y-10)&& place_meeting(farx+px,fary+py-25,wall_parent_obj) {
		var tobj = instance_place(farx+px,fary+py-25,wall_parent_obj)
		
		//py = default_collision_y_only(farx+px,fary+py-25,pvsp,tobj) - fary+25
		//px = default_collision_x_only(farx+px,fary+py-25,-phsp,tobj) - farx
		
	}*/
	
	
	//draw_set_color(c_fuchsia)
	//draw_circle(farx+px,fary+py,5,false)
	//draw_set_color(c_white)
	
	cape_p_l_x[|pts] = px
	cape_p_l_y[|pts] = py
	
}


for(var pts=1;pts<7;pts++) {
	
	
	var pox = cape_p_l_x[|pts]
	var poy = cape_p_l_y[|pts]
	var ptx = cape_p_l_x[|pts-1]
	var pty = cape_p_l_y[|pts-1]
	
	if point_distance(pox,poy,ptx,pty)>cape_p {
		cape_p_l_x[|pts] = fix_point_to_pointx(pox,poy,ptx,pty,cape_p)
		cape_p_l_y[|pts] = fix_point_to_pointy(pox,poy,ptx,pty,cape_p)
	}
}

//for(var pts=1;pts<7;pts++) {
//	var px = cape_p_l_x[|pts]
//	var py = cape_p_l_y[|pts]
	
//	draw_set_color(c_green)
//	draw_circle(farx+px,fary+py,5,false)
//	draw_set_color(c_white)
//	if place_meeting(farx+px,fary+py,wall_parent_obj) {
//		var tobj = instance_place(farx+px,fary+py,wall_parent_obj)
//	//	px = default_collision_x_only(farx+px,fary+py,phsp,tobj) - farx
//		py = default_collision_y_only(farx+px,fary+py,pvsp,tobj) - fary
//	}
	
	
//	cape_p_l_x[|pts] = px
//	cape_p_l_y[|pts] = py
	
//}