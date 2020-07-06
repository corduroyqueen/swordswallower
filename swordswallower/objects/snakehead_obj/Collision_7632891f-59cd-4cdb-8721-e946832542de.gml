/// @description Insert description here
// You can write your code in this editor
if parent.state==parent.state_attacking {
	checkx = x+hspeed*2
	checky = y+vspeed*2
	with other {
		sever_g_particle_script()
		met = true
	}
}