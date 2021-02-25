/// @description Insert description here
// You can write your code in this editor
gpu_set_colorwriteenable(1,1,1,0)
if !instance_exists(piece1) {
	draw_self()
	if d_portal {
		draw_sprite(desert,0,x,y)
	}
}
gpu_set_colorwriteenable(1,1,1,1)