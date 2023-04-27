
if sprite_index!=s_player_idle_e {
	return
}
var k = 0.3

for(var pts=1;pts<4;pts++) {
	var p1x = cape_p_l_x[|pts]
	var p1y = cape_p_l_y[|pts]
	var p2x = cape_p_r_x[|pts]
	var p2y = cape_p_r_y[|pts]
	
	var dist = point_distance(p1x,p1y,p2x,p2y)
	var diff = dist - cape_p_springs[|pts]
	var dir = point_direction(p1x,p1y,p2x,p2y)
	
	var v =  (1 * k * diff)
	cape_p_l_x[|pts] += lengthdir_x(v,dir)
	cape_p_l_y[|pts] += lengthdir_y(v,dir)
	
	dir = point_direction(p2x,p2y,p1x,p1y)
	
	cape_p_r_x[|pts] += lengthdir_x(v,dir)
	cape_p_r_y[|pts] += lengthdir_y(v,dir)
}


/*for(var pts=1;pts<7;pts++) {
	var p1x = cape_p_l_x[|pts]
	var p1y = cape_p_l_y[|pts]
	var p2x = cape_p_r_x[|pts]
	var p2y = cape_p_r_y[|pts]
	
	var dist = point_distance(p1x,p1y,p2x,p2y)
	var diff = dist - cape_p_springs[|pts]
	var dir = point_direction(p1x,p1y,p2x,p2y)
	
	cape_p_r_x[|pts] = p1x + lengthdir_x(cape_p_springs[|pts],dir)
	cape_p_r_y[|pts] = p1y + lengthdir_y(cape_p_springs[|pts],dir)
	
	cape_p_l_x[|pts] = p2x + lengthdir_x(cape_p_springs[|pts],dir-180)
	cape_p_l_y[|pts] = p2y + lengthdir_y(cape_p_springs[|pts],dir-180)
}*/