/// @description Insert description here
// You can write your code in this editor
if death {
	draw_self()
	draw_sprite(fire_proj_t,image_index,x,y)
	death_timer++
	if death_timer>40 {
		instance_destroy()	
	}
} else {
	draw_self()	
}