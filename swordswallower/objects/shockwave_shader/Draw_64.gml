/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor



var wave_list_size = ds_list_size(list_of_waves);

if (wave_list_size <= 0) {
	
	if (!surface_exists(blood_surface)) {
		blood_surface = surface_create(1920,1080)
	}
	
	surface_set_target(blood_surface);
	//surface_set_target(blood_surface)
	//draw_clear_alpha($FF7F7F, 1);
	//gpu_set_colofrwriteenable(true,true,true,false)
	//draw_sprite(scary_skull,0,50,50)
	draw_clear_alpha(c_white,0)
	
	//shader_set(shader_blood_alpha)
	//gpu_set_colofrwriteenable(true,true,true,true)
	////draw_sprite(blood_sprite_spr,0,250,250)
	//draw_sprite(blood_sprite_spr,0,600,250)
	var blood_n = instance_number(blood_obj)
	var cx =player_obj.camx
	var cy =player_obj.camy
	//gpu_set_colorwriteenable(true,true,true,false)
	for (i=0;i<blood_n;i++) {
		var o = instance_find(blood_obj,i)
		draw_sprite_ext(blood_sprite_spr,0,o.x-cx,o.y-cy,o.image_xscale*0.3,o.image_yscale*0.3,0,c_white,1)
	}
	//shader_reset()
	//gpu_set_colorwriteenable(true,true,true,true)
	surface_reset_target()
	//sdm(surface_get_target())
	//surface_reset_target()
	
	draw_surface(application_surface, 0, 0);
	//gpu_set_colorwriteenable(true,true,true,false)
	shader_set(shader_blood_alpha)
	//if keyboard_check(ord("K")) { u_blood_var -= 0.01 }
	//if keyboard_check(ord("L")) { u_blood_var += 0.01 }
	
	//u_blood_var = clamp(u_blood_var,1.0,5.0)
	u_blood_var = 4
	shader_set_uniform_f(u_blood_trans,u_blood_var)
	draw_surface(blood_surface, 0,0)
	shader_reset()
	//gpu_set_colorwriteenable(true,true,true,true)
	strength_input = 0
} else {
	// set values based on sliders. In a game you'd use constants inside the shader instead
	var fx_strength	= strength_input
	var aberration	= 0.0
	var subimage	= 0
		
	// create waves surface:
	if (!surface_exists(srf_waves)) {
		srf_waves = surface_create(view_w * srf_waves_scale, view_h * srf_waves_scale);
		tex_waves = surface_get_texture(srf_waves);
	}
	
	
	surface_reset_target()
	
	/////////////////////;
	
	// draw wave sprite to waves surface:
	surface_set_target(srf_waves);
	draw_clear_alpha($FF7F7F, 1);
	gpu_set_blendmode_ext(bm_dest_color, bm_src_color);
	shader_set(shd_add_normals);
		
	var w, this_wave;
	//var wave_list_size = ds_list_size(list_of_waves);
	for (w = 0; w < wave_list_size; w++) {
		this_wave = list_of_waves[|w];
		draw_sprite_ext(sprite, subimage,
						(this_wave[|waveparam.xx] - camera_get_view_x(view_camera[0])) * srf_waves_scale,
						(this_wave[|waveparam.yy] - camera_get_view_y(view_camera[0])) * srf_waves_scale,
						this_wave[|waveparam.scale] * srf_waves_scale,
						this_wave[|waveparam.scale] * srf_waves_scale,
						0, c_white, this_wave[|waveparam.alpha]);
	}
		
	shader_reset();
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	
	// draw application surface with waves surface as 2nd texture:
	
	shader_set(shader);
		shader_set_uniform_f(u_fx_strength, fx_strength);
		shader_set_uniform_f(u_aspect, aspect);
		shader_set_uniform_f(u_aberration, aberration);
		texture_set_stage(u_tex_waves, tex_waves);
		draw_surface(application_surface, 0, 0);
	shader_reset();
	camera_apply(camera_create_view(0,0, view_wport[view_current], view_hport[view_current]));
	
	
	
	
}

shader_reset();