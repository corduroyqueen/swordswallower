/// @description Insert description here
// You can write your code in this editor
/// @description MAIN
//surface_set_target(gif_surface)

if keyboard_check_pressed(vk_escape) {
	on = !on	
}
if !on {
	draw_surface(GUI,0,0)	
	return
}

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
		bloom_threshold = lerp(bloom_threshold,0.12,0.05)
		bloom_intensity = lerp(bloom_intensity,0.3,0.05)
		
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




//surface_reset_target()
//draw_surface(gif_surface,0,0)