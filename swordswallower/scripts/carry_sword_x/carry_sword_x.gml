if isRiding_movplat(tail_obj) {
	with tail_obj {
		moveSolidsX(other.moveXPos); 
		moveSolidsY(other.moveYPos); 
	}
}