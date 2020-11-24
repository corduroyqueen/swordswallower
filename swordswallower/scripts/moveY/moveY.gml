amt = argument0

//amt *= dt

yRemainder = 0
yRemainder += amt
move = round(yRemainder)
if move!=0 {
	amt_of_move = abs(move);
	yRemainder -= move
	move_dir = sign(move)
	while amt_of_move != 0 {
		if !wall_detect(x,y+move_dir) {
			y += move_dir
			amt_of_move -= 1
		} else if move_dir<0 && !wall_detect(x-1,y+move_dir) {
			y += move_dir
			x -= 1
			amt_of_move -= 1
		} else if move_dir<0 && !wall_detect(x+1,y+move_dir) {
			y += move_dir
			x += 1
			amt_of_move -= 1
		} else  {
			if object_index==player_obj && vsp>0 {
				instance_create_depth(x,y+32,depth-1,landing_particle_obj)	
			}
			vsp=0
			if variable_instance_exists(id,"hp") && 
			(place_meeting(x,y+move_dir,wall_hazard_obj) || place_meeting(x,y+move_dir,moving_hazard_obj)) {
				hp-=10
			}
			break;
		}
	}
}