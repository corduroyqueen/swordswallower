amt = argument0

xRemainder = 0
xRemainder += amt
move = round(xRemainder)
if move!=0 {
	xRemainder -= move
	move_dir = sign(move)
	while move != 0 {
		if !wall_sword_detect(x+move_dir,y) {
			x += move_dir
			move -= move_dir
		} else {
			hsp=0
			sword_plant(instance_place(x+move_dir, y, wall_parent_obj))
			break;
		}
	}
}