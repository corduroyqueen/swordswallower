
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
if (!surface_exists(final_surface)) final_surface = surface_create(1920,1080);
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


draw_set_color(c_dkgray)
for (var a=0;a<ashes_size;a++) {
	
	ashes_hsp[|a] += random_range(-1,1)
	ashes_vsp[|a] += random_range(-1,1)
	
	ashes_x[|a] += ashes_hsp[|a] - player_obj.camxdiff
	ashes_y[|a] += ashes_vsp[|a] - player_obj.camydiff
	
	if ashes_x[|a]<-50 || ashes_x[|a]>2000  {
		ashes_x[|a]=1970
		ashes_y[|a] = ashes_sy[|a]
		ashes_vsp[|a] = 0
		ashes_hsp[|a] = ashes_hsp_c
	}
	if ashes_y[|a]<-20 { 
		ashes_y[|a]=1083
	}
	if ashes_y[|a]>1100 { 
		ashes_y[|a]=-3
	}
	
	
	draw_circle(ashes_x[|a],ashes_y[|a],3,false)
}
draw_set_color(c_white)
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
if room==subtemple01 {
	if (21137 < (player_obj.camy + 1080)) {
		water_shader_script(0,21137)
	}

	if (3730 < (player_obj.camy + 1080)) && (3730 > (player_obj.camy)) && !instance_exists(title_screen_obj) {
		//water_shader_script(max(0,25640-player_obj.camx),3730)
		water_shader_script(0,3730)
	}
}


/// @description Insert description here
// You can write your code in this editor
/// @description MAIN
//surface_set_target(gif_surface)

surface_set_target(final_surface)



if !level1_master.bloom_on {
	draw_surface(GUI,0,0)	
} else {

// SET VALUES:
//-----------------------------------------------------------------------------

if player_obj.death {
	//bloom_threshold_v = 0.15
	//bloom_intensity = 0.7
	bloom_threshold_v = 0.15
	bloom_intensity = 0.7
	
	bloom_threshold = 0.15
	bloom_intensity = 0.7
	
} else {
	if player_obj.x>41500 {
		//bloom_threshold = lerp(bloom_threshold,0.12,0.05)
		//bloom_intensity = lerp(bloom_intensity,0.3,0.05)
		bloom_threshold = lerp(bloom_threshold,0.2,0.05)
		bloom_intensity = lerp(bloom_intensity,0.35,0.05)
		
	} else {
		bloom_threshold = 0.29
		bloom_threshold = 0.25
		bloom_threshold = 0.29
		//bloom_threshold = 0.05
		bloom_intensity = 0.3//0.41
		//bloom_intensity = 0.6
		//sdm("?????")
	}
}

//gui_w					= window_get_width()
//gui_h					= window_get_height()

//app_w					= gui_w / 1;
//app_h					= gui_h / 1;

//sdm(app_w)
//sdm(app_h)
//1854
//1043

// DRAW:
//-----------------------------------------------------------------------------
if (!surface_exists(srf_ping)) {
	srf_ping = surface_create(1920, 1080);
	bloom_texture = surface_get_texture(srf_ping);
}
if (!surface_exists(srf_pong)) {
	srf_pong = surface_create(1920, 1080);
}

// 1st pass: Draw brights to bloom surface:
// AppSrf -> srf_ping
shader_set(shader_bloom_lum);
	shader_set_uniform_f(u_bloom_threshold,		bloom_threshold);
	shader_set_uniform_f(u_bloom_range,			bloom_range);
	
	surface_set_target(srf_ping);
	draw_clear_alpha(c_black,0)
	//draw_surface(art_surface_setter.ass_setter,0,0) // level, blood splats, lights
	//draw_surface(blood_surface,0,0) // blood
	draw_surface(GUI, 0, 0);
	unblooming_script()
	//draw_lights()
	//shader_reset()
	
	
	surface_reset_target();
	
// 2nd pass: blur horizontally
// srf_ping -> srf_pong
//gpu_set_tex_filter(true);
shader_set(shader_blur);
	shader_set_uniform_f(u_blur_steps,		blur_steps);
	shader_set_uniform_f(u_sigma,			sigma);
	shader_set_uniform_f(u_blur_vector,		1, 0);
	shader_set_uniform_f(u_texel_size,		texel_w, texel_h);
	
	surface_set_target(srf_pong);
	draw_clear_alpha(c_black,0)
		draw_surface(srf_ping, 0, 0);
	surface_reset_target();
	
// 3rd pass: blur vertically
// srf_pong -> srf_ping
	shader_set_uniform_f(u_blur_vector,		0, 1);
	
	surface_set_target(srf_ping);
		draw_surface(srf_pong, 0, 0);
	surface_reset_target();
	
//gpu_set_tex_filter(false);

// 4th pass: Blend bloom surface with app surface
// AppSrf & srf_ping -> screen
shader_set(shad_bloom_blend);
	shader_set_uniform_f(u_bloom_intensity, bloom_intensity);
	//shader_set_uniform_f(u_bloom_darken, bloom_darken);
	shader_set_uniform_f(u_bloom_saturation, bloom_saturation);
	texture_set_stage(u_bloom_texture, bloom_texture);
	//gpu_set_tex_filter_ext(u_bloom_texture, true);
	
	draw_surface(GUI, 0, 0)
	
shader_reset();
}
if intro_handler.intro_timer>=intro_handler.black_timer_m {
	//draw_set_color(c_black)
	//draw_set_alpha(0.35)
	//draw_rectangle(0,0,1920,1080,false)
	draw_sprite_ext(darkness,0,0,0,1920,1080,0,c_white,1)
	gpu_set_blendmode(bm_add)
	draw_sprite_ext(blood_sprite_spr1,0,player_obj.x-player_obj.camx,player_obj.y-player_obj.camy,1,1,0,c_white,0.07)
}
draw_set_color(c_white)
gpu_set_blendmode(bm_normal)
draw_set_alpha(1)

surface_reset_target()

//{
	// debug:
	//-------------------------------------------------------------------------
	//draw_circle(view_x + 10, view_y + 10, 8, false);
	//draw_circle(view_x + 28, view_y + 10, 8, false);
	//draw_circle(view_x + 10, view_y + 10, 8, true);
	//draw_circle(view_x + 28, view_y + 10, 8, true);
//}



