amt = argument0

//amt *= dt

xRemainder = 0;
xRemainder += amt;
move = round(xRemainder);
if (move != 0) {
	amt_of_move = abs(move);
	xRemainder -= move
	move_dir = sign(move)
	while amt_of_move > 0 {
		x += move_dir
		amt_of_move -= 1; 
	}
}