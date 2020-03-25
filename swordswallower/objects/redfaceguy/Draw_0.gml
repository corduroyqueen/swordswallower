/// @description Insert description here
// You can write your code in this editor

draw_self()

if ui_manager.speaking && player_present {
	
	with ui_manager {
		lelx = 100
		lely = 31
		if !surface_exists(lel) {
			lel = surface_create(200,200)	
		}
		draw_set_color(c_black)
		draw_rectangle(player_obj.camx+lelx,player_obj.camy+lely,player_obj.camx+300,player_obj.camy+230,false)	
		
		surface_set_target(lel)
		var uTime = shader_get_uniform(shader1,"Time");
		shader_set(shader1)
	    shader_set_uniform_f(uTime,current_time/10000)
		
		draw_sprite_ext(iso_checkerboard,0, -300,-300,1,1,0,c_red,0.8)
		shader_reset()	
		surface_reset_target()
		
		draw_surface(lel,player_obj.camx+100,player_obj.camy+30)
		line_weight = 3
		draw_set_color(c_white)
		draw_rectangle(player_obj.camx+lelx,player_obj.camy+lely,player_obj.camx+lelx+200,player_obj.camy+lely+line_weight,false)	
		draw_rectangle(player_obj.camx+lelx+200-line_weight,player_obj.camy+lely,player_obj.camx+lelx+200,player_obj.camy+lely+200,false)	
		draw_rectangle(player_obj.camx+lelx,player_obj.camy+lely+200-line_weight,player_obj.camx+lelx+200,player_obj.camy+lely+200,false)	
		draw_rectangle(player_obj.camx+lelx,player_obj.camy+lely,player_obj.camx+lelx+line_weight,player_obj.camy+lely+200,false)	
		
		
		
		
		draw_sprite_ext(
			redfacetest,2,
			player_obj.camx+lelx,
			player_obj.camy+lely,
			1,1,0,c_white,1)
		
		draw_sprite_ext(
			redfacetest,1,
			player_obj.camx+lelx-5,
			player_obj.camy+lely-5,
			1.05,1.05,0,c_black,1)
		
		draw_sprite_ext(
			redfacetest,0,
			player_obj.camx+lelx-5,
			player_obj.camy+lely-5,
			1.05,1.05,0,c_black,1)
		
		draw_sprite_ext(
			redfacetest,1,
			player_obj.camx+lelx,
			player_obj.camy+lely,
			1,1,0,c_white,1)
			
		draw_sprite_ext(
			redfacetest,0,
			player_obj.camx+lelx,
			player_obj.camy+lely,
			1,1,0,c_white,1)
	}
}
