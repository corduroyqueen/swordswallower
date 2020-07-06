/// @description Insert description here
// You can write your code in this editor

if alive {
	draw_self()

	dialogue_start_npc_script()
} else {
	
	if death_timer>200 {
		image_alpha = 0
	} else {
		death_timer++
		y--
		image_alpha-=0.01	
	}
}