amt = argument0

amt *= dt

xRemainder = 0;
xRemainder += amt;
move = round(xRemainder);
if (move != 0) {
	amt_of_move = abs(move);
	xRemainder -= move
	move_dir = sign(move)
	while amt_of_move > 0 {
		if (!wall_detect(x+move_dir,y)) {
			if (wall_detect(x+move_dir, y+2)
			&& !wall_detect(x+move_dir, y+1)) {
				//this is stairs moving down
				y += 1; 
			}
			x += move_dir
			amt_of_move -= 1;
		} else if (!wall_detect(x+move_dir, y-1)) {
			//this is stairs moving up
			x += move_dir;
			y -= 1;
			amt_of_move -= 2; 
		} else if (!wall_detect(x+move_dir*2, y-2)) {
			//this is stairs moving up
			x += move_dir;
			y -= 2;
			amt_of_move -= 2; 
		} else if (!wall_detect(x+move_dir*2, y-3)) {
			//this is stairs moving up
			x += move_dir;
			y -= 3;
			amt_of_move -= 2; 
		} else {
			hsp=0
			break;
		}
	}
}