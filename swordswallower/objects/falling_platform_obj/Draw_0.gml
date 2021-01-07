//fuck yes
if falling && timer<timer_m {
	draw_sprite_ext(sprite_index,0,x+random_range(-5,5),y+random_range(-5,5),image_xscale,image_yscale,0,c_white,1)
} else {
	draw_self()
}