/// @description Insert description here
// You can write your code in this editor
draw_circle(x,y,10,false)
if !dormant || image_index>=1  {
	if master.timer>master.off_time-50  {
		draw_sprite_ext(sprite_index,image_index,startx+random_range(-3,3),starty+random_range(-3,3),0.5,0.5,image_angle+90,c_white,1)
	} else {
		draw_sprite_ext(sprite_index,image_index,startx,starty,0.5,0.5,image_angle+90,c_white,1)
	}
}

