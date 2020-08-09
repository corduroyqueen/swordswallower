/// @description Insert description here
// You can write your code in this editor
//mask_index = -1
if closed {
	draw_self()
	image_index = 0
	//ask_index = sprite_index
	if round(image_angle) == 0 {
		draw_sprite_ext(keyhole,0,x-12,y+32,1.275,1.275,0,c_white,1)
	} else {
		draw_sprite_ext(keyhole,0,x-32,y-12,1.275,1.275,0,c_white,1)	
	}
	//draw_set_color(c_black)
	//draw_text(x,y,string(lock))
} else {
	image_speed = 2
	mask_index = nothing
	
	if sprite_index!=-4 {
		draw_self()	
	}
}