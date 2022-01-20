var temp_pin_x = arm_pin_x - 150 + player_obj.x
var temp_pin_y = arm_pin_y - 150 + player_obj.y

var facing
facing = sword_facing

var tempa = convert_angle(sword_ang) + 90 + facing * 5
if sword_recoil {
	if !player_obj.grounded || collision_line(player_obj.x,player_obj.y,player_obj.x,player_obj.y+80,thin_floor_obj,false,true) {
		sword_recoil = false
		return
	}
	angsp += facing*0.1
	sword_ang+=sqr(angsp) * sqr(angsp) * sign(facing)
	if abs(angsp)<0.2 {
		sword_pos_x-=dcos(tempa)*80
		sword_pos_y+=dsin(tempa)*80
	}
	if collision_line(sword_pos_x,sword_pos_y,sword_pos_x+dcos(tempa)*108,sword_pos_y-dsin(tempa)*108,all_walls_parent_obj,false,true) {
		if abs(angsp)<1.5 {
			sword_recoil = false
			
		} else {
			sword_ang-=sqr(angsp) * sqr(angsp) *sign(facing)
		//	sword_ang = point_direction(sword_pos_x,sword_pos_y,sword_pos_x+dcos(tempa)*108,sword_pos_y-dsin(tempa)*108) - 90 - facing * 5
			sword_ang-=facing* sqr(angsp+1*sign(angsp)) * 1
			angsp=0.5 * sign(facing)
		}
		
	}
	
	return
} 
angsp = 0	

for(t=60;t<180;t+=2) {
	var ang = 90+(t*facing)
	//draw_circle(sword_pos_x+cos(degtorad(ang))*125,sword_pos_y-sin(degtorad(ang))*125,t,false)
	if collision_line(sword_pos_x,sword_pos_y,sword_pos_x+cos(degtorad(ang))*125,sword_pos_y-sin(degtorad(ang))*125,all_walls_parent_obj,false,true) {
		sword_ang = ((t-8)*facing)
		part_floor_spawnx = sword_pos_x + dcos(sword_ang+90)*125
		part_floor_spawny = sword_pos_y - dsin(sword_ang+90)*125
		break
	}	
}

//draw_circle(sword_pos_x,sword_pos_y,108,true)