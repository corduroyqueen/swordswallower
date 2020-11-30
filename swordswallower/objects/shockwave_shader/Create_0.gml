/// @description Insert description here
// You can write your code in this editor
sprite			= shockwave_normal_1; //_256

shader			= ShockwaveDistortion;
u_fx_strength	= shader_get_uniform(shader, "fx_strength");
u_aspect		= shader_get_uniform(shader, "aspect");
u_aberration	= shader_get_uniform(shader, "aberration");
u_tex_waves		= shader_get_sampler_index(shader, "tex_waves");
aspect			= 1920 / 1080
tex_waves		= -1;

// wave parameters:
wave_life		= 0.4 * game_get_speed(gamespeed_fps);	// life in seconds
wave_scale_max	= 2;		// size in pixels in room space
enum waveparam {xx, yy, age, scale, alpha}				// should be in unreferenced script rather

// create waves list which will hold lists for each active wave.
// those lists will be created in step event on click
// and will age and be deleted in step event as well
list_of_waves	= ds_list_create();

// prepare waves surface
srf_waves		= -1;
srf_waves_scale	= 0.5;
view_w			= 1920
view_h			= 1080

// turn off automatic drawing of the application surface:
application_surface_draw_enable(false);

trigger = false

recording = false

blood_surface = -1
u_blood_trans = shader_get_uniform(shader_blood_alpha, "v_mult");
u_blood_var = 1

blood_splat_surface = -1
u_blood_splat_trans = shader_get_uniform(shader_blood_alpha, "v_mult");
u_blood_splat_var = 1

GUI = surface_create(1920,1080);

strength_input = 0

u_blood_r = shader_get_uniform(shader_blood_alpha, "blood_r");
u_blood_g = shader_get_uniform(shader_blood_alpha, "blood_g");
u_blood_b = shader_get_uniform(shader_blood_alpha, "blood_b");

GUI = surface_create(1920,1080);




/// @description Insert description here
// You can write your code in this editor
shader_bloom_lum		= shader_bloom_filter_luminance;
u_bloom_threshold		= shader_get_uniform(shader_bloom_lum, "bloom_threshold");
u_bloom_range			= shader_get_uniform(shader_bloom_lum, "bloom_range");

shader_blur				= shader_blur_2_pass_gauss_lerp;
u_blur_steps			= shader_get_uniform(shader_blur, "blur_steps");
u_sigma					= shader_get_uniform(shader_blur, "sigma");
u_blur_vector			= shader_get_uniform(shader_blur, "blur_vector");
u_texel_size			= shader_get_uniform(shader_blur, "texel_size");

shad_bloom_blend		= shader_bloom_blend;
u_bloom_intensity		= shader_get_uniform(shader_bloom_blend, "bloom_intensity");
u_bloom_darken			= shader_get_uniform(shader_bloom_blend, "bloom_darken");
u_bloom_saturation		= shader_get_uniform(shader_bloom_blend, "bloom_saturation");
u_bloom_texture			= shader_get_sampler_index(shader_bloom_blend, "bloom_texture");

bloom_texture			= -1;
srf_ping				= -1;
srf_pong				= -1;

gui_w					= display_get_gui_width();
gui_h					= display_get_gui_height();

app_w					= gui_w / 1;
app_h					= gui_h / 1;

texel_w					= 1 / app_w;
texel_h					= 1 / app_h;


on = true

sigma_v = 0.4
blur_steps_v = 0.3

//0.09 is really cool
//0.29 with 0.5 intensit
//blood happens at 0.23
bloom_threshold_v = 0.29

//bloom_threshold_v = 0.2

bloom_range_v = 0

bloom_intensity_v = 0.41
//bloom_intensity_v = 0.5

bloom_darken_v = 0.0
bloom_sat_v = 0.6

srf_ping = surface_create(1920, 1080);
srf_pong = surface_create(1920, 1080);
bloom_texture = surface_get_texture(srf_ping);

//target_surface = surface_create(1920,1080)

gif_surface = surface_create(1920,1080)

 blur_steps		= round(blur_steps_v * 15) + 1;
 sigma			= max(sigma_v, 0.0001);
 bloom_threshold = bloom_threshold_v;
 bloom_range		= bloom_range_v;
 bloom_intensity	= bloom_intensity_v * 2;
// bloom_darken	= 1 - bloom_darken_v;
 bloom_saturation= bloom_sat_v * 2;
 



sprite_distort		= spr_water_side_distortion;
srf_water = surface_create(1920, 1080);
watershader				= water_shader;
u_distort_tex		= shader_get_sampler_index(watershader, "distort_tex");
u_water_shift_RGB	= shader_get_uniform(watershader, "water_shift_RGB");
u_distort_strength	= shader_get_uniform(watershader, "distort_strength");	// could be turned into a constant
u_pattern_size		= shader_get_uniform(watershader, "pattern_size");		// could be turned into a constant
u_water_col			= shader_get_uniform(watershader, "water_col");			// could be turned into a constant
u_col_mix			= shader_get_uniform(watershader, "col_mix");			// could be turned into a constant
u_brt_sat_con		= shader_get_uniform(watershader, "brt_sat_con");		// could be turned into a constant

u_cam_diff		= shader_get_uniform(watershader, "cam_diff");		// could be turned into a constant

u_blend_mode		= shader_get_uniform(watershader, "blend_mode");			// for testing only
u_show_result		= shader_get_uniform(watershader, "show_result");		// for debugging only

distort_tex			= sprite_get_texture(sprite_distort, 0);
water_shift_R		= 0;
water_shift_G		= 0;
water_shift_B		= 0;
srf_water			= -1;