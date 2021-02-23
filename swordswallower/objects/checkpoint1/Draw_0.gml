/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white)


gpu_set_colorwriteenable(true,true,true,false)

if setpoint {
	//draw_text(x-48,y-64,"checkpoint!")
	//draw_circle(x,y,5,true)
	
	
	
	if checkpoint_manager.checkpoint == self && !starting_bool {
		draw_sprite_ext(s_sprite,0,x,y,1,1,0,c_white,1)
		gpu_set_blendmode(bm_add)
		
		if point_distance(x,y,player_obj.camx+960,player_obj.camy+540)<1000 {
			audio_sound_gain(fire_sound,1,0)
			audio_emitter_gain(s_fire_emitter,
			clamp(0.05,abs(1000- point_distance(x,y,player_obj.camx+960,player_obj.camy+540))/1000,1000)/3 
			
			)
			
			audio_emitter_position(s_fire_emitter,
			mean(x,player_obj.x,player_obj.x),
			mean(x,player_obj.y,player_obj.y),
			0)
		} else {
			audio_emitter_gain(s_fire_emitter,0)
		}
		
		
		var ok = random_range(1.1,1.3)
		
		//draw_sprite_ext(Ellipse_2,0,x+s_x,y+s_y,ok*6,ok*6,0,c_white,0.125)
		
		//draw_sprite_ext(Ellipse_2,0,x+s_x,y+s_y,ok,ok,0,c_white,1)
		
		ok = random_range(0.2,0.7)
		
		//draw_sprite_ext(redblur,0,x+s_x,y+s_y,6,6,0,c_white,0.125)
		draw_set_alpha(0.2)
		draw_set_color(global.blood_color)
		var bc = global.blood_color
		bc = make_color_rgb(255*2,255*0.6,255*0.8)
		
		flame_object.tx = x+s_x
		flame_object.ty = y+s_y
		
		//draw_circle(x+s_x,y+s_y,70+random_range(-5,5),false)
		//var s = random_range(0.8,1.5)
		//draw_sprite_ext(blood_sprite_spr1,0,x+s_x,y+s_y,s,s,0,global.magic_color,0.08)
		//draw_sprite_ext(blood_sprite_spr1,0,x+s_x,y+s_y,s*0.1,s*0.1,0,global.magic_color,0.1)
		//draw_sprite_ext(blood_sprite_spr11,0,x+s_x,y+s_y,s,s,0,c_fuchsia,0.05)
		var s = random_range(1.45,1.5)
		draw_set_color(bc)
		draw_set_alpha(light_strength_bkd*0.05)
		draw_circle(x+s_x,y+s_y,50*s*10*light_radius,false)
		bc = make_color_rgb(255*1,255*0.6,255*0.8)
		draw_set_color(c_fuchsia)
		draw_circle(x+s_x,y+s_y,50*s*light_radius,false)
		draw_sprite_ext(blood_sprite_spr11,0,x+s_x,y+s_y,s*10,s*10,0,bc,light_strength_bkd)
		draw_set_color(c_white)
		draw_set_alpha(1)

		//draw_sprite_ext(light_circle,0,x+s_x,y+s_y,0.5,0.5,0,c_white,ok)
		
		
		gpu_set_blendmode(bm_normal)
		
		//var uTime = shader_get_uniform(shader1,"Time");
		//shader_set(shader1)
	    //shader_set_uniform_f(uTime,current_time/1000)
		
		//draw_sprite_ext(redflame,image_index,x+s_x,y+s_y,0.5,0.5,0,c_white,1)
		
		shader_reset()
	
	} else {
		draw_sprite_ext(s_sprite,1,x,y,1,1,0,c_white,1)
	}
	
} else {
	
	draw_set_color(c_fuchsia)
	draw_text(x+20,y,"checkpoint!")
	draw_set_color(c_white)
	 var uTime = shader_get_uniform(shader1,"Time");

	audio_emitter_gain(s_fire_emitter,0)

    shader_set(shader1)
    shader_set_uniform_f(uTime,current_time/1000)
	draw_sprite_ext(s_sprite,0,x,y,1,1,0,c_white,1)
	shader_reset()
}
if player_obj.death {
	audio_emitter_gain(s_fire_emitter,0)	
}
if refreshtext {
	refreshpos+=0.75
	draw_set_color(c_fuchsia)
	if setpoint {
		//draw_text(x,y-refreshpos,"respawn set!")
	} else {
		//sssdraw_text(x,y-refreshpos,"respawn set!")
	}
	draw_set_color(c_white)
	if refreshpos>50 {
		refreshtext = 0	
	}
} else {
	refreshpos = 0	
}
gpu_set_colorwriteenable(true,true,true,true)