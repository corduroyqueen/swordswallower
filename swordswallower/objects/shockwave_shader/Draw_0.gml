/// @description Insert description here
// You can write your code in this editor
//surface_set_target(application_surface)
blood_render()




shader_set(shader_blood_alpha)
u_blood_var = 4
	
	
shader_set_uniform_f(u_blood_trans,u_blood_var)
shader_set_uniform_f(u_blood_r,global.blood_cr)
shader_set_uniform_f(u_blood_g,global.blood_cg)
shader_set_uniform_f(u_blood_b,global.blood_cb)
		
//texture_set_stage(,blood_surface)
//surface_set_target(application_surface)
draw_surface(blood_surface, player_obj.camx,player_obj.camy)
//surface_reset_target()
shader_reset()

//surface_reset_target()
//surface_reset_target()