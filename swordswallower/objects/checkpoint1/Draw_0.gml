/// @description Insert description here
// You can write your code in this editor
draw_set_color(c_white)

if player_obj.intro {
	return	
}

if setpoint {
	//draw_text(x-48,y-64,"checkpoint!")
	//draw_circle(x,y,5,true)
	draw_sprite_ext(statue3,0,x,y,1,1,0,c_white,1)
	
	
	if checkpoint_manager.checkpoint == self && !starting_bool {
		gpu_set_blendmode(bm_add)
		
		if point_distance(x,y,player_obj.camx+640,player_obj.camy+360)<1000 {
			audio_sound_gain(fire_sound,1,0)
			audio_emitter_gain(s_fire_emitter,
			clamp(0,abs(1000- point_distance(x,y,player_obj.camx+640,player_obj.camy+360))/1000,1000)/3
			
			)
			
			audio_emitter_position(s_fire_emitter,
			mean(x,player_obj.x,player_obj.x),
			mean(x,player_obj.y,player_obj.y),
			10)
		} else {
			audio_emitter_gain(s_fire_emitter,0)
		}
		
		
		var ok = random_range(1.1,1.3)
		
		draw_sprite_ext(Ellipse_2,0,x-5,y-130,ok*6,ok*6,0,c_white,0.125)
		
		draw_sprite_ext(Ellipse_2,0,x-5,y-130,ok,ok,0,c_white,1)
		
		
		
		gpu_set_blendmode(bm_normal)
	
		var uTime = shader_get_uniform(shader1,"Time");
		shader_set(shader1)
	    shader_set_uniform_f(uTime,current_time/1000)
	
		draw_sprite(fire,image_index,x-5,y-130)
	
		shader_reset()
	
	}
	
} else {
	
	draw_set_color(c_fuchsia)
	draw_text(x+20,y,"checkpoint!")
	draw_set_color(c_white)
	 var uTime = shader_get_uniform(shader1,"Time");

	audio_emitter_gain(s_fire_emitter,0)

    shader_set(shader1)
    shader_set_uniform_f(uTime,current_time/1000)
	draw_sprite_ext(statue3,0,x,y,1,1,0,c_white,1)
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