
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
	strength_input = 0
} else {
	// set values based on sliders. In a game you'd use constants inside the shader instead
	var fx_strength	= strength_input
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
if (21140 < (player_obj.camy + 1080)) {
	// get distortion variables:
	//-------------------------------------------------------------------------
	water_shift_R		+= 0.50 * 2 - 1 - player_obj.camxdiff;
	water_shift_G		+= 0.20 * 2 - 1 - player_obj.camxdiff;
	water_shift_B		+= 0.32 * 0.5 - 0.25 - player_obj.camydiff;
	var strength_x		= 0.1 * 2;
	var strength_y		= 0.1 * 2;
	var pattern_w		= max(0.001, 2.00) * sprite_get_width(sprite_distort)  * 2;		// mustn't be <= 0
	var pattern_h		= max(0.001, 4.00) * sprite_get_height(sprite_distort) * 0.25;	// mustn't be <= 0

	// get colour variables:
	//-------------------------------------------------------------------------
	var blend_col		= make_color_hsv(0.56  * 255, 0.62  * 255, 0.95 * 255);
	blend_col		= make_color_hsv(0.56  * 255, 0.08  * 255, 1.00 * 255);
	blend_col		= make_color_hsv(0.58  * 255, 0.4  * 255, 1.00 * 255);
	
	var water_col		= make_color_hsv(0.57 * 255, 0.50 * 255, 0.20 * 255);
	water_col		= make_color_hsv(0.57 * 255, 0.08 * 255, 0.05 * 255);
	
	//water_col		= make_color_rgb(17,17,17)
	var col_mix_0		= 0.4 - 0.5;
	var col_mix_1		= 0.60 + 0.5;
	
	var brightness		= 0.50 * 2 - 1;
	//brightness		= 0.50
	var saturation		= 0.25 * 4;
	var contrast		= 0.25 * 4;
	
	// get dimension variables:
	//-------------------------------------------------------------------------
	
	var water_y_scale	= max(0.50, 0.001);
	var water_level		= 21139-player_obj.camy//800//y - view_y;
	var srf_water_w		= 1920
	var srf_water_h		= max(1,1080-water_level) // mustn't be <= 0
	var reflection_h	= min(srf_water_h / water_y_scale, water_level) - 2; // -2 so we always got 2 pixels rows of water colour at the bottom
	
	var srf_scale = 1;
	//switch (toggle_get_group_active(2)) {
	//	case 1:		srf_scale = 0.75; break;
	//	case 2:		srf_scale = 0.66; break;
	//	case 3:		srf_scale = 0.50; break;
	//	case 4:		srf_scale = 0.33; break;
	//	default:	srf_scale = 1; break;
	//}
	
	// get test/debug variables:
	//-------------------------------------------------------------------------
	var	show_result		= 0
	var blend_mode		= 0
	//var show_ducks		= toggle_get_state(3, 0);

	
	// prepare GPU & surface:
	//-------------------------------------------------------------------------
	//gpu_set_tex_filter(toggle_get_state(0, 0));
	//gpu_set_tex_filter(toggle_get_state(0, 0));

	if (!surface_exists(srf_water)) srf_water = surface_create(ceil(srf_water_w * srf_scale), ceil(srf_water_h * srf_scale));
	else surface_resize(srf_water, ceil(srf_water_w * srf_scale), min(200,ceil(srf_water_h * srf_scale)));
	
	
	// draw reflections, water line & flotsam reflections to surface:
	// optimization: flotsam reflectioons should actually only draw when in view
	//-------------------------------------------------------------------------
	surface_set_target(srf_water);
		draw_clear_alpha(water_col, 1);
		draw_surface_part_ext(	GUI, 0, water_level,
								srf_water_w, -400, 0, 0,
								srf_scale, -water_y_scale * srf_scale,
								c_white, 1);
		
		//gpu_set_colorwriteenable(true, true, true, false); // not that important but use this if you notice the water surface looses alpha
		
		draw_sprite_stretched(spr_water_side_line, 0, 0, 0, srf_water_w, 1);
		
		//gpu_set_colorwriteenable(true, true, true, true);
		
		//if (show_ducks)
		//	with (obj_water_side_duck)
		//		draw_sprite_ext(sprite_index, 0,
		//						srf_scale * (x - view_x),
		//						srf_scale * (y - view_y - water_level),
		//						srf_scale, -srf_scale, 0, c_white, 1);
	surface_reset_target();
	
	
	// draw surface back to aplication:
	//-------------------------------------------------------------------------
	surface_set_target(GUI)
	shader_set(watershader);
		shader_set_uniform_f(u_water_shift_RGB,		water_shift_R, water_shift_G, water_shift_B);
		shader_set_uniform_f(u_distort_strength,	strength_x, strength_y);			// could be turned into a constant
		shader_set_uniform_f(u_pattern_size,		pattern_w, pattern_h);				// could be turned into a constant
		shader_set_uniform_f(u_water_col,			color_get_red(water_col)/255, color_get_green(water_col)/255, color_get_blue(water_col)/255); // could be turned into a constant
		shader_set_uniform_f(u_col_mix,				col_mix_0, col_mix_1);				// could be turned into a constant
		shader_set_uniform_f(u_cam_diff,			random_range(-400,400),random_range(-400,400))//player_obj.camxdiff,player_obj.camydiff);				// could be turned into a constant
		shader_set_uniform_f(u_cam_diff,			player_obj.camxdiff,player_obj.camydiff);				// could be turned into a constant
		shader_set_uniform_f(u_brt_sat_con,			brightness, saturation, contrast);	// could be turned into a constant
		
		shader_set_uniform_f(u_blend_mode,			0.0);						// for testing only
		shader_set_uniform_f(u_show_result,			0.00);					// for debugging only
		
		texture_set_stage(u_distort_tex,			distort_tex);
		
		draw_surface_ext(srf_water, 0, 21137-player_obj.camy, 1 / srf_scale, 1 / srf_scale, 0, blend_col, 1);
	surface_reset_target();
	shader_reset();
	
	
	// reset GPU:
	//-------------------------------------------------------------------------
	//gpu_set_tex_filter(false);
	
	
	// draw flotsam:
	// optimization: should actually only draw when in view
	//-------------------------------------------------------------------------
	//if (show_ducks) with (obj_water_side_duck) draw_self();
	
	
	// debug:
	//-------------------------------------------------------------------------
	//draw_circle_colour(view_x + 10, view_y + 10, 8, water_col, water_col, false);
	//draw_circle_colour(view_x + 28, view_y + 10, 8, blend_col, blend_col, false);
	//draw_circle(	   view_x + 10, view_y + 10, 8, true);
	//draw_circle(	   view_x + 28, view_y + 10, 8, true);
}

//{
	// debug:
	//-------------------------------------------------------------------------
	//draw_circle(view_x + 10, view_y + 10, 8, false);
	//draw_circle(view_x + 28, view_y + 10, 8, false);
	//draw_circle(view_x + 10, view_y + 10, 8, true);
	//draw_circle(view_x + 28, view_y + 10, 8, true);
//}



