/// @description Insert description here
// You can write your code in this editor

timer++
if timer>200 {
	timer = 0
	polarity = -polarity
}

moving_plat_move(polarity,0)