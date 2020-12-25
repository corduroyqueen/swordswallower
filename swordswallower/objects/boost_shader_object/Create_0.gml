/// @description Insert description here
// You can write your code in this editor
/// @description Init



//-----------------------------------------------------------------------------
#region SPRITE & SHADER (mandatory):
//-----------------------------------------------------------------------------
sprites			= [spr_boost_simple_s, spr_flame_jagged_s, spr_flame_gradient];
sprite			= 0;
distort_sprite	= spr_flame_distortion_map;
distort_tex		= sprite_get_texture(distort_sprite, 0);

shader			= shader_flame;
u_distort_tex	= shader_get_sampler_index(shader, "distort_tex");
u_time			= shader_get_uniform(shader, "time");
u_strength		= shader_get_uniform(shader, "strength");
u_size			= shader_get_uniform(shader, "size");
u_bend			= shader_get_uniform(shader, "bend");

time			= random(1);

tx = x
ty = y

px = 0
py = 0
#endregion

perlin_tex = sprite_get_texture(perlin1,0)

u_perlin_tex	= shader_get_sampler_index(perlin_fadeout_shader, "perlin_tex");
u_time2			= shader_get_uniform(perlin_fadeout_shader, "time");
u_tolerance		= shader_get_uniform(perlin_fadeout_shader, "tolerance");
u_inverse		= shader_get_uniform(perlin_fadeout_shader, "inverse");
range = 1.00
ang=0

okx = 0
oky = 0

particle_timer = 0
particle_timer_m = 6
particle_polarity = 1