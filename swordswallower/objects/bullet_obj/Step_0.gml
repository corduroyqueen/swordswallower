/// @description Insert description here
// You can write your code in this editor

if death { instance_destroy() }

xdelt = x - xpreva1
ydelt = y - ypreva1;

for(i=0; i < iteration_num; i++){
	
	if place_meeting(xpreva1 + xdelt * (i/iteration_num), 
	ypreva1 + ydelt * (i/iteration_num),player_obj) {
		perform_player_damage(1)
		break;
	}
	
	if wall_checker(xpreva1 + xdelt * (i/iteration_num), 
	ypreva1 + ydelt * (i/iteration_num)) {
		endx = xpreva1 + xdelt * (i/iteration_num)
		endy = ypreva1 + ydelt * (i/iteration_num)
		death = true
		break;	
	}
	
}

move_towards_point(x+(endx-startx),y+(endy-starty),mspeed)

xpreva4 = xpreva3
ypreva4 = ypreva3

xpreva3 = xpreva2
ypreva3 = ypreva2

xpreva2 = xpreva1
ypreva2 = ypreva1

xpreva1 = x
ypreva1 = y