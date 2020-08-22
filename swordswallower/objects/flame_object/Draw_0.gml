/// @description MAIN


if !in_camera_range_bigger(tx,ty) {
	return
}
// SET VALUES:
//-----------------------------------------------------------------------------
time			= (time + 0.18 * 0.05) mod 1;

var strength_x	= 0.44 * 0.3;		// [0, 0.3]
var strength_y	= 0.44				// [0, 1]
var size		= 0.5 + 0.25;	// [0.25, 0.75]
var bend		= 0.5 * 2 - 1;		// [-1, +1]


// DRAW:
//-----------------------------------------------------------------------------

//draw_self();

gpu_set_tex_filter(true);		
gpu_set_colorwriteenable(true,true,true,false)
shader_set(shader);
	texture_set_stage(u_distort_tex, distort_tex);
	shader_set_uniform_f(u_time, time);
	shader_set_uniform_f(u_strength,	strength_x, strength_y);
	shader_set_uniform_f(u_size,		size);
	shader_set_uniform_f(u_bend,		bend);
	
	draw_sprite(sprites[sprite], 0, tx, ty);
shader_reset();
gpu_set_colorwriteenable(true,true,true,true)

