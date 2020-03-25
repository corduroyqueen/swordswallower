obj = argument0

iteration_num = 3;

//xdelt = x - xprevious;
//ydelt = y - yprevious;
xdelt = x - xpreva;
ydelt = y - ypreva;

for(i=0; i < iteration_num; i++){
	if(collision_flyingguy_check(xpreva + xdelt * (i/iteration_num), ypreva + ydelt * (i/iteration_num),obj)){
		break;
	}
}
