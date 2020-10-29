/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

init = true
d_type = 3

/// @description Insert description here
// You can write your code in this editor
/// @description Init
light_strength_bkd = 0.3
light_strength_walls = 0.55
light_radius = 0.25


//-----------------------------------------------------------------------------
#region SPRITE & SHADER (mandatory):
//-----------------------------------------------------------------------------
sprites			= [spr_candle_s, spr_flame_jagged_s, spr_flame_gradient];
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

#endregion