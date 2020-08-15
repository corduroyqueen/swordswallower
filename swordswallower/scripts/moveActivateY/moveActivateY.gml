amt = argument0

yRemainder = 0
yRemainder += amt
move = round(yRemainder)
if move!=0 {
	yRemainder -= move
	move_dir = sign(move)
	while move != 0 {
		if !wall_detect_solids(x,y+move_dir) {
			y += move_dir
			move -= move_dir
		} else {
			vsp=0
			on_wall = true
			break;
		}
	}
}