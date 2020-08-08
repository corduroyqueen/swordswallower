obj = argument0

iteration_num = 4;
if player_obj.tail_planted {
	return
}
//xdelt = x - xprevious;
//ydelt = y - yprevious;
xdelt = x - xpreva;
ydelt = y - ypreva;

for(i=0; i < iteration_num; i++){
	if(collision_enemy_check(
	xpreva + xdelt * (i/iteration_num), 
	ypreva + ydelt * (i/iteration_num),
	obj)){
		break;
	}
}
