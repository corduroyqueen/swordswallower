/// @description Insert description here
// You can write your code in this editor

gpu_set_colorwriteenable(1,1,1,1)

if player_obj.tail_carry || player_obj.tail_planted {
	met = false	
}


//draw_sprite_ext(candle551,0,x,y,1,1,0,c_white,1)


if !destroy {
	if !in_camera_range_bigger(tx,ty) {
		return
	}
	
	var bc = global.blood_color
	bc = make_color_rgb(255*0.9,255*0.0,255*0.3)
	bc = make_color_rgb(255*1.0,255*0.3,255*0.5)
	//bc = make_color_rgb(255,255,255)
		gpu_set_blendmode(bm_add)
	//draw_circle(x+s_x,y+s_y,70+random_range(-5,5),false)
	//var s = random_range(0.8,1.5)
	//draw_sprite_ext(blood_sprite_spr1,0,x+s_x,y+s_y,s,s,0,global.magic_color,0.08)
	//draw_sprite_ext(blood_sprite_spr1,0,x+s_x,y+s_y,s*0.1,s*0.1,0,global.magic_color,0.1)
	//draw_sprite_ext(blood_sprite_spr11,0,x+s_x,y+s_y,s,s,0,c_fuchsia,0.05)
	var s = random_range(0.53,0.57)
	draw_set_color(bc)
		draw_set_alpha(light_strength_bkd*0.5)
		//draw_circle(x,y,50*s*10*light_radius,false)
		//draw_circle(x,y,25*s*light_radius,false)
		
		//draw_circle(x,y,25*s*light_radius,false)
	
	//draw_sprite_ext(blood_sprite_spr11,0,x,y,s*10,s*10,0,bc,light_strength_bkd)
	//draw_set_color(c_white)
	//draw_set_alpha(0.1)
	
	
	//bc = make_color_rgb(255*0.9,255*0.0,255*0.3)
	//draw_set_color(bc)
	
	
	draw_sprite_ext(blood_sprite_spr11,0,x,y,s*8,s*8,0,bc,light_strength_bkd)
	draw_set_alpha(0.05)
	draw_set_alpha(0.03)
	draw_circle(x,y,150*s*light_radius,false)
	//draw_sprite_ext(blood_sprite_spr11,0,x,y,s*2,s*2,0,bc,0.7)
	draw_set_color(c_white)
	draw_set_alpha(0.02)
	//draw_set_alpha(0.03)
	
	//draw_set_alpha(0.07)
	//gpu_set_blendmode(bm_normal)
	
	draw_circle(x,y,1100*s*light_radius,false)
	//gpu_set_blendmode(bm_normal)
	//draw_set_alpha(0.07)
	//draw_circle(x,y,200*s*light_radius,false)
	draw_set_alpha(1)
	gpu_set_blendmode(bm_normal)
	// SET VALUES:
	//-----------------------------------------------------------------------------
	time			= (time + 0.18 * 0.3) mod 1;

	var strength_x	= 0.44 * 0.3;		// [0, 0.3]
	var strength_y	= 0.44				// [0, 1]
	var size		= 0.5 + 0.25;	// [0.25, 0.75]
	var bend		= 0.5 * 2 - 1;		// [-1, +1]


	// DRAW:
	//-----------------------------------------------------------------------------

	//draw_self();

	gpu_set_tex_filter(true);		
	gpu_set_colorwriteenable(true,true,true,false)
	shader_set(shader);
		texture_set_stage(u_distort_tex, distort_tex);
		shader_set_uniform_f(u_time, time);
		shader_set_uniform_f(u_strength,	strength_x, strength_y);
		shader_set_uniform_f(u_size,		size);
		//shader_set_uniform_f(u_bend,		bend);
	
		draw_sprite_ext(sprites[sprite], 0, x+1, y+1,0.6,1,0,c_white,1)
	shader_reset();
	gpu_set_colorwriteenable(true,true,true,true)
	
} else {
	if init {
		audio_play_sound(candle_out1,0,false)
		init = false
	}	
}

gpu_set_colorwriteenable(true,true,true,true)
