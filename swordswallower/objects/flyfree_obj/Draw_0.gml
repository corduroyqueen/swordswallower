/// @description Insert description here
// You can write your code in this editor

if death {
	
} else {
	mask_index = fly_idle
	if state==state_idle {
		draw_sprite_ext(eyeidle,0,x,y,sign(x-player_obj.x)*
		0.45,0.45,0,c_white,1)
		
		idle_t++
		if idle_t>idle_t_m {
			idle_t = 0
			idle_eye_ang = random_range(0,360)
			idle_t_m = random_range(30,90)
		}
		
		draw_sprite_ext(eyebat_flying1,0,x,y,sign(x-player_obj.x)*
		0.6,0.6,0,c_white,1)
		
		//4.5
		idle_eye_x = lerp(idle_eye_x,x+lengthdir_x(7,idle_eye_ang),0.2)
		idle_eye_y = lerp(idle_eye_y,y-7+lengthdir_y(7,idle_eye_ang),0.2)
		
		draw_sprite_ext(eyespr,0,
		idle_eye_x,
		idle_eye_y,
		1.5,1.5,0,c_white,1)
		
		//draw_sprite_ext(eyebat_flying1,0,x,y,sign(x-player_obj.x)*
		//0.6,0.6,0,c_gray,1)
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
	
		y - 7 + beepy + lengthdir_y(4.5,point_direction(x,y,player_obj.x,player_obj.y)),
		1.7,1.7,0,c_white,1)
		
	}
}