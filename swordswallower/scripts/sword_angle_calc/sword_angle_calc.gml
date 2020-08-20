var temp_pin_x = arm_pin_x - 150 + player_obj.x
var temp_pin_y = arm_pin_y - 150 + player_obj.y

var facing
facing = sword_facing

for(t=60;t<180;t++) {
	var ang = 90+(t*facing)
	draw_circle(sword_pos_x+cos(degtorad(ang))*108,sword_pos_y-sin(degtorad(ang))*108,t,false)
	if collision_line(sword_pos_x,sword_pos_y,sword_pos_x+cos(degtorad(ang))*108,sword_pos_y-sin(degtorad(ang))*108,all_walls_parent_obj,false,true) {
		sword_ang = ((t-5)*facing)
		break
	}	
}

draw_circle(sword_pos_x,sword_pos_y,108,true)