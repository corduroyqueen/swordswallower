/// @description Insert description here
// You can write your code in this editor

if death {
	
} else {
	mask_index = fly_idle
	if state==state_idle {
		draw_sprite_ext(eyeidle,0,x,y,sign(x-player_obj.x)*
		0.45,0.45,0,c_white,1)
		draw_sprite_ext(eyebat_flying1,0,x,y,sign(x-player_obj.x)*
		0.6,0.6,0,c_gray,1)
		fuck =0
	} else if state==state_chasing {
		//image_speed = 1
		
		fuck+= (1/3)
		if fuck>=7 {
			fuck=0	
		}
		
		
		
		draw_sprite_ext(eyebat_flying,floor(fuck),x,y,sign(x-player_obj.x)*
		0.45,0.45,0,c_white,1)
		
		if chirp_timer<8 {
			beepx = random_range(-11,11)	
			beepy = random_range(-11,11)	
		} else {
			beepx = 0
			beepy = 0
		}
		
		draw_sprite_ext(eyebat_flying1,0,x+beepx,y+beepy,sign(x-player_obj.x)*
		0.6,0.6,0,c_white,1)
		
		
		draw_sprite_ext(eyespr,0,
		x + beepx + lengthdir_x(4.5,point_direction(x,y,player_obj.x,player_obj.y)),
	
		y - 3 + beepy + lengthdir_y(4.5,point_direction(x,y,player_obj.x,player_obj.y)),
		2,2,0,c_white,1)
		
	}
}