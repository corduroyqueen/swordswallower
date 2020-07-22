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
srf_waves_scale	= 1;
view_w			= 1920
view_h			= 1080

// turn off automatic drawing of the application surface:
application_surface_draw_enable(false);

trigger = false

recording = false

blood_surface = -1
u_blood_trans = shader_get_uniform(shader_blood_alpha, "v_mult");
u_blood_var = 1

GUI = surface_create(1920,1080);

strength_input = 0