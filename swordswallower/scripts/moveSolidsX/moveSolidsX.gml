amt = argument0

yRemainder = 0
yRemainder += amt
move = round(yRemainder)
if move!=0 {
	yRemainder -= move
	move_dir = sign(move)
	while move != 0 {
		if !wall_detect_solids(x+move_dir,y) {
			x += move_dir
			move -= move_dir
		} else {
			hsp=0
			break;
		}
	}
}