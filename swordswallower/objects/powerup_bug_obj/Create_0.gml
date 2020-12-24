//fuck yes

// Inherit the parent event
event_inherited();

perlin_tex = sprite_get_texture(blood_sprite_perlin,0)
//perlin_tex = sprite_get_texture(perlin1,0)

u_perlin_tex	= shader_get_sampler_index(perlin_fadein_shader, "perlin_tex");
u_time		= shader_get_uniform(perlin_fadein_shader, "time");
u_tolerance		= shader_get_uniform(perlin_fadein_shader, "tolerance");
u_inverse		= shader_get_uniform(perlin_fadein_shader, "inverse");
range = 0.00
ang=0

okx = 0
oky = 0

