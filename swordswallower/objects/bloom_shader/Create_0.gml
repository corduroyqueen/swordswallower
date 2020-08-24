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

application_surface_draw_enable(false);
on = true

sigma_v = 0.4
blur_steps_v = 0.3

//0.09 is really cool
bloom_threshold_v = 0.29
bloom_range_v = 0
