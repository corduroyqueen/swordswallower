var hair_p_length = 30
var decel_k = 0.2
var grav = 0.5
var pin_x = head_pos_table_x[image_index]
var pin_y = head_pos_table_y[image_index]

hair_1_x[|0] = pin_x + 145
hair_1_y[|0] = pin_y + 110

for(var i = 1;i<hair_length;i++) {
	hair_1_x[|i] -= (player_obj.x - player_obj.xpreva)
	hair_1_y[|i] -= (player_obj.y - player_obj.ypreva)
	
	if player_obj.k_left || player_obj.k_right {
		hair_1_vx[|i] = player_obj.hsp
	}
	if abs(player_obj.vsp) > 0 {
		hair_1_vy[|i] = player_obj.vsp
	}
	
	if abs(hair_1_vx)>0 {
		hair_1_vx[|i] -= sign(hair_1_vx[|i]) * decel_k
	}
	if abs(hair_1_vy)>0 {
		hair_1_vy[|i] -= sign(hair_1_vy[|i]) * decel_k
	}
	
	hair_1_vy[|i] += grav
	
	hair_1_x[|i] += hair_1_vx[|i]
	hair_1_y[|i] += hair_1_vy[|i]
}

for(var pts=1;pts<hair_length;pts++) {
	
	
	var pox = hair_1_x[|pts]
	var poy = hair_1_y[|pts]
	var ptx = hair_1_x[|pts-1]
	var pty = hair_1_y[|pts-1]
	
	if point_distance(pox,poy,ptx,pty)>hair_p_length {
		hair_1_x[|pts] = fix_point_to_pointx(pox,poy,ptx,pty,hair_p_length)
		hair_1_y[|pts] = fix_point_to_pointy(pox,poy,ptx,pty,hair_p_length)
	}
}