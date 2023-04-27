
if sprite_index!=s_player_idle_e {
	return
}
var k = 0.4

for(var pts=1;pts<6;pts++) {
	var p1x = hair_p_l_x[|pts]
	var p1y = hair_p_l_y[|pts]
	var p2x = hair_p_r_x[|pts]
	var p2y = hair_p_r_y[|pts]
	
	var dist = point_distance(p1x,p1y,p2x,p2y)
	var diff = dist - hair_p_springs[|pts]
	var dir = point_direction(p1x,p1y,p2x,p2y)
	
	var v =  (1 * k * diff)
	hair_p_l_x[|pts] += lengthdir_x(v,dir)
	hair_p_l_y[|pts] += lengthdir_y(v,dir)
	
	dir = point_direction(p2x,p2y,p1x,p1y)
	
	hair_p_r_x[|pts] += lengthdir_x(v,dir)
	hair_p_r_y[|pts] += lengthdir_y(v,dir)
}

