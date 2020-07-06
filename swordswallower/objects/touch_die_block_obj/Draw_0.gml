/// @description Insert description here
// You can write your code in this editor
if timer_begin {
	//draw_sprite_ext(sprite_index,0,x+random_range(-2,2),y+random_range(-2,2),image_xscale,image_yscale,image_angle,c_white,1)
	
	draw_sprite_ext(brighterfloor2,0,x+random_range(-2,2),y-100+random_range(-2,2),0.75,0.75,0,c_white,1)
	draw_sprite_ext(brighterfloor2,0,x-100+random_range(-2,2),y-100+random_range(-2,2),0.75,0.75,0,c_white,1)
	draw_sprite_ext(brighterfloor2,0,x-200+random_range(-2,2),y-100+random_range(-2,2),0.75,0.75,0,c_white,1)
	draw_sprite_ext(brighterfloor2,0,x+100+random_range(-2,2),y-100+random_range(-2,2),0.75,0.75,0,c_white,1)
	draw_sprite_ext(brighterfloor2,0,x+200+random_range(-2,2),y-100+random_range(-2,2),0.75,0.75,0,c_white,1)
	draw_sprite_ext(brighterfloor2,0,x-300+random_range(-2,2),y-100+random_range(-2,2),0.75,0.75,0,c_white,1)
	draw_sprite_ext(brighterfloor2,0,x+300+random_range(-2,2),y-100+random_range(-2,2),0.75,0.75,0,c_white,1)
} else {
	
	
	//draw_sprite_ext(sprite_index,0,x,y,image_xscale,image_yscale,image_angle,c_white,1)
	draw_sprite_ext(brighterfloor2,0,x,y-100,0.75,0.75,0,c_white,1)
	draw_sprite_ext(brighterfloor2,0,x-100,y-100,0.75,0.75,0,c_white,1)
	draw_sprite_ext(brighterfloor2,0,x-200,y-100,0.75,0.75,0,c_white,1)
	draw_sprite_ext(brighterfloor2,0,x+100,y-100,0.75,0.75,0,c_white,1)
	draw_sprite_ext(brighterfloor2,0,x+200,y-100,0.75,0.75,0,c_white,1)
	draw_sprite_ext(brighterfloor2,0,x-300,y-100,0.75,0.75,0,c_white,1)
	draw_sprite_ext(brighterfloor2,0,x+300,y-100,0.75,0.75,0,c_white,1)


}