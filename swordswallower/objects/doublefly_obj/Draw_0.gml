/// @description Insert description here
// You can write your code in this editor
if death {
	
} else {
	gpu_set_colorwriteenable(1,1,1,0)
	mask_index = doublefly_flap
	if state==state_idle {
		draw_sprite_ext(eyeidle,0,x,y,0.6,0.6,0,c_white,1)
		draw_sprite_ext(eyebat_flying1,0,x-12,y,
		0.6,0.6,0,c_white,1)
		draw_sprite_ext(eyebat_flying1,0,x+12,y,
		0.6,0.6,0,c_white,1)
		
		
		idle_t1++
		if idle_t1>idle_t_m1 {
			idle_t1 = 0
			idle_eye_ang1 = random_range(0,360)
			idle_t_m1 = random_range(50,110)
		}
		idle_eye_x1 = lerp(idle_eye_x1,x-12+lengthdir_x(7,idle_eye_ang1),0.2)
		idle_eye_y1 = lerp(idle_eye_y1,y-7+lengthdir_y(7,idle_eye_ang1),0.2)
		
		draw_sprite_ext(pinkeye,0,
		idle_eye_x1,
		idle_eye_y1,
		1.5,1.5,0,c_white,1)
		
		
		
		idle_t2++
		if idle_t2>idle_t_m2 {
			idle_t2 = 0
			idle_eye_ang2 = random_range(0,360)
			idle_t_m2 = random_range(2,60)
		}
		idle_eye_x2 = lerp(idle_eye_x2,x+12+lengthdir_x(7,idle_eye_ang2),0.2)
		idle_eye_y2 = lerp(idle_eye_y2,y-7+lengthdir_y(7,idle_eye_ang2),0.2)
		
		draw_sprite_ext(greeneye,0,
		idle_eye_x2,
		idle_eye_y2,
		1.5,1.5,0,c_white,1)
		
		
		fuck =0
	} else if state==state_chasing {
		//image_speed = 1
		
		fuck+= (1/3)
		if fuck>=7 {
			fuck=0	
		}
		
		draw_sprite_ext(eyebat_flying,floor(fuck),x,y,sign(x-player_obj.x)*
		0.6,0.6,0,c_white,1)
		
		
		if chirp_timer<8 {
			beepx = random_range(-11,11)	
			beepy = random_range(-11,11)	
		} else {
			beepx = 0
			beepy = 0
		}
		
		draw_sprite_ext(eyebat_flying1,floor(fuck),x-12+beepx,y+beepy,sign(x-player_obj.x)*
		0.6,0.6,0,c_white,1)
		
		
		draw_sprite_ext(pinkeye,0,
		x - 12 + beepx + lengthdir_x(4.5,point_direction(x,y,player_obj.x,player_obj.y)),
	
		y - 7  +beepy +lengthdir_y(4.5,point_direction(x,y,player_obj.x,player_obj.y)),
		1.7,1.7,0,c_white,1)
		
		if chirp_timer<8 {
			beepx = random_range(-11,11)	
			beepy = random_range(-11,11)	
		} else {
			beepx = 0
			beepy = 0
		}
		
		draw_sprite_ext(eyebat_flying1,floor(fuck),x+12+beepx,y+beepy,sign(x-player_obj.x)*
		0.6,0.6,0,c_white,1)
		
		draw_sprite_ext(greeneye,0,
		x + 12 + beepx + lengthdir_x(4.5,point_direction(x,y,player_obj.x,player_obj.y)),
	
		y - 7 + beepy + lengthdir_y(4.5,point_direction(x,y,player_obj.x,player_obj.y)),
		1.7,1.7,0,c_white,1)
	}
	gpu_set_colorwriteenable(1,1,1,1)
	
}