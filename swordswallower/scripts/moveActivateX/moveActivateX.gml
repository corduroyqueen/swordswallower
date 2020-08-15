amt = argument0

xRemainder = 0
xRemainder += amt
move = round(xRemainder)
if move!=0 {
	xRemainder -= move
	move_dir = sign(move)
	while move != 0 {
		if !wall_detect_solids(x+move_dir,y) {
			x += move_dir
			move -= move_dir
		} else {
			hsp=0
			on_wall = true
			break;
		}
	}
}