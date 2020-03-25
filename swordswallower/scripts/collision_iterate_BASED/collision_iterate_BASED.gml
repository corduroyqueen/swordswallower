obj = argument0

iteration_num = 5;

//xdelt = x - xprevious;
//ydelt = y - yprevious;
xdelt = x - xpreva;
ydelt = y - ypreva;
cca = 2
//for(i=0; i < iteration_num; i++){
//	if(collision_wall_check(xprevious + xdelt * (i/iteration_num), yprevious + ydelt * (i/iteration_num),obj)){
//		break;
//	}
//}

for(i=0; i < iteration_num; i++){
	if(collision_wall_check(
	xpreva + xdelt * (i/iteration_num), 
	ypreva + ydelt * (i/iteration_num),obj,2,
	xpreva + xdelt * ((i+cca)/iteration_num),
	ypreva + ydelt * ((i+cca)/iteration_num))){
		break;
	}
}
