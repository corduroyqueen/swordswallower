var cape_p = 19

cape_p_l_x[|0] = 150 + arm_pos_table_x[image_index] * -image_xscale
if sprite_index==s_player_idle_e {
	cape_p_l_x[|0]+=(8 * image_xscale)
}
cape_p_l_y[|0] = 150 + arm_pos_table_y[image_index] - 6
var farx = player_obj.x-150
var fary = player_obj.y-150
var ground 
if player_obj.grounded {
	ground =1
} else {ground=0}
var psp = pythag(player_obj.hsp,player_obj.vsp)
for(var pts=1;pts<7;pts++) {
	var phsp=0
	var pvsp=0
	var px = cape_p_l_x[|pts]
	var py = cape_p_l_y[|pts]
	
	
	
	
	cape_p_l_wind_timer[|pts]+=0.05
	var tang = point_direction(px,py,cape_p_l_x[|pts-1],cape_p_l_y[|pts-1])
	
	
	
	phsp -= (player_obj.x - player_obj.xpreva) + (floor(cape_p_l_wind_timer[|pts])*dcos(tang+90*-sign(phsp)) * (2 + power(pts,1.5)) * psp/2 * ground)
	pvsp += -(player_obj.y - player_obj.ypreva) + 8 - (floor(cape_p_l_wind_timer[|pts])*dsin(tang+90*-sign(phsp)) * (2 + power(pts,1.5)) * psp/2 * ground)//(10+pts)
	
	if cape_p_l_wind_timer[|pts] >=1 {
		cape_p_l_wind_timer[|pts]=0
	}
	
	px += phsp
	py += pvsp
	
	if round(pts)==1 {
		while abs(px+farx-player_obj.x)<13 {
			px+=sign(image_xscale)
		}
	}
	//draw_set_color(c_green)
	//draw_circle(farx+px,fary+py,5,false)
	//draw_set_color(c_white)
	if pvsp>0 && place_meeting(farx+px,fary+py-25,wall_parent_obj) {
		var tobj = instance_place(farx+px,fary+py-25,wall_parent_obj)
		
		py = default_collision_y_only(farx+px,fary+py-25,pvsp,tobj) - fary+25
		//px = default_collision_x_only(farx+px,fary+py-25,-phsp,tobj) - farx
		
	}
	
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