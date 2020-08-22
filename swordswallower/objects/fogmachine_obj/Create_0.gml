/// @description Insert description here
// You can write your code in this editov
num = 5
xs = array_create(num)
for (i=0;i<num;i++) {
	xs[i] = 8000 + sprite_width * i
}

distort_sprite	= spr_heat_haze_leopard;

shader			= shader_heat_haze;
distort_tex		= sprite_get_texture(distort_sprite, 0);
u_distort_tex	= shader_get_sampler_index(shader, "distort_tex");
u_time			= shader_get_uniform(shader, "time");
u_size			= shader_get_uniform(shader, "size");		// should be turned into a constant once you're happy with the setting
u_strength		= shader_get_uniform(shader, "strength");	// should be turned into a constant once you're happy with the setting

u_show_result	= shader_get_uniform(shader, "show_result");// debug only. remove this and related lines inside the shader

time			= 0;