
//surface_set_target(application_surface)
//blood_render()
//shader_set(shader_blood_alpha)
//u_blood_var = 4
	
	
//shader_set_uniform_f(u_blood_trans,u_blood_var)
//shader_set_uniform_f(u_blood_r,global.blood_cr)
//shader_set_uniform_f(u_blood_g,global.blood_cg)
//shader_set_uniform_f(u_blood_b,global.blood_cb)
		
////texture_set_stage(,blood_surface)
////surface_set_target(application_surface)
//draw_surface(blood_surface, 0,0)
////surface_reset_target()
//shader_reset()

////surface_reset_target()
//surface_reset_target()


if (!surface_exists(GUI)) GUI = surface_create(1920,1080);
surface_set_target(GUI);

//gpu_set_colorwriteenable(true, true, true, true)
if !player_obj.death || player_obj.respawn_timer>58 {
	draw_clear_alpha(c_black,0)
	
}
/// @description Insert description here
// You can write your code in this editor
/// @description Insert description here
// You can write your code in this editor

//if (!surface_exists(target_surface)) {
//	target_surface = surface_create(1920,1080)
//}

var wave_list_size = ds_list_size(list_of_waves);

if (wave_list_size <= 0) {
	//blood_splat_render()
	//sdm(surface_get_target())
	//surface_reset_target()
	//surface_set_target(target_surface)
	////THIS O
	//gpu_set_colorwriteenable(true,true,true,false)
	//if keyboard_check(ord("K")) { u_blood_var -= 0.01 }
	//if keyboard_check(ord("L")) { u_blood_var += 0.01 }
	//u_blood_var = clamp(u_blood_var,1.0,5.0)
	//draw_surface(art_surface_setter.art_surface,mouse_x,mouse_y)
	//surface_reset_target()
	draw_surface(application_surface, 0, 0);
	//draw_surface(blood_splat_surface,0,0)
	//gpu_set_colorwriteenable(true,true,true,true)
	strength_input =0
} else {
	// set values based on sliders. In a game you'd use constants inside the shader instead
	var fx_strength	= 0.11//strength_input
	//var aberration	= 0.0
	//var subimage	= 0
		
	// create waves surface:
	if (!surface_exists(srf_waves)) {
		srf_waves = surface_create(view_w * srf_waves_scale, view_h * srf_waves_scale);
		tex_waves = surface_get_texture(srf_waves);
	}
	
	
	//surface_reset_target()
	//blood_render()
	//blood_splat_render()
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
		draw_sprite_ext(sprite, 0,
						(this_wave[|waveparam.xx] - player_obj.camx) * srf_waves_scale,
						(this_wave[|waveparam.yy] - player_obj.camy) * srf_waves_scale,
						this_wave[|waveparam.scale] * srf_waves_scale,
						this_wave[|waveparam.scale] * srf_waves_scale,
						0, c_white, this_wave[|waveparam.alpha]);
	}
		
	shader_reset();
	gpu_set_blendmode(bm_normal);
	surface_reset_target();
	
	// draw application surface with waves surface as 2nd texture:
	//surface_set_target(target_surface)
	
	shader_set(shader);
		shader_set_uniform_f(u_fx_strength, fx_strength);
		//shader_set_uniform_f(u_aspect, aspect);
		//shader_set_uniform_f(u_aberration, aberration);
		texture_set_stage(u_tex_waves, tex_waves);
		draw_surface(application_surface, 0, 0);
	shader_reset();
	
	//shader_set(shader_blood_alpha)
	//u_blood_var = 4
	//shader_set_uniform_f(u_blood_trans,u_blood_var)
	//draw_surface(blood_surface, 0,0)
	//shader_reset()
	
	//surface_reset_target()
	
	//draw_surface(blood_splat_surface,0,0)
	//camera_apply(camera_create_view(0,0, view_wport[view_current], view_hport[view_current]));
	//surface_set_target(application_surface);
	
	
}
surface_reset_target();

shader_reset();








/// @description draw water

//-----------------------------------------------------------------------------
// GET ALWAYS NEEDED VARS:
//-----------------------------------------------------------------------------
//var view_y			= camera_get_view_y(view_camera[0]);
//var view_x			= camera_get_view_x(view_camera[0]);
//var app_h			= surface_get_height(GUI);

//-----------------------------------------------------------------------------
// DRAW WATER IF IN VIEW:
//-----------------------------------------------------------------------------
if (21137 < (player_obj.camy + 1080)) {
	water_shader_script(0,21137)
}

if (3730 < (player_obj.camy + 1080)) && (3730 > (player_obj.camy)) {
	//water_shader_script(max(0,25640-player_obj.camx),3730)
	water_shader_script(0,3730)
}

//{
	// debug:
	//-------------------------------------------------------------------------
	//draw_circle(view_x + 10, view_y + 10, 8, false);
	//draw_circle(view_x + 28, view_y + 10, 8, false);
	//draw_circle(view_x + 10, view_y + 10, 8, true);
	//draw_circle(view_x + 28, view_y + 10, 8, true);
//}



