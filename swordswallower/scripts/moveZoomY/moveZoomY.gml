amt = argument0

//amt *= dt

yRemainder = 0;
yRemainder += amt;
move = round(yRemainder);
if (move != 0) {
	amt_of_move = abs(move);
	yRemainder -= move
	move_dir = sign(move)
	while amt_of_move > 0 {
		y += move_dir
		amt_of_move -= 1; 
	}
}