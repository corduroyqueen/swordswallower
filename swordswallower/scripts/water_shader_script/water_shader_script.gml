xinput = argument0
yinput = argument1

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
	var water_level		= yinput-player_obj.camy//800//y - view_y;
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
	else surface_resize(srf_water, ceil(srf_water_w * srf_scale), min(400,ceil(srf_water_h * srf_scale)));
	
	
	// draw reflections, water line & flotsam reflections to surface:
	// optimization: flotsam reflectioons should actually only draw when in view
	//-------------------------------------------------------------------------
	surface_set_target(srf_water);
		//with tar_obj {
		//	draw_sprite_ext(water_spr,0,x,y,image_xscale,image_yscale,image_angle,c_white,image_alpha)
		//}
		draw_clear_alpha(water_col, 1);
		draw_surface_part_ext(	GUI, 0, water_level,
								srf_water_w, -1000, 0, 0,
								srf_scale, -water_y_scale * srf_scale,
								c_white, 1);
		
		//gpu_set_colorwriteenable(true, true, true, false); // not that important but use this if you notice the water surface looses alpha
		
		draw_sprite_stretched(spr_water_side_line, 0, 0, 0, srf_water_w, 1);
		
		
		//gpu_set_colorwriteenable(1,1,1,1)
		if player_obj.y<12000 {
			gpu_set_blendmode(bm_subtract)
			with sprite_mask_obj {
				draw_sprite_ext(black,0,x-player_obj.camx,0,image_xscale,image_yscale,image_angle,image_blend,1)
			}
		
		
			gpu_set_blendmode(bm_normal)
		}
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
		
		draw_surface_ext(srf_water, xinput, yinput-player_obj.camy, 1 / srf_scale, 1 / srf_scale, 0, blend_col, 1);
		
		shader_reset();
		with reflection_obj {
			draw_sprite_ext(sprite,image_index,x-player_obj.camx,y-player_obj.camy,image_xscale,image_yscale,image_angle,image_blend,1)
		}
	surface_reset_target();
	
	
	
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