obj = argument0

iteration_num = 4;

//xdelt = x - xprevious;
//ydelt = y - yprevious;
xdelt = x - xpreva;
ydelt = y - ypreva;
//how many iterations ahead to check for corners


//for(i=0; i < iteration_num; i++){
//	if(collision_wall_check(xprevious + xdelt * (i/iteration_num), yprevious + ydelt * (i/iteration_num),obj)){
//		break;
//	}
//}
if player_obj.tail_planted {
	return
}
for(i=0; i < iteration_num; i++){
	if collision_wall_check(
	xpreva + xdelt * (i/iteration_num), 
	ypreva + ydelt * (i/iteration_num),
	obj,
	i,
	xpreva + xdelt * ((i+cca)/iteration_num),
	ypreva + ydelt * ((i+cca)/iteration_num)){
		break;
	}
}
