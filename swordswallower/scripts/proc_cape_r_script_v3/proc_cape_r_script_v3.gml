var cape_p = 27

var temp_image_index = image_index
var add=0
if !(player_obj.k_left || player_obj.k_right) {
	add=5
}
var p_x = 160
var p_y = 165

if player_obj.k_left {
	p_x = 175
	p_y = 155
}
if player_obj.k_right {
	p_x = 145
	p_y = 165
}
var gravcape = 25

cape_p_r_x[|0] = p_x// + (arm_pos_table_x[temp_image_index]-arm_add_f) * -image_xscale

if sprite_index==s_player_idle_e {
	//cape_p_r_x[|0]+=(-3 * image_xscale)
	gravcape = 25
} else {
	gravcape = 0.5
}

cape_p_r_y[|0] = p_y + arm_pos_table_y[temp_image_index] - 1 - add
if player_obj.k_down && player_obj.grounded {
	cape_p_r_y[|0]+=25
}


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
var time = current_time/500
var timec = sin(time) * 60
var point_step = 1.5

target_for_pt_x = lengthdir_x(cape_p,300 + timec)
target_for_pt_y = lengthdir_y(cape_p,360 + timec)

var windx, windy, lengthwind
for(var pts=1;pts<4;pts++) {
	var phsp=0
	var pvsp=0
	var px = cape_p_r_x[|pts]
	var py = cape_p_r_y[|pts]
	
	
	
	phsp -= ((player_obj.x - player_obj.xpreva) * 0.75)//  + lengthdir_x(0.1,45 - (pts * 10))
	pvsp += -((player_obj.y - player_obj.ypreva)*0.75) + (gravcape + pts * 5)//  + lengthdir_y(0.1,45 - (pts * 10))
	
	px += phsp
	py += pvsp
	
	if player_obj.k_left {
		px += 200
		//py += -5
	} else if player_obj.k_right {
			
		while px > 150 {
			px += -1
		}
		px = 150
	}
	
	cape_p_r_x[|pts] = px
	cape_p_r_y[|pts] = py
	
}


for(var pts=1;pts<4;pts++) {
	
	
	var pox = cape_p_r_x[|pts]
	var poy = cape_p_r_y[|pts]
	var ptx = cape_p_r_x[|pts-1]
	var pty = cape_p_r_y[|pts-1]
	
	if point_distance(pox,poy,ptx,pty)>cape_p {
		cape_p_r_x[|pts] = fix_point_to_pointx(pox,poy,ptx,pty,cape_p)
		cape_p_r_y[|pts] = fix_point_to_pointy(pox,poy,ptx,pty,cape_p)
	}
}