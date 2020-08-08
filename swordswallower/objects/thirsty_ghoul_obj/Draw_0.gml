/// @description Insert description here
// You can write your code in this editor
image_xscale = sign(hsp)
if hsp==0 {
	image_xscale=1
}
if charging {
	sprite_index = thirsty_ghoul_t1
} else {
	sprite_index = thirsty_ghoul_t	
}

draw_self()
